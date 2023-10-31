using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using CragExplorer.Models;

namespace CragExplorer.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ZonasController : ControllerBase
{
    private readonly DataContext _context;
    private readonly IConfiguration config;
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly IWebHostEnvironment _environment;

    //==========================================
    public ZonasController(DataContext context, IConfiguration config, IWebHostEnvironment env, IHttpClientFactory httpClientFactory)
    {
        _context = context;
        this.config = config;
        _environment = env;
        _httpClientFactory = httpClientFactory;
    }

    //==========================================

    [HttpGet("sector/{idSector}")]
    [Authorize]
    public async Task<ActionResult<List<Zona>>> GetZonasSector(int idSector)
    {
        try
        {
            var zonas = await _context.Zonas
                .Include(z => z.Sector)
                .Where(z => z.IdSector == idSector)
                .ToListAsync();

            return Ok(zonas);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }


    //==========================================


    [HttpGet("{idZona}/vias")]
    [Authorize]
    public async Task<ActionResult<List<Via>>> GetViasZonas(int idZona)
    {
        try
        {
            var vias = await _context.Vias
                .Include(z => z.Zona)
                .ThenInclude(s => s.Sector)
                  .Include(g => g.Grado)
                .Include(e => e.Estilo)
                .Where(z => z.IdZona == idZona)

                .ToListAsync();

            return Ok(vias);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
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


