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

        public InformacaoBH Obter(int ID)
        {
            return Entity.InformacaoBH.FirstOrDefault(a => a.ID == ID);
        }

        public List<InformacaoBH> ListarHoteis()
        {
            return Entity.InformacaoBH.Where(a => a.TipoInformacao == "HOTEL").ToList();
        }

        public List<InformacaoBH> ListarRestaurantes()
        {
            return Entity.InformacaoBH.Where(a => a.TipoInformacao == "RESTAURANTE").ToList();
        }

        public List<InformacaoBH> ListarPontos()
        {
            return Entity.InformacaoBH.Where(a => a.TipoInformacao == "PONTO TURISTICO").ToList();
        }
    }
}
