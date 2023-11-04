using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace CragExplorer.Models;
[Table("tipos")]
public class Tipo {
    [Key]
    [Column("id")]
    public int Id { get; set; }
    
     [Column("tipoN")]
     public int TipoN { get; set; }
}