using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Universidade.API.Models
{
  public class User
  {    
    public int Id { get; set; }

    [Required]
    [MaxLength(50)]
    public required string Username { get; set; }

    [Required]
    [MaxLength(255)]
    [Column("password_hash")]
    public required string PasswordHash { get; set; }

    // Relacionamento muitos-para-muitos com grupos
    public ICollection<Group> Groups { get; set; }
  }
}
