

using System.ComponentModel.DataAnnotations;

namespace CragExplorer.Models;
public class LoginView
{
    [DataType(DataType.EmailAddress)]
    public string? Correo { get; set; }
    [DataType(DataType.Password)]
    public string? Clave { get; set; }
}