using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace BarberManager.Persistencia.AppRepositorio
{
    public class AppContexts : DbContext
    {
protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder
               .UseSqlServer("Server=20.168.13.51; Database=barberia; user=sa; password=P3g4sus.2022*;");
               // .UseSqlServer("Server=LAPTOP-5I9PKCH7; Database=HospiEnCasa; Integrated Security=True;") ;
            }
        }


    }
}