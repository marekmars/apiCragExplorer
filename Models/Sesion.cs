using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace CragExplorer.Models
{
    [Table("sesiones")]
    public class Sesion
{
    [Key]
    [Column("id")]
    public int Id { get; set; }

    // Relación con Usuario
    [ForeignKey("IdUsuario")]
    public Usuario? Usuario { get; set; }
    [Column("idUsuario")]
    public int IdUsuario { get; set; }

    // Relación con Via
    [ForeignKey("IdVia")]
    public Via? Via { get; set; }
    [Column("idVia")]
    public int IdVia { get; set; }

    [Column("porcentaje")]
    public double Porcentaje { get; set; }

    [Column("fecha")]
    public DateTime Fecha { get; set; }

    [ForeignKey("IdTipo")] 
    public Tipo? Tipo { get; set; }
    
    public int IdTipo { get; set; } 
    
    public int Intentos { get; set; }
}

}