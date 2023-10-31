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
public class SectoresController : ControllerBase
{
    private readonly DataContext _context;
    private readonly IConfiguration config;
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly IWebHostEnvironment _environment;

    //==========================================
    public SectoresController(DataContext context, IConfiguration config, IWebHostEnvironment env, IHttpClientFactory httpClientFactory)
    {
        _context = context;
        this.config = config;
        _environment = env;
        _httpClientFactory = httpClientFactory;
    }

    //==========================================

    [HttpGet("sectores")]
    [Authorize]
    public async Task<ActionResult<List<Sector>>> GetSectores()
    {
        try
        {
            var sectores = await _context.Sectores.ToListAsync();

            return Ok(sectores);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    //==========================================
    [HttpGet("{id}")]
    [Authorize]
    public async Task<ActionResult<Sector>> GetSector(int id)
    {
        try
        {
            var sector = await _context.Sectores.FindAsync(id);

            return Ok(sector);
        }
        catch (Exception e)
        {
            return BadRequest();
        }
    }

    //==========================================[HttpGet("/fotos/{id}")]
    [Authorize]
    [HttpGet("fotos/{id}")]
    public async Task<ActionResult<IEnumerable<string>>> GetFotosSector(int id)
    {
        try
        {
            // Encuentra las zonas en el sector dado
            var zonasEnSector = _context.Zonas
                .Where(zona => zona.IdSector == id)
                .ToList();

            // Encuentra las vías en esas zonas (consulta en memoria)
            var viasEnZonas = _context.Vias
                .AsEnumerable() // Cambio a operación en memoria
                .Where(via => zonasEnSector.Any(zona => zona.Id == via.IdZona))
                .ToList();

            // Encuentra las fotos de las vías en esas zonas (consulta en memoria)
            var fotosEnVias = _context.Fotos
                .AsEnumerable() // Cambio a operación en memoria
                .Where(foto => viasEnZonas.Any(via => via.Id == foto.IdVia))
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
    [HttpGet("calificacion/{id}")]
    public async Task<ActionResult<IEnumerable<double>>> GetCalificacionSector(int id)
    {
        try
        {
            double estrellas = 0;
            // Encuentra las zonas en el sector dado
            var zonasEnSector = _context.Zonas
                .Where(zona => zona.IdSector == id)
                .ToList();

            // Encuentra las vías en esas zonas (consulta en memoria)
            var viasEnZonas = _context.Vias
                .AsEnumerable() // Cambio a operación en memoria
                .Where(via => zonasEnSector.Any(zona => zona.Id == via.IdZona))
                .ToList();
            var reseniasEnVias = _context.Resenias
                        .AsEnumerable() // Cambio a operación en memoria
                        .Where(res => viasEnZonas.Any(via => via.Id == res.IdVia))
                        .Select(res => res.Calificacion)
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
            else return Ok(0);

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


