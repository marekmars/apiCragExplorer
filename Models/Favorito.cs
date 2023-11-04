

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace CragExplorer.Models;
[Table("favoritos")]
public class Favorito
{
  [Key]
  [Column("id")]
  public int Id { get; set; }
  
  [ForeignKey("IdVia")]
  public Via? Via { get; set; }

  [Column("idVia")]
  public int IdVia { get; set; }

  [ForeignKey("IdUsuario")]
  public Usuario? Usuario { get; set; }
  
  [Column("idUsuario")]
  public int IdUsuario { get; set; }

  [Column("fecha")]
  public DateTime Fecha { get; set; }



}