﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace System.AdminFiles.Herramientas.Interfaces
{
    public interface IPasswordHasher
    {
        string Hash(string password);

        (bool Verified, bool NeedsUpgrade) Check(string hash, string password);
    }
}
