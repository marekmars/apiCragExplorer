using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace CragExplorer.Models;

[Table("estilos")]
public class Estilo
{
    public int Id { get; set; }
    public string? EstiloN { get; set; }

}