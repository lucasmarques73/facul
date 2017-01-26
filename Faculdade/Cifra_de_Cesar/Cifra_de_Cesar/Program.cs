﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cifra_de_Cesar
{
    class Program
    {
        static void Main(string[] args)
        {
            string texto_crip_asc = "", texto_cript = "", texto_original ="", texto_tabela = "";
            int chave;

            Console.WriteLine("Digite a chave");
            chave = int.Parse(Console.ReadLine());
            Console.WriteLine("Digite um texto");
            texto_original = Console.ReadLine().ToUpper(); 
            ConfigurarJanela();

            while (true)
            {
                try
                {
                    Console.Clear();
                    Console.WriteLine("|------------------------------------|");
                    Console.WriteLine("1 - Criptografia");
                    Console.WriteLine("2 - Descriptografia");
                    Console.WriteLine("0 - Sair");
                    Console.WriteLine("|------------------------------------|");
                    Console.Write("Opção:");
                    int op = int.Parse(Console.ReadLine());


                    if (op == 1)
                    {
                       string texto =  criptografia(texto_original);

                       Console.WriteLine(texto);
                    }
                    else if (op == 2)
                    {
                        descriptografia();
                    }
                    else if (op == 0)
                    {
                        break;
                    }
                    else
                    {
                        Console.WriteLine("OPÇÃO INVÁLIDA!");

                    }
                    Console.WriteLine("|--------------------------------------------- |");
                    Console.WriteLine("|  PRECIONE ALGUMA TELCA PARA VOLTAR AO MENU   |");
                    Console.WriteLine("|--------------------------------------------- |");
                    Console.ReadLine();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("|--------------------------------------------- |");
                    Console.WriteLine("ERRO:");
                    Console.WriteLine(ex.Message);

                    Console.WriteLine("|--------------------------------------------- |");
                    Console.WriteLine("|  PRECIONE ALGUMA TELCA PARA VOLTAR AO MENU   |");
                    Console.WriteLine("|--------------------------------------------- |");
                    Console.ReadLine();
                }
            }
          
        }
            

        static string criptografia(string pass)
        {
            string  texto_cript = "", texto_tabela = "";
            int chave = 7;

           
           
            //Pega o texto digitado pelo usuario e converto os espaços e pontuação para as letras da tabela
            texto_tabela = pass.ToUpper().Replace(" ","WBRW").Replace(",", "WVRW").Replace(".", "WPTW").Replace(";", "WPVW").Replace(":", "WDPW").Replace("!", "WEXW").Replace("?", "WINW").Replace("-", "WHFW");

          
            for (int i = 0; i < texto_tabela.Length; i++)
            {
                //Devolve o codigo ASCII da letra
                int ASCII = (int)texto_tabela[i];

                //Coloca a chave fixa adicionando n posições no numero da tabela ASCII
                int ASCIIC = ASCII + chave;
                //subtrai 65 do numero obtido para que possa ser feito o MOD 26
                int texto_menos_65 = ASCIIC - 65;
                // faz o resto da divisao por 26 e obtem um numero de 0 a 25
                int mod = (texto_menos_65 % 26);
                //depois de obter um numero de 0 a 25, somamos 65 para obter o numero da letra em codigo ascii
                int texto_mais_65 = mod + 65;

               
               //Concatena o texto e o coloca na variável sem mod
               texto_cript += Char.ConvertFromUtf32(texto_mais_65);
            }

        
           return(texto_cript);
         
            
            
            
            
        }

        static void descriptografia()
        {
            string texto_crip_asc = "", texto_cript = "", texto_original = "", texto_tabela = "";
            int chave;

            Console.Clear();
            Console.WriteLine("Digite a chave");
            chave = int.Parse(Console.ReadLine());
            Console.WriteLine("Digite um texto");
            texto_original = Console.ReadLine().ToUpper();
           

            for (int i = 0; i < texto_original.Length; i++)
            {
                //Devolve o codigo ASCII da letra
                int ASCII = (int)texto_original[i];

                //Coloca a chave fixa subtraindo n posições no numero da tabela ASCII
                int ASCIIC = ASCII - chave;
                ////subtrai 65 do numero obtido para que possa ser feito o MOD 26
                int texto_menos_65 = ASCIIC - 65;
                // faz o resto da divisao por 26 e obtem um numero de 0 a 25
                int mod = (texto_menos_65 % 26);
                //depois de obter um numero de 0 a 25, somamos 65 para obter o numero da letra em codigo ascii
                int texto_mais_65 = mod + 65;
                //neste caso tivemos que colocar um if, pois se a soma fosse menor que 65 o numero não representaria uma letra em ascii
                if (texto_mais_65 < 65)
                    texto_mais_65 = texto_mais_65 + 26;//entao, se o numero obtido for menor que 65, somamos 26 ao numero e obtemos o codigo ascii do numero

                //Concatena o texto e o coloca na variável
               texto_cript += Char.ConvertFromUtf32(texto_mais_65);
            }


            //Pega o texto digitado pelo usuario e converte as letras da tabela para os espaços e pontuação
            texto_tabela = texto_cript.ToUpper().Replace("WBRW", " ").Replace("WVRW", ",").Replace("WPTW", ".").Replace("WPVW", ";").Replace("WDPW", ":").Replace("WEXW", "!").Replace("WINW", "?").Replace("WHFW", "-");

            //exibe o texto descriptografado já
            Console.WriteLine("----------------------------------------------------");
            Console.WriteLine("Texto Descriptografado");
            Console.WriteLine(texto_tabela);
            Console.WriteLine("----------------------------------------------------");
            
            Console.ReadKey();
        }
        static void ConfigurarJanela()
        {
            Console.Title = "Cifra de Cesar";
            Console.BufferHeight = 40;
            Console.BufferWidth = 100;
            Console.SetWindowSize(100, 40);
        }
    }
}
