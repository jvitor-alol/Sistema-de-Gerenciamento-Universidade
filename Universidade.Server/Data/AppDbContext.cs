using Microsoft.EntityFrameworkCore;
using Universidade.Server.Models;

namespace Universidade.Server.Data
{
  public class AppDbContext : DbContext
  {
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Users> Users { get; set; }
  }
}
