using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TortolasProject.Models;
using TortolasProject.Models.Repositorios;

namespace TortolasProject.Controllers
{
    public class PublicidadController : Controller
    {
        //
        // GET: /Publicidad/
        static EmpresasRepositorio PublicidadRepo = new EmpresasRepositorio();

        [Authorize(Roles = "Junta Directiva")]
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "Junta Directiva")]
        [HttpPost]
        public ActionResult LeerTodos(FormCollection data)
        {
            var id = Guid.Parse(data["idPat"]);

            var publicidad = from ob in PublicidadRepo.ListarPublicidad(id)
                                 select new
                                 {
                                     Loc = ob.LocalizacionPublicidad,
                                     Caracteristicas = ob.Caracteristicas,
                                     idPublicidad = ob.idPublicidad,
                                     idPatro = ob.FKCodigoEmpresa
                                 };
            return Json(publicidad);
        }

        [Authorize(Roles = "Junta Directiva")]
        [HttpPost]
        public void updatePublicidad(FormCollection data)
        {

            Guid idPublicidad = Guid.Parse(data["idpublicidad"]);
            String Caracteristicas = data["caracpublicidadeditar"];
            String Localización = data["locupdate"];
            Guid FKCEmp = Guid.NewGuid();

            tbPublicidad publicidad = new tbPublicidad
            {
                Caracteristicas = Caracteristicas,
                LocalizacionPublicidad = Localización,
                idPublicidad = idPublicidad,
                FKCodigoEmpresa = FKCEmp  //No puedo pasarle un valor nulo
            };


            PublicidadRepo.updatePub(publicidad);
        }

        [Authorize(Roles = "Junta Directiva")]
        [HttpPost]
        public void DeletePublicidad(FormCollection data)
        {
            Guid idPublicidad = Guid.Parse(data["idpublicidad"]);

            PublicidadRepo.deletePub(idPublicidad);
        }

        [Authorize(Roles = "Junta Directiva")]
        [HttpPost]
        public void CreatePublicidad(FormCollection data)
        {
            Guid idPublicidad = Guid.NewGuid();
            String Caracteristicas = data["caracpublicidad"];
            String Localización = data["locpublicidad"];
            Guid FKCEmp = Guid.Parse(data["idpatrocinador"]);

            tbPublicidad publicidad = new tbPublicidad
            {
                Caracteristicas = Caracteristicas,
                LocalizacionPublicidad = Localización,
                idPublicidad = idPublicidad,
                FKCodigoEmpresa = FKCEmp  
            };

            PublicidadRepo.createPub(publicidad);

        }
    }
}
