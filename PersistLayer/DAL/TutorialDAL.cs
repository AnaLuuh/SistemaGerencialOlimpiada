using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersistLayer.DAL
{
    public class TutorialDAL
    {
        private Entities Entity;

        public TutorialDAL()
        {
            Entity = new Entities();
        }

        public List<Tutorial> Listar()
        {
            return Entity.Tutorial.ToList();
        }

        public Tutorial Obter(int ID)
        {
            return Entity.Tutorial.Where(a => a.ID == ID).SingleOrDefault();
        }
    }
}
