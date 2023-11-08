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
           Resenia reseniaExistente = _context.Resenias.FirstOrDefault(x => x.IdUsuario == usuario.Id && x.IdVia == resenia.IdVia);
           Console.WriteLine("resenia: " + resenia.Calificacion);
            if (usuario == null)
            {
                return BadRequest("Usuario no encontrado");
            }
            if(reseniaExistente != null)
            {
                return StatusCode(409, "La reseña ya existe para esta entidad.");

            }

            resenia.IdUsuario = usuario.Id;
            _context.Resenias.Add(resenia);
            await _context.SaveChangesAsync();

            return Ok(resenia);
        }
        catch (Exception e)
        {
            return BadRequest("Error al agregar la resenia: " + e.Message);
        }
    }
 //==========================================
 [Authorize]
[HttpPut("editar")]
public async Task<ActionResult> EditarResenia([FromBody] Resenia resenia)
{
    try
    {
        Console.WriteLine("idVia: " + resenia.IdVia);
        Console.WriteLine("comentario: " + resenia.Comentario);
        Console.WriteLine("calificacion: " + resenia.Calificacion);
        Console.WriteLine("fecha: " + resenia.Fecha);

        var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);

        if (usuario == null)
        {
            return BadRequest("Usuario no encontrado");
        }
       

        // Busca la reseña existente por el ID de usuario y el ID de la vía
        Resenia reseniaExistente = _context.Resenias.FirstOrDefault(x => x.IdUsuario == usuario.Id && x.Id==resenia.Id);

        // Actualiza los campos de la reseña existente
        reseniaExistente.Comentario = resenia.Comentario;
        reseniaExistente.Calificacion = resenia.Calificacion;
        reseniaExistente.Fecha = resenia.Fecha;
Console.WriteLine(reseniaExistente.Comentario);

        // Guarda los cambios en la base de datos
        _context.Resenias.Update(reseniaExistente);
        await _context.SaveChangesAsync();

        return Ok(reseniaExistente);
    }
    catch (Exception e)
    {
        return BadRequest("Error al editar la reseña: " + e.Message);
    }
}

    //==========================================

    [Authorize]
    [HttpGet("{idVia}/reseniasUsuario")]
    public async Task<ActionResult<Resenia>> GetReseniaViaUsuario(int idVia)
    {
        try
        {

             var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            var reseniasEnVias = _context.Resenias
              .Where(resenia => resenia.IdVia == idVia && resenia.IdUsuario == usuario.Id)
              .Include(resenia => resenia.Usuario)
              .Include(resenia => resenia.Via)
              .FirstOrDefault();

            return Ok(reseniasEnVias);
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener las calificaciones: " + e.Message);
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



