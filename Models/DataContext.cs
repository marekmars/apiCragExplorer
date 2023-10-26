using Microsoft.EntityFrameworkCore;

namespace CragExplorer.Models;

public class DataContext : DbContext
{
    public DataContext(DbContextOptions<DataContext> options) : base(options)
    {
    }

    public DbSet<Usuario> Usuarios { get; set; } = null!; 
    public DbSet<Sector> Sectores { get; set; } = null!;
  
}
