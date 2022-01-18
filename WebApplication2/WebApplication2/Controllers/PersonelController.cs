using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication2.Models.Veritabani;

namespace WebApplication2.Controllers
{
    public class PersonelController : Controller
    {
        bagla db = new bagla();
        // GET: Personel
        public ActionResult Index()
        {
            var liste = db.TblPersonel.ToList();
            return View(db.TblPersonel.ToList());
        }
        [HttpGet]
        public ActionResult Ekle()
        {
            ViewBag.DepartmanID = new SelectList(db.TblDepartman, "id", "Departman");
            ViewBag.SehirID = new SelectList(db.TblSehir, "id", "Sehir");
            ViewBag.CinsiyerID = new SelectList(db.TblCinsiyet, "id", "Cinsiyet");
            return View();
        }
        [HttpPost]
        public ActionResult Ekle(TblPersonel P)
        {
            db.TblPersonel.Add(P);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Guncelle_Bilgi_Getir(TblPersonel P)
        {
            P = db.TblPersonel.Find(P.id);
            
            ViewBag.SehirID = new SelectList(db.TblSehir, "id", "Sehir",P.SehirID);
            ViewBag.DepartmanID = new SelectList(db.TblDepartman, "id", "departman", P.DepartmanID);
            ViewBag.CinsiyerID = new SelectList(db.TblCinsiyet, "id", "Cinsiyet",P.CinsiyetID);
            return View(P);
        }
        public ActionResult Guncelle(TblPersonel P)
        {
            db.Entry(P).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Sil_Bilgi_Getir(TblPersonel P)
        {
            P = db.TblPersonel.Find(P.id);
            return View(P);
        }
        public ActionResult Sil(TblPersonel P)
        {
            P = db.TblPersonel.Find(P.id);
            db.Entry(P).State = EntityState.Deleted;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}