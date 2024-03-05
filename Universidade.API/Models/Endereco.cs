using System.ComponentModel.DataAnnotations;

namespace Universidade.API.Models
{
  public class Endereco
  {
    public int Id { get; set; }

    [Required]
    [StringLength(100)]
    public string Rua { get; set; }

    [Required]
    public int Numero { get; set; }

    [Required]
    [StringLength(50)]
    public string Bairro { get; set; }

    [Required]
    [StringLength(50)]
    public string Cidade { get; set; }

    [Required]
    [StringLength(2)]
    public string Estado { get; set; }

    // Relacionamento com Campus
    public ICollection<Campus> Campi { get; set; }
    public ICollection<Professor> Professores { get; set; }
    public ICollection<Aluno> Alunos { get; set; }
  }
}
