using System.ComponentModel.DataAnnotations;

namespace Universidade.Server.Models
{
  public class Curso
  {
    public int Id { get; set; }

    [Required]
    [StringLength(100)]
    public string NomeCurso { get; set; }

    public int CampusId { get; set; }
    public Campus Campus { get; set; }

    public int CoordenadorId { get; set; }
    public Professor Coordenador { get; set; }

    // Relacionamento com Turmas
    public ICollection<Turma> Turmas { get; set; }
  }
}
