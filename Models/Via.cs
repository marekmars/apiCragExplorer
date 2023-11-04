

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace CragExplorer.Models;

[Table("vias")]
public class Via
{
    public int Id { get; set; }

    [ForeignKey("IdZona")]
    public Zona? Zona { get; set; }
    public int? IdZona { get; set; }
    [ForeignKey("IdEstilo")]
    public Estilo? Estilo { get; set; }
    public int? IdEstilo { get; set; }

    public string? Nombre { get; set; }

    [ForeignKey("IdGrado")]
    public Grado? Grado { get; set; }
    public int? IdGrado { get; set; }

    public int? Chapas { get; set; }

    public double? Altura { get; set; }

}