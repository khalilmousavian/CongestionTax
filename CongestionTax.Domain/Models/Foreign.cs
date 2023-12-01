using System;

namespace CongestionTax.Domain
{
    public class Foreign : IVehicle
    {
        public bool IsTollFree()
        {
            return true;
        }
    }
}