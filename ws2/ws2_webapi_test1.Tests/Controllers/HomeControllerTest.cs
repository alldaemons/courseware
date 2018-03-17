using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ws2_webapi_test1;
using ws2_webapi_test1.Controllers;

namespace ws2_webapi_test1.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Disponer
            HomeController controller = new HomeController();

            // Actuar
            ViewResult result = controller.Index() as ViewResult;

            // Declarar
            Assert.IsNotNull(result);
            Assert.AreEqual("Home Page", result.ViewBag.Title);
        }
    }
}
