using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace model
{
    public class Pessoa
    {
        public int IdPessoa { get; set; }
        public DateTime DataCadastro { get; set; }
        public String Situacao { get; set; }
        public String Endereco { get; set; }
        public String Numero { get; set; }
        public String Complemento { get; set; }
        public String Bairro { get; set; }
        public String Cidade { get; set; }
        public String Estado { get; set; }
        public String Cep { get; set; }
        public String Telefone { get; set; }
        public String Email { get; set; }
        public String Observacao { get; set; }
    }
}
