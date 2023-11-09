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
public class FavoritosController : ControllerBase
{
    private readonly DataContext _context;
    private readonly IConfiguration config;
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly IWebHostEnvironment _environment;

    //==========================================
    public FavoritosController(DataContext context, IConfiguration config, IWebHostEnvironment env, IHttpClientFactory httpClientFactory)
    {
        _context = context;
        this.config = config;
        _environment = env;
        _httpClientFactory = httpClientFactory;
    }

    //==========================================
    [Authorize]
    [HttpPost("agregarBorrar/{idVia}")]
    public async Task<ActionResult<IEnumerable<Resenia>>> AgregarFavorito(int idVia)
    {
        try
        {
            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            var favorito = await _context.Favoritos.FirstOrDefaultAsync(favorito => favorito.IdVia == idVia && favorito.IdUsuario == usuario.Id);

            if (favorito != null)
            {
                _context.Favoritos.Remove(favorito);
                await _context.SaveChangesAsync();
                return Ok(null);
            }
            else
            {
                favorito = new()
                {
                    IdVia = idVia,
                    IdUsuario = usuario.Id,
                    Fecha = DateTime.Now
                };
                _context.Favoritos.Add(favorito);
                await _context.SaveChangesAsync();
                 return Ok(favorito);
            }

           

        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener las calificaciones: " + e.Message);
        }

    }
     //==========================================
    [Authorize]
    [HttpGet("obtenerFavoritos")]
    public async Task<ActionResult<IEnumerable<Favorito>>> ObtenerFavoritos()
    {
        try
        {

            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            Console.WriteLine(usuario.Id);
            // Encuentra las zonas en el sector dado
            var favoritos = _context.Favoritos
                .Where(favorito => favorito.IdUsuario == usuario.Id)
                .Include(favorito => favorito.Usuario)
                .Include(favorito => favorito.Via)
                    .ThenInclude(via => via.Zona)
                        .ThenInclude(zona => zona.Sector)
                .Include(favorito => favorito.Via)
                    .ThenInclude(via => via.Grado)
                .OrderByDescending(favorito => favorito.Fecha) // Ordenar por la propiedad Fecha de manera ascendente
                .ToList();


            // Encuentra las fotos de las vías en esas zonas (consulta en memoria)


            return Ok(favoritos);
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener las calificaciones: " + e.Message);
        }
    }
    //==========================================
        [Authorize]
    [HttpGet("chequear/{idVia}")]
    public async Task<ActionResult<IEnumerable<Resenia>>> ChequearFavorito(int idVia)
    {
        try
        {
            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            var favorito = await _context.Favoritos.FirstOrDefaultAsync(favorito => favorito.IdVia == idVia && favorito.IdUsuario == usuario.Id);
            return Ok(favorito);

        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener las calificaciones: " + e.Message);
        }

    }
    //==========================================




    [HttpGet("test")]

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


