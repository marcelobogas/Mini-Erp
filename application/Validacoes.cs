using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace application
{
    public class Validacoes
    {
        //
        // validação de CPF e CNPJ
        //
        public static bool validarCpf(string cpf)
        {
            int[] multiplicador1 = new int[9] { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] multiplicador2 = new int[10] { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };

            string auxCpf;
            string digito;
            int soma;
            int resto;

            cpf = cpf.Trim();
            cpf = cpf.Replace(".", "").Replace("-", "");
            auxCpf = cpf.Substring(0, 9);

            if (cpf.Length != 11)
                return false;

            soma = 0;
            for (int i = 0; i < 9; i++)
                soma += int.Parse(auxCpf[i].ToString()) * multiplicador1[i];

            resto = soma % 11;

            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = resto.ToString();
            auxCpf = auxCpf + digito;

            soma = 0;
            for (int i = 0; i < 10; i++)
                soma += int.Parse(auxCpf[i].ToString()) * multiplicador2[i];

            resto = soma % 11;

            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = digito + resto.ToString();

            return cpf.EndsWith(digito);
        }
        //
        public static bool validarCnpj(string cnpj)
        {
            int[] multiplicador1 = new int[12] { 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] multiplicador2 = new int[13] { 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };

            string auxCnpj = "";
            string digito;
            int soma;
            int resto;

            cnpj = cnpj.Trim();
            cnpj = cnpj.Replace(".", "").Replace("/", "").Replace("-", "");
            cnpj = cnpj.Substring(0, 12);

            if (cnpj.Length != 14)
                return false;

            soma = 0;
            for (int i = 0; i < 12; i++)
                soma += int.Parse(auxCnpj[i].ToString()) * multiplicador1[i];

            resto = soma % 11;

            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = resto.ToString();
            auxCnpj = auxCnpj + digito;

            soma = 0;
            for (int i = 0; i < 13; i++)
                soma += int.Parse(auxCnpj[i].ToString()) * multiplicador2[i];

            resto = soma % 11;

            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = digito + resto.ToString();

            return cnpj.EndsWith(digito);
        }
        //
    }
}