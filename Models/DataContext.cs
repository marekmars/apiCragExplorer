using Microsoft.EntityFrameworkCore;

namespace CragExplorer.Models;

public class DataContext : DbContext
{
    public DataContext(DbContextOptions<DataContext> options) : base(options)
    {
    }

    public DbSet<Usuario> Usuarios { get; set; } = null!;
    public DbSet<Sector> Sectores { get; set; } = null!;
    public DbSet<Via> Vias { get; set; } = null!;
    public DbSet<Zona> Zonas { get; set; } = null!;
    public DbSet<Foto> Fotos { get; set; } = null!;
    public DbSet<Resenia> Resenias { get; set; } = null!;
    public DbSet<Sesion> Sesiones { get; set; } = null!;
    public DbSet<Estilo> Estilos { get; set; } = null!;
    public DbSet<Grado> Grados { get; set; } = null!;
    public DbSet<Favorito> Favoritos { get; set; } = null!;



}
