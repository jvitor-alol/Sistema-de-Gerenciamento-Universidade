using System.ComponentModel.DataAnnotations;

namespace Universidade.API.Models
{
  public class Disciplina
  {
    public int Id { get; set; }

    [Required]
    [StringLength(100)]
    public string Nome { get; set; }

    public int CampusId { get; set; }
    public Campus Campus { get; set; }

    public int ProfessorId { get; set; }
    public Professor Professor { get; set; }

    [Required]
    public int NumeroVagas { get; set; }

    [Required]
    public TimeSpan Horario { get; set; }

    // Relacionamento com Matriculas
    public ICollection<Matricula> Matriculas { get; set; }
  }
}
