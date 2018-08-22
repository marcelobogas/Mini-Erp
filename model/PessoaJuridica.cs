using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model
{
    public class PessoaJuridica : Pessoa
    {
        public String CNPJ { get; set; }
        public String RazaoSocial { get; set; }
        public String NomeFantasia { get; set; }
        public String InscEstadual { get; set; }
        public String InscMunicipal { get; set; }
    }
}
