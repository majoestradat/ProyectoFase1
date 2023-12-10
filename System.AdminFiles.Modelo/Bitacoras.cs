using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.AdminFiles.Modelo
{
    public class Bitacoras
    {
        

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int FolderId { get; set; }
        public int? ArchivoId { get; set; }
        public int UsuarioId { get; set; }
        public DateTime Fecha { get; set; }
        public bool Eliminar { get; set; }
        public string Movimiento { get; set; }

        [ForeignKey("FolderId")]
        public virtual Folders? Folders { get; set; }

        [ForeignKey("ArchivoId")]
        public virtual Archivos? Archivos { get; set; }

        [ForeignKey("UsuarioId")]
        public virtual Usuarios Usuarios { get; set; } = new Usuarios()!;



    }
}
