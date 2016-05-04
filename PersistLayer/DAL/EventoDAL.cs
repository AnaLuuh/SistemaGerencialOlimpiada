using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersistLayer.DAL
{
    public class EventoDAL
    {
        private Entities Entity;

        public EventoDAL()
        {
            Entity = new Entities();
        }

        public List<Evento> Listar()
        {
            return Entity.Evento.ToList();
        }

        public Evento Obter(int ID)
        {
            return Entity.Evento.Where(a => a.ID == ID).SingleOrDefault();
        }

        public int Adicionar(Evento e)
        {
            Entity.Evento.Add(e);
            Entity.SaveChanges();
            return e.ID;
        }

        public void Atualizar(Evento e)
        {
            var old = Entity.Evento.Where(a => a.ID == e.ID).Single();
            Entity.Entry(old).CurrentValues.SetValues(e);
            Entity.SaveChanges();
        }

        public void Remover(Evento e)
        {
            Entity.Evento.Remove(e);
            Entity.SaveChanges();
        }
    }
}
