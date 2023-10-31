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
                double calificacionRedondeada = Math.Round(calificacionPromedio * 2, MidpointRounding.AwayFromZero) / 2;
                return Ok(calificacionRedondeada);
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


