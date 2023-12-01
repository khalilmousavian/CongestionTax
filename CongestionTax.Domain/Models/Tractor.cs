namespace CongestionTax.Domain
{
    public class Tractor : IVehicle
    {
        public bool IsTollFree()
        {
            return true;
        }
    }
}