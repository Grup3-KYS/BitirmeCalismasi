﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KYSv2.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class KYSEntities : DbContext
    {
        public KYSEntities()
            : base("name=KYSEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<IzinTalebi> IzinTalebi { get; set; }
        public virtual DbSet<menu> menu { get; set; }
        public virtual DbSet<menuRole> menuRole { get; set; }
        public virtual DbSet<projects> projects { get; set; }
        public virtual DbSet<role> role { get; set; }
        public virtual DbSet<shift> shift { get; set; }
        public virtual DbSet<user> user { get; set; }
    }
}
