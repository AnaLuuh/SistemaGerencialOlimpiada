using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersistLayer.DAL
{
    public class InformacaoDAL
    {
        private Entities Entity;

        public InformacaoDAL()
        {
            Entity = new Entities();
        }

        public InformacaoBH Obter()
        {
            return Entity.InformacaoBH.First();
        }

        public Evento Obter(int ID)
        {
            return Entity.Evento.Where(a => a.ID == ID).SingleOrDefault();
        }
    }
}
