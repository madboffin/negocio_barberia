using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BarberManager.Dominio;

namespace BarberManager.Persistencia.AppRepositorio
{
    public class RepositorioDetalleServicio : ICRUD<DetalleServicio>
    {
        private readonly AppContexts appContexts;
        public RepositorioDetalleServicio(AppContexts appContexts)
        {
            this.appContexts = appContexts;
        }

        public DetalleServicio Actualizar(DetalleServicio obj)
        {
            var detalleEncontrado = Buscar(obj);
            if (detalleEncontrado != null)
            {
                detalleEncontrado.Id = obj.Id;
                detalleEncontrado.Servicio = obj.Servicio;
                detalleEncontrado.Cantidad = obj.Cantidad;
                detalleEncontrado.Precio = obj.Precio;
                appContexts.SaveChanges();
            }
            return detalleEncontrado;
        }

        public DetalleServicio Adicionar(DetalleServicio obj)
        {
            var detalleServicio = appContexts.DetalleServicios.Add(obj);
            appContexts.SaveChanges();
            return detalleServicio.Entity;
        }

        public DetalleServicio Buscar(DetalleServicio obj)
        {
            return appContexts.DetalleServicios.FirstOrDefault(d => d.Id == obj.Id);
        }

        public IEnumerable<DetalleServicio> Consultar()
        {
            return appContexts.DetalleServicios;
        }

        public int Eliminar(DetalleServicio obj)
        {
            int result = 0;
            var detalleEncontrado = Buscar(obj);
            if (detalleEncontrado == null)
                return result;
            appContexts.DetalleServicios.Remove(detalleEncontrado);
            result = appContexts.SaveChanges();
            return result;
        }
    }
}