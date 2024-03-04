using System.ComponentModel.DataAnnotations;

namespace Universidade.Server.Models
{
  public class Turma
  {
    public int Id { get; set; }

    [Required]
    public int AnoIngresso { get; set; }

    [Required]
    public int AnoFormatura { get; set; }

    public int CursoId { get; set; }
    public Curso Curso { get; set; }

    // Relacionamento com Alunos
    public ICollection<Aluno> Alunos { get; set; }
  }
}
