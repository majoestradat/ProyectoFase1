using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.AdminFiles.ViewModel
{
    public class DetalleViewModel
    {
        public string Nombre { get; set; } = "";
        public string Tipo { get; set; } = "";
        public string Peso { get; set; } = "";
        public string Ubicacion { get; set; } = "";
        public string CreadoPor { get; set; } = "";
        public string ConsultadoPor { get; set; } = "";
        public string UltimaModificacion { get; set; } = "";
        public string FechaCreado { get; set; } = "";
    }
}
