using System.ComponentModel.DataAnnotations;

namespace Universidade.Server.Models
{
  public class User
  {    
    public int Id { get; set; }

    [Required]
    [MaxLength(50)]
    public required string Username { get; set; }

    [Required]
    [MaxLength(255)]
    public required string PasswordHash { get; set; }
  }
}
