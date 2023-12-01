using System;

namespace CongestionTax.Domain
{
    public class Motorcycle : IVehicle
    {
        public bool IsTollFree()
        {
            return true;
        }
    }
}