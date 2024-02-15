using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using System;

public class DbConnectionTester
{
  private readonly IConfiguration _configuration;

  public DbConnectionTester(IConfiguration configuration)
  {
    _configuration = configuration;
  }

  public void TestConnection()
  {
    string connectionString = _configuration.GetConnectionString("MySqlConnection");

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
