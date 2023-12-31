

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace CragExplorer.Models;
[Table("usuarios")]
public class Usuario
{
  [Display(Name = "Codigo")]
  public int Id { get; set; }
  public string? Nombre { get; set; }
  public string? Apellido { get; set; }
  public string? Correo { get; set; }
  public string? Clave { get; set; }
  public string? Avatar { get; set; }
  public bool? Google { get; set; }

}