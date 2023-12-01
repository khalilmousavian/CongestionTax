using System;

namespace CongestionTax.Domain
{
    public class Bus : IVehicle
    {
        public bool IsTollFree()
        {
            return true;
        }
    }
}