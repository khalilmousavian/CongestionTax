using System;

namespace CongestionTax.Domain
{
    public class Military : IVehicle
    {
        public bool IsTollFree()
        {
            return true;
        }
    }
}