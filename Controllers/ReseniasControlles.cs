using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using CragExplorer.Models;

namespace CragExplorer.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ReseniasController : ControllerBase
{
    private readonly DataContext _context;
    private readonly IConfiguration config;
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly IWebHostEnvironment _environment;

    //==========================================
    public ReseniasController(DataContext context, IConfiguration config, IWebHostEnvironment env, IHttpClientFactory httpClientFactory)
    {
        _context = context;
        this.config = config;
        _environment = env;
        _httpClientFactory = httpClientFactory;
    }

    //==========================================
    [Authorize]
    [HttpPost("agregar")]
    public async Task<ActionResult> AgregarResenia([FromBody] Resenia resenia)
    {

        try
        {
            Console.WriteLine("idVia: " + resenia.IdVia);
            Console.WriteLine("comentario: " + resenia.Comentario);
            Console.WriteLine("calificacion: " + resenia.Calificacion);
            Console.WriteLine("fecha: " + resenia.Fecha);
            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            // Resenia resenia = new();
            // resenia.IdVia = idVia;
            // resenia.Comentario = comentario;
            // resenia.Calificacion = calificacion;
            // resenia.Fecha = fecha;
            if (usuario == null)
            {
                return BadRequest("Usuario no encontrado");
            }
            resenia.IdUsuario = usuario.Id;
            _context.Resenias.Add(resenia);
            await _context.SaveChangesAsync();     

            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest("Error al agregar la resenia: " + e.Message);
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



