

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace CragExplorer.Models;
[Table("resenias")]
public class Resenia
{

  public int? Id { get; set; }

  [ForeignKey("IdVia")]
  public Via? Via { get; set; }
  public int? IdVia { get; set; }

  [ForeignKey("IdUsuario")]
  public Usuario? Usuario { get; set; }
  public int? IdUsuario { get; set; }

  public string? Comentario { get; set; }
  public int Calificacion { get; set; }

  public DateTime? Fecha { get; set; }



}