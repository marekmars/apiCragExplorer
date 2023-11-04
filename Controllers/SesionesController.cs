using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using Microsoft.EntityFrameworkCore;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.AspNetCore.Authorization;
using CragExplorer.Models;
using MailKit.Net.Smtp;
using Microsoft.AspNetCore.Authentication;
using MimeKit;
using Microsoft.AspNetCore.Authentication.Cookies;
using Firebase.Auth.Providers;
using Firebase.Auth;
namespace CragExplorer.Controllers;

[ApiController]
[Route("api/[controller]")]
public class SesionesController : ControllerBase
{
    private readonly DataContext _context;
    private readonly IConfiguration config;
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly IWebHostEnvironment _environment;

    //==========================================
    public SesionesController(DataContext context, IConfiguration config, IWebHostEnvironment env, IHttpClientFactory httpClientFactory)
    {
        _context = context;
        this.config = config;
        _environment = env;
        _httpClientFactory = httpClientFactory;
    }

    //==========================================

    [Authorize]
    [HttpPost("agregar")]
    public async Task<ActionResult> AgregarSesion([FromBody] Sesion sesion)
    {

        try
        {
            Console.WriteLine("idVia: " + sesion.IdVia);
            Console.WriteLine("porcentaje: " + sesion.Porcentaje);
            Console.WriteLine("fecha: " + sesion.Fecha);
            Console.WriteLine("IdTipo: " + sesion.IdTipo);
            Console.WriteLine("intentos: " + sesion.Intentos);

            Sesion sesionAux = sesion;
           

            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            Console.WriteLine("usuario: " + usuario.Id);

            if (usuario == null)
            {
                return BadRequest("Usuario no encontrado");
            }

            // Asignar el ID del usuario al objeto de sesión
            sesionAux.IdUsuario = usuario.Id;

            // Agregar la sesión al contexto y guardar los cambios
            _context.Sesiones.Add(sesionAux);
            await _context.SaveChangesAsync();

            Console.WriteLine(sesionAux);

            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest("Error al agregar la sesión: " + e.Message);
        }
    }


    //==========================================




    [HttpGet("test")]
    [Authorize]

    public async Task<IActionResult> Test()
    {
        try
        {
            return Ok("anduvo");
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }
    }
}


