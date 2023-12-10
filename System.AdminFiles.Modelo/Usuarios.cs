using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace System.AdminFiles.Modelo
{
    public class Usuarios
    {
        public Usuarios()
        {
            Bitacoras = new HashSet<Bitacoras>();
            Folders = new HashSet<Folders>();
            Archivos = new HashSet<Archivos>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Usuario { get; set; } = ""!;
        public string Contrasena { get; set; } = ""!;
        public string Nombre { get; set; } = ""!;
        public string Apellidos { get; set; } = ""!;
        public int? UsuarioIdPadre { get; set; }
        public DateTime FechaCreacion { get; set; }
        public bool Activo { get; set; }
        public virtual ICollection<Bitacoras> Bitacoras { get; set; }
        public virtual ICollection<Folders> Folders { get; set; }
        public virtual ICollection<Archivos> Archivos { get; set; }


    }
}