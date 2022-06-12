using MvcApiCrudProject.Models;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Mvc;

namespace MvcApiCrudProject.Controllers
{
    public class OrderController : Controller
    {
        // GET: Order
        public ActionResult Index()
        {
            IEnumerable<MvcOrderModel> callList;
            HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("Orders").Result;
            callList = response.Content.ReadAsAsync<IEnumerable<MvcOrderModel>>().Result;
            return View(callList);
        }

        public ActionResult OrderUpdateAndAddProcess(int id = 0)
        {

            if (id == 0)
            //ıd 0 ise ekelem yapacanı anlarsın eklersin
            {
                return View(new MvcOrderModel());
            }
            else
            //ıd si 0 degilse guncelleme yaparsın 
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("Orders/" + id.ToString()).Result;
                return View(response.Content.ReadAsAsync<MvcOrderModel>().Result);
            }
        }
        [HttpPost]
        public ActionResult OrderUpdateAndAddProcess(MvcOrderModel Order)
        {
            if (Order.OrderId == 0)
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PostAsJsonAsync("Orders", Order).Result;
                TempData["SuccessMessage"] = "başarılı şekilde kaydedildi"; //eklerken postu kullanıd
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PutAsJsonAsync("Orders/" + Order.OrderId, Order).Result;
                TempData["SuccessMessage"] = "update basarılı";
            }
            return RedirectToAction("Index");
        }

        public ActionResult OrderDelete(int id)
        {

            HttpResponseMessage response = GlobalVariables.WebApiClient.DeleteAsync("Orders/" + id.ToString()).Result;
            TempData["SuccessMessage"] = "silme başarılı";
            return RedirectToAction("Index");
        }



    }
}