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
            return View();
        }

        public ActionResult Haberlesme()
        {
            return View();
        }
        public ActionResult Veri_Alisverisi()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Izin_Talebi()
        {          

            var model = new IzinTalebi();

            return View("Izin_Talebi" , model);
        }
        [HttpGet]
        public ActionResult PersonelEkle()
        {
            List<SelectListItem> role =
                (from i in ent.role.ToList()
                 select new SelectListItem
                 {
                     Text = i.roleName,
                     Value = i.roleID.ToString()
                 }).ToList();
            ViewBag.role = role;

            List<SelectListItem> user =
                (from i in ent.user.ToList()
                 select new SelectListItem
                 {
                     Text = i.isActive.ToString()


                 }).ToList();
            ViewBag.user = user;

            var model = new user();
            return View("PersonelEkle", model);
        }

        //GuncelleSil.cshtml

        public ActionResult GuncelleSil()
        {
            if (TempData["ReturnCode"] != null)
            {
                ViewBag.ReturnCode = TempData["ReturnCode"];
            }
            // sql i cekmek icin
            var users = ent.user.ToList();
            ViewBag.users = users;
            return View("GuncelleSil");
        }

        public ActionResult Guncelle(int id)
        {
            var model = ent.user.FirstOrDefault(r => r.userID == id);
            return View("PersonelEkle", model);
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
            if (userModel.userID == 0)
            {
                //yeni eklencek
                ent.user.Add(userModel);

            }
            else
            {
                //guncelleme islemi
                var model = ent.user.FirstOrDefault(r => r.userID == userModel.userID);

                model.userName = userModel.userName;
                model.userFirstName = userModel.userFirstName;
                model.userLastName = userModel.userLastName;
                model.userPassword = userModel.userPassword;
                model.userPhone = userModel.userPhone;
                model.userAddress = userModel.userAddress;
            }
            ent.SaveChanges();
            TempData["ReturnCode"] = 1;

            return RedirectToAction("Index");
        }


        [ValidateAntiForgeryToken]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Gonder(IzinTalebi izinModel)
        {


            if (!ModelState.IsValid)
            {
                //uyari ver su degerler girilmemis diye ve form ekranina eri don
                ViewBag.ReturnCode = 0;
                var model = new IzinTalebi();
                
                return View("Izin_Talebi", model);
            }
            
            if (izinModel.IzinID == 0)
            {
                //yeni eklencek
                ent.IzinTalebi.Add(izinModel);

            }
            
            ent.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}