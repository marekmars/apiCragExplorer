

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace CragExplorer.Models;
[Table("zonas")]
public class Zona
{
  [Display(Name = "Codigo")]
  public int Id { get; set; }

  [ForeignKey("IdSector")]
  public Sector? Sector { get; set; } 
  public int IdSector { get; set; }

  public string? Nombre { get; set; }

}