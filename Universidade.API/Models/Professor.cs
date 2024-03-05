using System.ComponentModel.DataAnnotations;

namespace Universidade.API.Models
{
  public class Professor
  {
    public int Id { get; set; }

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
    public string EmailProfissional { get; set; }

    [Required]
    [EmailAddress]
    [StringLength(100)]
    public string EmailPessoal { get; set; }

    public int EnderecoId { get; set; }
    public Endereco Endereco { get; set; }

    public int CargaHoraria { get; set; }

    [Required]
    public decimal SalarioHora { get; set; }

    [StringLength(50)]
    public string Especializacao { get; set; }

    public int CampusId { get; set; }
    public Campus Campus { get; set; }

    public int UserId { get; set; }
    public User User { get; set; }

    // Relacionamento com Disciplinas
    public ICollection<Disciplina> Disciplinas { get; set; }
  }
}
