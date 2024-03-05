using System.ComponentModel.DataAnnotations;

namespace Universidade.API.Models
{
  public class Campus
  {
    public int Id { get; set; }

    [Required]
    [StringLength(14)]
    public string CNPJ { get; set; }

    [Required]
    [StringLength(100)]
    public string Nome { get; set; }

    public int EnderecoId { get; set; }
    public Endereco Endereco { get; set; }

    // Relacionamento com Professores
    public ICollection<Professor> Professores { get; set; }

    // Relacionamento com Cursos
    public ICollection<Curso> Cursos { get; set; }
  }

}
