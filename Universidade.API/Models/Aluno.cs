using System.ComponentModel.DataAnnotations;

namespace Universidade.API.Models
{
  public class Aluno
  {
    [Key]
    public int Matricula { get; set; }

    [Required]
    [StringLength(100)]
    public string Nome { get; set; }

    [Required]
    [StringLength(100)]
    public string Sobrenome { get; set; }

    [Required]
    [StringLength(11)]
    public string CPF { get; set; }

    [Required]
    [StringLength(12)]
    public string RG { get; set; }

    [Required]
    public DateTime DataNascimento { get; set; }

    [Required]
    [StringLength(10)]
    public string Genero { get; set; }

    [Required]
    [StringLength(50)]
    public string Nacionalidade { get; set; }

    [Required]
    [StringLength(20)]
    public string Telefone { get; set; }

    [Required]
    [EmailAddress]
    [StringLength(100)]
    public string Email { get; set; }

    public int EnderecoId { get; set; }
    public Endereco Endereco { get; set; }

    public int CursoId { get; set; }
    public Curso Curso { get; set; }

    public int TurmaId { get; set; }
    public Turma Turma { get; set; }

    public int UserId { get; set; }
    public User User { get; set; }

    // Relacionamento com Matriculas
    public ICollection<Matricula> Matriculas { get; set; }
  }
}
