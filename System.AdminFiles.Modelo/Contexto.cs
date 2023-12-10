using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.AdminFiles.Modelo
{
    public class Contexto: DbContext
    {
        public Contexto(DbContextOptions<Contexto> options) : base(options) { }

        public DbSet<Archivos> Archivos { get; set; }
        public DbSet<Folders> Folders { get; set; }
        public DbSet<Usuarios> Usuarios { get; set; }
        public DbSet<Bitacoras> Bitacoras { get; set; }

    }
}
