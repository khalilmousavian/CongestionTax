using CongestionTax.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CongestionTax.Service
{
    public  interface ICongestionTaxService
    {
        Task<double> GetTax(Guid cityId, string vehicle, List<DateTime> dates); 
    }
}
