using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using Universidade.Server.Models;

namespace Universidade.Server.Data
{
  public class AppDbContext : DbContext
  {
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<User> Users { get; set; }
    public DbSet<Group> Groups { get; set; }
    public DbSet<Endereco> Enderecos { get; set; }
    public DbSet<Campus> Campi { get; set; }
    public DbSet<Professor> Professores { get; set; }
    public DbSet<Curso> Cursos { get; set; }
    public DbSet<Turma> Turmas { get; set; }
    public DbSet<Disciplina> Disciplinas { get; set; }
    public DbSet<Servico> Servicos { get; set; }
    public DbSet<Aluno> Alunos { get; set; }
    public DbSet<Matricula> Matriculas { get; set; }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
      // Defina a chave primária composta para a entidade Matricula
      modelBuilder.Entity<Matricula>()
          .HasKey(m => new { m.AlunoId, m.DisciplinaId });
    }
  }
}
