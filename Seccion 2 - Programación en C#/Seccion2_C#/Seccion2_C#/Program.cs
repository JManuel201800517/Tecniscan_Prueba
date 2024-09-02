// See https://aka.ms/new-console-template for more information
using System;

namespace TareasCSharp
{
    class Program
    {
        static void Main(string[] args)
        {
            // Función para comparar tres números
            Console.WriteLine("FUNCION PARA COMPARAR TRES NUMEROS");
            Console.Write("Ingrese el primer número: ");
            int num1 = int.Parse(Console.ReadLine());
            Console.Write("Ingrese el segundo número: ");
            int num2 = int.Parse(Console.ReadLine());
            Console.Write("Ingrese el tercer número: ");
            int num3 = int.Parse(Console.ReadLine());
            Console.WriteLine(CompararTresNumeros(num1, num2, num3));
            Console.WriteLine("\n");

            // Función par o impar
            Console.WriteLine("FUNCION PARA SABER SI UN NUMERO ES PAR O IMPAR");
            Console.Write("Ingrese un número: ");
            int numeroParImpar = int.Parse(Console.ReadLine());
            Console.WriteLine(EsParOImpar(numeroParImpar));
            Console.WriteLine("\n");

            // Función para calcular el cuadrado de un número
            Console.WriteLine("FUNCION PARA CALCULAR EL CUADRADO DE UN NUMERO");
            Console.Write("Ingrese un número: ");
            int numeroCuadrado = int.Parse(Console.ReadLine());
            Console.WriteLine(CuadradoDeUnNumero(numeroCuadrado));
            Console.WriteLine("\n");

            // Función para anagramas
            Console.WriteLine("FUNCION PARA ANAGRAMAS");
            Console.Write("Ingrese la primera cadena: ");
            string cadena1 = Console.ReadLine();
            Console.Write("Ingrese la segunda cadena: ");
            string cadena2 = Console.ReadLine();
            Console.WriteLine(EsAnagrama(cadena1, cadena2));
            if (EsAnagrama(cadena1, cadena2) != false)
            {
                Console.WriteLine("Es un Anagrama");
            }
            else
            {
                Console.WriteLine("No es un Anagrama");
            }
            Console.WriteLine("\n");
        }

        // Función que compara tres números y devuelve el mayor, indicando si hay números iguales
        static string CompararTresNumeros(int num1, int num2, int num3)
        {
            int mayor = num1;
            if (num2 > mayor) mayor = num2;
            if (num3 > mayor) mayor = num3;

            bool hayIguales = (num1 == num2) || (num2 == num3) || (num1 == num3);

            return $"El mayor es {mayor}. ¿Hay números iguales? --> {(hayIguales ? "Sí" : "No")}";
        }

        // Función que determina si un número es par o impar
        static string EsParOImpar(int numero)
        {
            return (numero % 2 == 0) ? "Par" : "Impar";
        }

        // Función que calcula el cuadrado de un número
        static int CuadradoDeUnNumero(int numero)
        {
            return numero * numero;
        }

        // Función que determina si dos cadenas son anagramas
        static bool EsAnagrama(string cadena1, string cadena2)
        {
            char[] arr1 = cadena1.ToLower().ToCharArray();
            char[] arr2 = cadena2.ToLower().ToCharArray();

            Array.Sort(arr1);
            Array.Sort(arr2);

            return new string(arr1) == new string(arr2);
        }
    }
}

