using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace CragExplorer.Models;

[Table("grados")]
public class Grado
{
    public int Id { get; set; }
    public string? GradoN { get; set; }

}