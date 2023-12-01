using CongestionTax.Domain;

namespace CongestionTax.Service
{
    public class VehicleTypeFactory
    {
        public static  IVehicle CreateVehicleType(string vehicleType)
        {
            // Assume the vehicleType parameter corresponds to the class name (e.g., "Motorcycle")
            string className = char.ToUpperInvariant(vehicleType[0]) + vehicleType.Substring(1);

            Type type = Type.GetType($"CongestionTax.Domain.{className}, CongestionTax.Domain");

            if (type == null || !typeof(IVehicle).IsAssignableFrom(type))
            {
                throw new ArgumentException("Invalid vehicle type");
            }

            return (IVehicle)Activator.CreateInstance(type);
        }
    }
}
