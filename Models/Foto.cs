

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace CragExplorer.Models;

[Table("fotos")]
public class Foto
{
  [Key]
  [Column("id")]
  public int Id { get; set; }

  [ForeignKey("IdVia")]
  public Via? Via { get; set; }

  [Column("idVia")]
  public int? IdVia { get; set; }

  [Column("url")]
  public string? Url { get; set; }
  
 
  [ForeignKey("IdUsuario")]
  public Usuario? Usuario { get; set; }

  [Column("idUsuario")]
  public int IdUsuario { get; set; }

  public override string ToString()
  {
    return $"IdVia: {IdVia}, Url: {Url}, Usuario: {IdUsuario}";
  }
}
