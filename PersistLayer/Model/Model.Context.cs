﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PersistLayer.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Entities : DbContext
    {
        public Entities()
            : base("name=Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Evento> Evento { get; set; }
        public virtual DbSet<EventoUsuario> EventoUsuario { get; set; }
        public virtual DbSet<Ingresso> Ingresso { get; set; }
        public virtual DbSet<Local> Local { get; set; }
        public virtual DbSet<Tutorial> Tutorial { get; set; }
        public virtual DbSet<InformacaoBH> InformacaoBH { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<Modalidade> Modalidade { get; set; }
        public virtual DbSet<Perfil> Perfil { get; set; }
    }
}
