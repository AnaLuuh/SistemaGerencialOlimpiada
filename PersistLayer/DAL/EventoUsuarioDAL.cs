using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersistLayer.DAL
{
    public class EventoUsuarioDAL
    {
        private Entities Entity;

        public EventoUsuarioDAL()
        {
            Entity = new Entities();
        }

        public List<EventoUsuario> ListarUsu(int codUsu)
        {
            return Entity.EventoUsuario.Where(a => a.Usuario_ID == codUsu).ToList();
        }

        public List<EventoUsuario> ListarEve(int codEve)
        {
            return Entity.EventoUsuario.Where(a => a.Evento_ID == codEve).ToList();
        }

        public EventoUsuario Obter(int ID)
        {
            return Entity.EventoUsuario.Where(a => a.ID == ID).SingleOrDefault();
        }

        public int Adicionar(EventoUsuario e)
        {
            Entity.EventoUsuario.Add(e);
            Entity.SaveChanges();
            return e.ID;
        }
    }
}
