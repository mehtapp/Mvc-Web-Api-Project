using MvcApiCrudProject.Models;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Mvc;

namespace MvcApiCrudProject.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult Index()
        {
            IEnumerable<MvcCategoryModel> callList;
            HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("Categorys").Result;
            callList = response.Content.ReadAsAsync<IEnumerable<MvcCategoryModel>>().Result;
            return View(callList);
        }
        public ActionResult CategoryAddandUpdate(int id = 0)
        {
            if (id == 0)
            {
                return View(new MvcCategoryModel());
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("Categorys/" + id.ToString()).Result;
                return View(response.Content.ReadAsAsync<MvcCategoryModel>().Result);
            }
        }


        [HttpPost]
        public ActionResult CategoryAddandUpdate(MvcCategoryModel Category)
        {
            if (Category.CategoryId == 0)
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PostAsJsonAsync("Categorys",
                    Category).Result;
                TempData["SuccessMessage"] = "başarılı şekilde kaydedildi.";   //Viewbag ve tempdata kullanılıyr ama temp geçici saklıyot
                //viewbag kalıcı sağlar.
            }
            else
            {
                HttpResponseMessage response = GlobalVariables.WebApiClient.PutAsJsonAsync("Categorys/" + Category.CategoryId, Category).Result;
                TempData["SuccessMessage"] = "update başarılı";
            }
            return RedirectToAction("Index");
        }



        public ActionResult CategoryDelete(int id)
        {

            HttpResponseMessage response = GlobalVariables.WebApiClient.DeleteAsync("Categorys/" + id.ToString()).Result;
            TempData["SuccessMessage"] = "silme başarılı";
            return RedirectToAction("Index");
        }

    }
}