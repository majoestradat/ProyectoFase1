using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.AdminFiles.Modelo
{
    public class Archivos
    {
        public Archivos()
        {
            Bitacoras = new HashSet<Bitacoras>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Archivo { get; set; } = "";
        public string Nombre { get; set; } = "";
        public int FolderId { get; set; }
        public int UsuarioId { get; set; }
        public DateTime FechaCreacion { get; set; }=DateTime.Now;
        public DateTime FechaModificacion { get; set; } = DateTime.Now;
        public bool Activo { get; set; } = true;
        public string Extension { get; set; } = "";

        [ForeignKey("FolderId")]
        public virtual Folders Folders { get; set; }= new Folders()!;

        [ForeignKey("UsuarioId")]
        public virtual Usuarios Usuarios { get; set; } = new Usuarios()!;

        public virtual ICollection<Bitacoras> Bitacoras { get; set; }

    }
}
