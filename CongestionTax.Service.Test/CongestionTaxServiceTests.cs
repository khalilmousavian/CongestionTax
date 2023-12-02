using NUnit.Framework;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CongestionTax.Data;
using CongestionTax.Domain;
using CongestionTax.Service;

[TestFixture]
public class CongestionTaxServiceTests
{
    [Test]
    public void GetTax_ShouldCalculateCorrectTax()
    {
        // Arrange
        var cityId = Guid.NewGuid();
        var vehicle = "Car";
        var dates = new List<DateTime>
        {
            new DateTime(2023, 1, 1, 8, 0, 0), // Assuming toll fee applies on this date and time
            new DateTime(2023, 1, 1, 9, 30, 0),
            new DateTime(2023, 1, 2, 11, 0, 0)
        };

        var dbContextMock = new Mock<ICongestionDbContext>();
        var taxRates = new List<TaxRate>
        {
            new TaxRate { CityId = cityId, StartTime = new TimeSpan(7, 0, 0), EndTime = new TimeSpan(18, 0, 0), Amount = 10 }
        };
        dbContextMock.Setup(x => x.TaxRates).Returns(DbContextMockHelper.CreateDbSetMock(taxRates).Object);

        var Exemptions = new List<Exemption>
        {
            new Exemption {  StartDate = new DateTime(2023, 1, 1), EndDate = new DateTime(2023, 01, 01),  CityId = cityId}
        };
        dbContextMock.Setup(x => x.Exemption).Returns(DbContextMockHelper.CreateDbSetMock(Exemptions).Object);

        var service = new CongestionTaxService(dbContextMock.Object);

        // Act
        var result = service.GetTax(cityId, vehicle, dates);

        // Assert
        Assert.AreEqual(10, result); // Assuming 10 SEK toll fee for the given time interval
    }
}
