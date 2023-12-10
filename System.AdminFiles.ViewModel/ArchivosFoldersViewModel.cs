using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.AdminFiles.ViewModel
{
    public class ArchivosFoldersViewModel
    {
        public int Id { get; set; } 
        public string Archivo { get; set; } = "";
        public string Folder { get; set; } = "";
        public string Path { get; set; } = "";
        public string Nombre { get; set; } = "";
        public string Extension { get; set; } = "";
        public DateTime Fecha { get; set; }=DateTime.Now;
    }
}
