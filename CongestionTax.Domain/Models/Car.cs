using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CongestionTax.Domain
{
    public class Car : IVehicle
    {
        public bool IsTollFree()
        {
            return false;
        }
    }
}