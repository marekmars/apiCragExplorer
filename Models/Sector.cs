

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace CragExplorer.Models;
[Table("sectores")]
public class Sector
{
  [Display(Name = "Codigo")]
  public int Id { get; set; }
  public string? Nombre { get; set; }
  public Double? Latitud { get; set; }
  public Double? Longitud { get; set; }

}