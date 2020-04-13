using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using KYSv2.Models;

namespace KYSv2.Controllers
{
    public class HomeController : Controller
    {
        KYSEntities ent = new KYSEntities();
       

        // GET: Home
        public ActionResult Index()
        {
            /* var currentUserId = Convert.ToInt32(HttpContext.User.Identity.Name);

             var currentUser = ent.user.FirstOrDefault(x => x.userID == currentUserId);*/
 


            return View();
        }
        /*
        [HttpGet]
        public ActionResult Profile(int id)
        {
            var user = ent.user.FirstOrDefault(x => x.userID == id);
            if (user == null)
                return HttpNotFound();

            return View(user);
        }*/
        public ActionResult Haberlesme()
        {
            return View();
        }
        public ActionResult Veri_Alisverisi()
        {
            return View();
        }

        public ActionResult Izin_Talebi()
        {
            return View();
        }
        [HttpGet]
        public ActionResult PersonelEkle()
        {
 
            var users = new user();
            return View("PersonelEkle", users) ;
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Kaydet(user userModel)
        {
    

            if (!ModelState.IsValid)
            {
                //uyari ver su degerler girilmemis diye ve form ekranina eri don
                ViewBag.ReturnCode = 0;
                var model = new user();
                
                return View("PersonelEkle", model);
            }
            if (userModel.userID == 0 )
            {
                ent.user.Add(userModel);

            }
            ent.SaveChanges();
            TempData["ReturnCode"] = 1;

            return RedirectToAction("Index");
        }
        public ActionResult GuncelleSil()
        {
            return View();
        }
      

    }
}