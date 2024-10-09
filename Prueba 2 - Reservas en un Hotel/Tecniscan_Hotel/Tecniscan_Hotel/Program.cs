using System;
using System.Data.SqlClient;

class Program
{
    static void Main(string[] args)
    {
        string connectionString = "Server=DESKTOP-QQB05S2;Database=Tecniscan_Hotel;User Id=sa;Password=Delfin100;";
        int opcion = 0;

        do
        {
            Console.WriteLine("");
            Console.WriteLine("Menu Principal");
            Console.WriteLine("");
            Console.WriteLine("1. Listar habitaciones disponibles");
            Console.WriteLine("2. Registrar nueva reserva");
            Console.WriteLine("3. Consultar reservas activas de un cliente");
            Console.WriteLine("4. Salir");
            Console.Write("Elija una opción: ");
            opcion = int.Parse(Console.ReadLine());

            switch (opcion)
            {
                case 1:
                    Console.Clear();
                    ListarHabitacionesDisponibles(connectionString);
                    break;
                case 2:
                    Console.Clear();
                    RegistrarReserva(connectionString);
                    break;
                case 3:
                    Console.Clear();
                    ConsultarReservasDeCliente(connectionString);
                    break;
                case 4:
                    Console.Clear();
                    Console.WriteLine("Saliendo...");
                    break;
                default:
                    Console.Clear();
                    Console.WriteLine("Opción no válida.");
                    break;
            }
        } while (opcion != 4);
    }

    // Función para listar todas las habitaciones disponibles
    public static void ListarHabitacionesDisponibles(string connectionString)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            string query = "SELECT * FROM Habitaciones";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            Console.WriteLine("{0,-5} {1,-20} {2,10}", "ID", "Tipo de Habitación", "Precio por Noche");

            while (reader.Read())
            {
                Console.WriteLine("{0,-5} {1,-20} {2,10:C}",
                    reader["HabitacionID"],
                    reader["TipoHabitacion"],
                    reader["PrecioPorNoche"]);
            }
        }
    }

    // Función para registrar una nueva reserva
    public static void RegistrarReserva(string connectionString)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Solicitar datos
                Console.Write("Ingrese ClienteID: ");
                int clienteID = int.Parse(Console.ReadLine());

                Console.Write("Ingrese HabitacionID: ");
                int habitacionID = int.Parse(Console.ReadLine());

                Console.Write("Ingrese Fecha de Entrada (YYYY-MM-DD): ");
                DateTime fechaEntrada = DateTime.Parse(Console.ReadLine());

                Console.Write("Ingrese Fecha de Salida (YYYY-MM-DD): ");
                DateTime fechaSalida = DateTime.Parse(Console.ReadLine());

                // Validar la existencia del cliente y la habitación
                string clienteQuery = "SELECT COUNT(*) FROM Clientes WHERE ClienteID = @ClienteID";
                SqlCommand clienteCmd = new SqlCommand(clienteQuery, conn);
                clienteCmd.Parameters.AddWithValue("@ClienteID", clienteID);
                int clienteExiste = (int)clienteCmd.ExecuteScalar();

                string habitacionQuery = "SELECT PrecioPorNoche FROM Habitaciones WHERE HabitacionID = @HabitacionID";
                SqlCommand habitacionCmd = new SqlCommand(habitacionQuery, conn);
                habitacionCmd.Parameters.AddWithValue("@HabitacionID", habitacionID);
                object precioPorNocheObj = habitacionCmd.ExecuteScalar();

                if (clienteExiste == 0 || precioPorNocheObj == null)
                {
                    Console.WriteLine("Cliente o Habitación no existe.");
                    return;
                }

                decimal precioPorNoche = (decimal)precioPorNocheObj;

                // Calcular total
                int numeroNoches = (fechaSalida - fechaEntrada).Days;
                decimal total = numeroNoches * precioPorNoche;

                // Insertar reserva
                string reservaQuery = "INSERT INTO Reservas (ClienteID, HabitacionID, FechaEntrada, FechaSalida, Total) VALUES (@ClienteID, @HabitacionID, @FechaEntrada, @FechaSalida, @Total)";
                SqlCommand reservaCmd = new SqlCommand(reservaQuery, conn);
                reservaCmd.Parameters.AddWithValue("@ClienteID", clienteID);
                reservaCmd.Parameters.AddWithValue("@HabitacionID", habitacionID);
                reservaCmd.Parameters.AddWithValue("@FechaEntrada", fechaEntrada);
                reservaCmd.Parameters.AddWithValue("@FechaSalida", fechaSalida);
                reservaCmd.Parameters.AddWithValue("@Total", total);
                reservaCmd.ExecuteNonQuery();

                Console.WriteLine($"Reserva registrada. Total: {total:C}");
            }
        }
        catch (FormatException ex)
        {
            Console.WriteLine("Error en el formato de entrada: " + ex.Message);
        }
        catch (SqlException ex)
        {
            Console.WriteLine("Error en la base de datos: " + ex.Message);
        }
        catch (Exception ex)
        {
            Console.WriteLine("Ocurrió un error inesperado: " + ex.Message);
        }
    }

    // Función para consultar las reservas activas de un cliente
    public static void ConsultarReservasDeCliente(string connectionString)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Solicitar ClienteID
            Console.Write("Ingrese ClienteID: ");
            int clienteID = int.Parse(Console.ReadLine());

            // Consulta de reservas activas
            string query = "SELECT * FROM Reservas WHERE ClienteID = @ClienteID AND FechaSalida > GETDATE()";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@ClienteID", clienteID);
            SqlDataReader reader = cmd.ExecuteReader();

            if (!reader.HasRows)
            {
                Console.WriteLine("No hay reservas activas para este cliente.");
            }
            else
            {
                Console.WriteLine("{0,-5} {1,-12} {2,-15} {3,-15} {4,10}", "ID", "HabitacionID", "Fecha Entrada", "Fecha Salida", "Total");

                while (reader.Read())
                {
                    Console.WriteLine("{0,-5} {1,-12} {2,-15} {3,-15} {4,10:C}",
                        reader["ReservaID"],
                        reader["HabitacionID"],
                        Convert.ToDateTime(reader["FechaEntrada"]).ToString("yyyy-MM-dd"),
                        Convert.ToDateTime(reader["FechaSalida"]).ToString("yyyy-MM-dd"),
                        reader["Total"]);
                }

            }
        }
    }
}
