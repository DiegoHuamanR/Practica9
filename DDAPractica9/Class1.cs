using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DDAPractica9
{
    public class Class1
    {
        private int codigo;
        private string nombre;
        private string area;
        private decimal sueldo;

        public int Codigo
        {
            get { return codigo; }
            set { codigo = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string Area
        {
            get { return area; }
            set { area = value; }
        }

        public decimal Sueldo
        {
            get { return sueldo; }
            set { sueldo = value; }
        }
    }
}