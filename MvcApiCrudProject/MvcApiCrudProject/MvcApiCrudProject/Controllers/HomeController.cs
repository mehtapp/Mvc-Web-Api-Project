using System.Web.Mvc;

namespace MvcApiCrudProject.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult GeneralIndex()
        {
            return View();
        }

        public ActionResult AdminPanel()
        {
            ViewBag.Message = "Your Admin page.";

            return View();
        }
        public ActionResult LoginPage()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}