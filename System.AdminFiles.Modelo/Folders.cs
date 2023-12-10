using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.AdminFiles.Modelo
{
    public class Folders
    {
        public Folders()
        {
            Bitacoras = new HashSet<Bitacoras>();
            Archivos = new HashSet<Archivos>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Folder { get; set; } = "";
        public string PathFolder { get; set; } = "";
        public string Nombre { get; set; } = "";        
        public int UsuarioId { get; set; }
        public DateTime FechaCreacion { get; set; }=DateTime.Now;
        public DateTime FechaModificacion { get; set; } = DateTime.Now;
        public bool Activo { get; set; } = true;
        public int? FolderPadreId { get; set; }


        [ForeignKey("UsuarioId")]
        public virtual Usuarios Usuarios { get; set; }= new Usuarios()!;

        public virtual ICollection<Bitacoras> Bitacoras { get; set; }
        public virtual ICollection<Archivos> Archivos { get; set; }
    }
}
