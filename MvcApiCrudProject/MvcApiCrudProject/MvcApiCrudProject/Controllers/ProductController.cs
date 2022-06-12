using MvcApiCrudProject.Models;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Mvc;

namespace MvcApiCrudProject.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            IEnumerable<MvcProductModel> callList;
            HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("Products").Result;
            callList = response.Content.ReadAsAsync<IEnumerable<MvcProductModel>>().Result;
            return View(callList);
        }

        public ActionResult ProductUpdateAndAddProcess(int id = 0)
        {

            if (id == 0)

            {
                return View(new MvcProductModel());
            }
            else
            //ıd si 0 degilse guncelleme yaparsın 
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("Products/" + id.ToString()).Result;
                return View(response.Content.ReadAsAsync<MvcProductModel>().Result);
            }
        }
        [HttpPost]
        public ActionResult ProductUpdateAndAddProcess(MvcProductModel product)
        {
            if (product.ProductId == 0)
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PostAsJsonAsync("Products", product).Result;
                TempData["SuccessMessage"] = "başarılı şekilde kaydedildi";
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PutAsJsonAsync("Products/" + product.ProductId, product).Result;
                TempData["SuccessMessage"] = "update basarılı";
            }
            return RedirectToAction("Index");
        }

        public ActionResult ProductDelete(int id)
        {

            HttpResponseMessage response = GlobalVariables.WebApiClient.DeleteAsync("Products/" + id.ToString()).Result;
            TempData["SuccessMessage"] = "silme başarılı";
            return RedirectToAction("Index");
        }


    }
}