using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using CragExplorer.Models;

namespace CragExplorer.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ViasController : ControllerBase
{
    private readonly DataContext _context;
    private readonly IConfiguration config;
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly IWebHostEnvironment _environment;

    //==========================================
    public ViasController(DataContext context, IConfiguration config, IWebHostEnvironment env, IHttpClientFactory httpClientFactory)
    {
        _context = context;
        this.config = config;
        _environment = env;
        _httpClientFactory = httpClientFactory;
    }

    //==========================================
    [Authorize]
    [HttpGet("{id}/fotos")]
    public async Task<ActionResult<IEnumerable<string>>> GetFotosVia(int id)
    {
        try
        {
            // Encuentra las fotos de las vías en esas zonas (consulta en memoria)
            var fotosEnVias = _context.Fotos
                .Where(foto => foto.IdVia == id) // Filtra por IdVia
                .Select(foto => foto.Url)
                .ToList();

            return Ok(fotosEnVias);
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener las fotos del sector: " + e.Message);
        }
    }

    //==========================================
    [Authorize]
    [HttpGet("{idVia}/foto")]

    public async Task<ActionResult<string>> GetFotoVia(int idVia)
    {
        try
        {
            // Encuentra las zonas en el sector dado
            var viasEnZonas = _context.Vias
                .AsEnumerable()
                .Where(via => via.Id == idVia)
                .ToList();
            // Encuentra las vías en esas zonas (consulta en memoria)
            var fotoEnVia = _context.Fotos
                .AsEnumerable() // Cambio a operación en memoria
                .Where(foto => viasEnZonas.Any(via => via.Id == foto.IdVia))
                .Select(foto => foto.Url)
                .FirstOrDefault(); // Obtenemos la primera foto o null si no hay fotos
            Console.WriteLine("fotoEnVia: " + fotoEnVia);
            if (fotoEnVia != null)
            {
                return Ok(fotoEnVia);
            }
            else
            {
                return NotFound();
            }
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener la foto del sector: " + e.Message);
        }
    }
    //==========================================
    [Authorize]
    [HttpGet("{id}/calificacion")]
    public async Task<ActionResult<IEnumerable<double>>> GetCalificacionVia(int id)
    {
        try
        {
            double estrellas = 0;
            // Encuentra las zonas en el sector dado
            var reseniasEnVias = _context.Resenias
                .Where(resenia => resenia.IdVia == id) // Filtra por IdVia
                .Select(Resenia => Resenia.Calificacion)
                .ToList();

            // Encuentra las fotos de las vías en esas zonas (consulta en memoria)
            foreach (var resenia in reseniasEnVias)
            {
                estrellas += resenia;
            }

            if (reseniasEnVias.Count() != 0)
            {
                double calificacionPromedio = estrellas / reseniasEnVias.Count();
                return Ok(calificacionPromedio);
            }
            else
            {
                return Ok(0);
            }
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener las calificaciones: " + e.Message);
        }
    }
    //==========================================
    [Authorize]
    [HttpGet("{id}/resenias")]
    public async Task<ActionResult<IEnumerable<Resenia>>> GetReseniasVia(int id)
    {
        try
        {

            // Encuentra las zonas en el sector dado
            var reseniasEnVias = _context.Resenias
              .Where(resenia => resenia.IdVia == id)
              .Include(resenia => resenia.Usuario)
              .Include(resenia => resenia.Via)
              .ToList();

            // Encuentra las fotos de las vías en esas zonas (consulta en memoria)


            return Ok(reseniasEnVias);
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener las calificaciones: " + e.Message);
        }
    }

    //==========================================
    [Authorize]
    [HttpGet("{idVia}/calificacionUsuario")]
    public async Task<ActionResult<IEnumerable<double>>> GetCalificacionViaUsuario(int idVia)
    {
        try
        {
             var usuario = _context.Usuarios.FirstOrDefault(x => x.Correo == User.Identity.Name);
            double estrellas = 0;
            // Encuentra las zonas en el sector dado
            var reseniasEnVias = _context.Resenias
                .Where(resenia => resenia.IdVia == idVia&& resenia.IdUsuario == usuario.Id) 
                .Select(Resenia => Resenia.Calificacion)
                .ToList();

            // Encuentra las fotos de las vías en esas zonas (consulta en memoria)
            foreach (var resenia in reseniasEnVias)
            {
                estrellas += resenia;
            }

            if (reseniasEnVias.Count() != 0)
            {
                double calificacionPromedio = estrellas / reseniasEnVias.Count();
                return Ok(calificacionPromedio);
            }
            else
            {
                return Ok(0);
            }
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


