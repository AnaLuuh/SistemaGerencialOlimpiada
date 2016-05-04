using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersistLayer.DAL
{
    public class ModalidadeDAL
    {
        private Entities Entity;

        public ModalidadeDAL()
        {
            Entity = new Entities();
        }

        public List<Modalidade> Listar()
        {
            return Entity.Modalidade.ToList();
        }
    }
}
