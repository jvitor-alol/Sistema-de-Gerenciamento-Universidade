using System;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;

namespace MeuProjeto
{
  class Program
  {
    static void Main(string[] args)
    {
      // Carrega as configurações do arquivo appsettings.json
      IConfiguration configuration = new ConfigurationBuilder()
          .AddJsonFile("appsettings.json")
          .Build();

      // Obtém a string de conexão do arquivo de configuração
      string connectionString = configuration.GetConnectionString("MySqlConnection");

      // Tenta estabelecer uma conexão com o banco de dados MySQL
      using (var connection = new MySqlConnection(connectionString))
      {
        try
        {
          connection.Open();
          Console.WriteLine("Conexão com o banco de dados MySQL estabelecida com sucesso!");
        }
        catch (Exception ex)
        {
          Console.WriteLine($"Erro ao tentar conectar ao banco de dados: {ex.Message}");
        }
      }
    }
  }
}
