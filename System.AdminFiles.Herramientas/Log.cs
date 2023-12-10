using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.AdminFiles.Herramientas
{
    public class Log
    {
        public static bool generar(string texto, string file)
        {
            if (!File.Exists(file))
            {
                // Create a file to write to.
                using (StreamWriter sw = File.CreateText(file))
                {
                    sw.WriteLine(texto);
                }
            }
            else
            {
                using (StreamWriter sw = File.AppendText(file))
                {
                    sw.WriteLine(texto);
                }
            }
            return true;
        }
    }
}
