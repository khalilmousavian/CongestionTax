using CongestionTax.Data;
using CongestionTax.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace CongestionTax.Service
{
    public class CongestionTaxService : ICongestionTaxService
    {
        private readonly ICongestionDbContext _dbContext;
        public CongestionTaxService(ICongestionDbContext dbContext)
        {
            _dbContext = dbContext;

        }

        public  double GetTax(Guid cityId, string vehicle, List<DateTime> dates)
        {
            DateTime intervalStart = dates[0];
            double totalFee = 0;
            double maxFeeInInterval = 0;

            foreach (DateTime date in dates)
            {
                double nextFee =   GetTollFee(cityId, date, vehicle);
                if (GetMinutesDifference(intervalStart, date) <= 60)
                {
                    maxFeeInInterval = Math.Max(maxFeeInInterval, nextFee);
                }
                else
                {
                    totalFee += maxFeeInInterval;
                    intervalStart = date;
                    maxFeeInInterval = nextFee;
                }
            }

            totalFee += maxFeeInInterval; // Add fee for the last interval
            return Math.Min(totalFee, 60); // Ensure max SEK 60 cap
        }

        int GetMinutesDifference(DateTime start, DateTime end)
        {
            return (int)(end - start).TotalMinutes;
        }

        private  double  GetTollFee(Guid cityId, DateTime entryTime, string vehicle)
        {

            if ( IsTollFreeDate(entryTime) || IsTollFreeVehicle(vehicle)) return 0;

            //_dbContext.Database.EnsureCreated();

            var hour = entryTime.TimeOfDay;
            var tariff =   _dbContext.TaxRates
                .FirstOrDefault(t => t.CityId == cityId &&

                hour >= t.StartTime && hour <= t.EndTime);

            return tariff?.Amount ?? 0;
        }

        private  bool  IsTollFreeDate(DateTime date)
        {
            if (date.DayOfWeek == DayOfWeek.Saturday || date.DayOfWeek == DayOfWeek.Sunday) return true;

            return   _dbContext.Exemption.Any(d => d.StartDate <= date && d.EndDate >= date);
        }

        private bool IsTollFreeVehicle(string vehicle)
        {
            if (vehicle == null) return false;
            var vehicleType = VehicleTypeFactory.CreateVehicleType(vehicle);

            return vehicleType.IsTollFree();
        }

    }
}

