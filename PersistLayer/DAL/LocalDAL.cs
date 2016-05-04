using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersistLayer.DAL
{
    public class LocalDAL
    {
        private Entities Entity;

        public LocalDAL()
        {
            Entity = new Entities();
        }

        public List<Local> Listar()
        {
            return Entity.Local.ToList();
        }
    }
}
