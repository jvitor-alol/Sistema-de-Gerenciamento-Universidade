using System.ComponentModel.DataAnnotations;

namespace Universidade.Server.Models
{
  public class Servico
  {
    public int Id { get; set; }

    [Required]
    [StringLength(100)]
    public string NomeServico { get; set; }

    public int CampusId { get; set; }
    public Campus Campus { get; set; }
  }
}
