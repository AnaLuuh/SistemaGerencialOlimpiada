using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersistLayer.DAL
{
    public class IngressoDAL
    {
        private Entities Entity;

        public IngressoDAL()
        {
            Entity = new Entities();
        }

        public List<Ingresso> Listar()
        {
            return Entity.Ingresso.ToList();
        }

        public List<Ingresso> ListarEve(int codEve)
        {
            return Entity.Ingresso.Where(a => a.Evento_ID == codEve).ToList();
        }

        public Ingresso ObterEvento(int ID)
        {
            return Entity.Ingresso.Where(a => a.Evento_ID == ID).SingleOrDefault();
        }
    }
}
