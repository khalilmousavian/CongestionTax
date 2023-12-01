using System;

namespace CongestionTax.Domain
{
    public class Diplomat : IVehicle
    {
        public bool IsTollFree()
        {
            return true;
        }
    }
}