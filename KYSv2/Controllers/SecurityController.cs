using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using KYSv2.Models;
using System.Data.Entity;
using System.Security.Cryptography;
using System.Text;

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
            userModel.userPassword = ConvertSHA256(userModel.userPassword);

            var currentUser = ent.
                user
                .Include(y => y.role)
                .FirstOrDefault(r => r.userEmail == userModel.userEmail && r.userPassword == userModel.userPassword && r.isActive == true);

            if (currentUser != null)
            {

                Session["Name"] = currentUser.userFirstName + " " + currentUser.userLastName;

                Session["Department"] = currentUser.role.roleName.ToString();

                FormsAuthentication.SetAuthCookie(currentUser.userID.ToString(), false);
                Session["userId"] = currentUser.userID;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.message = "Bilgilerinizi Kontrol Ediniz.";
                return View();
            }
        }
        public static string ConvertSHA256(string passData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(passData));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}