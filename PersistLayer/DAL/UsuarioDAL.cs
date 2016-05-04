using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersistLayer.DAL
{
    public class UsuarioDAL
    {
        private Entities Entity;

        public UsuarioDAL()
        {
            Entity = new Entities();
        }

        public int Adicionar(Usuario u)
        {
            Entity.Usuario.Add(u);
            Entity.SaveChanges();
            return u.ID;
        }

        public Usuario Obter(int ID)
        {
            return Entity.Usuario.Where(a => a.ID == ID).SingleOrDefault();
        }

        public void Atualizar(Usuario u)
        {
            var old = Entity.Usuario.Where(a => a.ID == u.ID).Single();
            Entity.Entry(old).CurrentValues.SetValues(u);
            Entity.SaveChanges();
        }

        public Usuario Buscar(string email, string senha)
        {
            return Entity.Usuario.Where(a => a.Email == email && a.Senha == senha).SingleOrDefault();
        }

        public Usuario BuscarEmail(string email)
        {
            return Entity.Usuario.Where(a => a.Email == email).SingleOrDefault();
        }
    }
}
