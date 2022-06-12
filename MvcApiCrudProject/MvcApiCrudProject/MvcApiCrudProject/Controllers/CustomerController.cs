using MvcApiCrudProject.Models;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Mvc;

namespace MvcApiCrudProject.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer
        public ActionResult CustomerList()
        {
            IEnumerable<MvcCustomerModel> callList;
            HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("Customers").Result;
            callList = response.Content.ReadAsAsync<IEnumerable<MvcCustomerModel>>().Result;
            return View(callList);
        }
        public ActionResult CustomerUpdateAndAddProcess(int id = 0)
        {

            if (id == 0)
            //ıd 0 ise ekelem yapacanı anlarsın eklersin
            {
                return View(new MvcCustomerModel());
            }
            else
            //ıd si 0 degilse guncelleme yaparsın 
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("Customers/" + id.ToString()).Result;
                return View(response.Content.ReadAsAsync<MvcCustomerModel>().Result);
            }
        }
        [HttpPost]
        public ActionResult CustomerUpdateAndAddProcess(MvcCustomerModel Customer)
        {
            if (Customer.CustomerId == 0)
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PostAsJsonAsync("Customers", Customer).Result;
                TempData["SuccessMessage"] = "başarılı şekilde kaydedildi"; //eklerken postu kullanıd
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PutAsJsonAsync("Customers/" + Customer.CustomerId, Customer).Result;
                TempData["SuccessMessage"] = "update basarılı";
            }
            return RedirectToAction("CustomerList");
        }

        public ActionResult CustomerDelete(int id)
        {

            HttpResponseMessage response = GlobalVariables.WebApiClient.DeleteAsync("Customers/" + id.ToString()).Result;
            TempData["SuccessMessage"] = "silme başarılı";
            return RedirectToAction("CustomerList");
        }

    }
}