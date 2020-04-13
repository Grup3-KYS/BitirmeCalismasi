using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using KYSv2.Models;
using System.Data.Entity;

namespace KYSv2.Controllers
{
    [AllowAnonymous]
    public class SecurityController : Controller
    {
       
        KYSEntities ent = new KYSEntities();
        // GET: Security
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(user userModel)
        {
            var currentUser = ent.
                user
                .Include(y=>y.role)
                .FirstOrDefault(r => r.userEmail == userModel.userEmail && r.userPassword == userModel.userPassword && r.isActive == true);

            if (currentUser != null)
            {
              
                TempData["Name"] = currentUser.userFirstName + " " +currentUser.userLastName;
                
                TempData["Department"] = currentUser.role.roleName;
                 
                FormsAuthentication.SetAuthCookie(currentUser.userID.ToString(), false);
                TempData["userId"] = currentUser.userID;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.message = "Bilgilerinizi Kontrol Ediniz.";
                return View();
            }
        }
    }
}