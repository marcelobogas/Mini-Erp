using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model
{
    public class PessoaFisica : Pessoa
    {
        public String Nome { get; set; }
        public String CPF { get; set; }
        public String RG { get; set; }
        public String Sexo { get; set; }
        public Decimal Limite { get; set; }
        public String ConsumidorFinal { get; set; }
    }
}
