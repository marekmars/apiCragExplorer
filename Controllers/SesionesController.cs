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

            return Ok(sesionAux);
        }
        catch (Exception e)
        {
            return BadRequest("Error al agregar la sesión: " + e.Message);
        }
    }
    //==========================================
    [Authorize]
    [HttpPut("editar")]
    public async Task<ActionResult> EditarSesion([FromBody] Sesion sesion)
    {
        try
        {
            Console.WriteLine("idVia: " + sesion.IdVia);
            Console.WriteLine("porcentaje: " + sesion.Porcentaje);
            Console.WriteLine("fecha: " + sesion.Fecha);
            Console.WriteLine("IdTipo: " + sesion.IdTipo);
            Console.WriteLine("intentos: " + sesion.Intentos);

            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            Console.WriteLine("usuario: " + usuario.Id);

            if (usuario == null)
            {
                return BadRequest("Usuario no encontrado");
            }

            // Busca la sesión existente por el ID de usuario y el ID de la vía
            Sesion sesionExistente = _context.Sesiones.FirstOrDefault(x => x.Id == sesion.Id && x.IdUsuario == usuario.Id);

            if (sesionExistente == null)
            {
                return NotFound("La sesión no existe, o no tiene permisos");
            }

            // Actualiza los campos de la sesión existente
            sesionExistente.Porcentaje = sesion.Porcentaje;
            sesionExistente.Fecha = sesion.Fecha;
            sesionExistente.IdTipo = sesion.IdTipo;
            sesionExistente.Intentos = sesion.Intentos;

            // Guarda los cambios en la base de datos
            _context.Sesiones.Update(sesionExistente);
            await _context.SaveChangesAsync();

            return Ok(sesionExistente);
        }
        catch (Exception e)
        {
            return BadRequest("Error al editar la sesión: " + e.Message);
        }
    }
    //==========================================
    [Authorize]
    [HttpDelete("eliminar/{id}")]
    public async Task<ActionResult> EliminarSesion(int id)
    {
        try
        {
            Console.WriteLine("=========================================");
            Console.WriteLine("=========================================");
            Console.WriteLine("idSesion: " + id);
            Console.WriteLine("=========================================");
            Console.WriteLine("=========================================");
            // Buscar la sesión por ID
            var sesion = await _context.Sesiones.FindAsync(id);

            if (sesion == null)
            {
                return NotFound(false);
            }

            // Verificar que el usuario autenticado sea el propietario de la sesión (si es necesario)
            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);

            if (usuario == null || sesion.IdUsuario != usuario.Id)
            {
                return Unauthorized(false);
            }

            // Eliminar la sesión del contexto y guardar los cambios
            _context.Sesiones.Remove(sesion);
            await _context.SaveChangesAsync();

            return Ok(true);
        }
        catch (Exception e)
        {
            return BadRequest("Error al eliminar la sesión: " + e.Message);
        }
    }
    //==========================================
    [Authorize]
    [HttpGet("mostrarAscensos")]
    public async Task<ActionResult<IEnumerable<Sesion>>> MostrarAscensos()
    {
        try
        {

            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            Console.WriteLine(usuario.Id);
            // Encuentra las zonas en el sector dado
            var sesiones = _context.Sesiones
                .Where(sesion => sesion.IdUsuario == usuario.Id && sesion.IdTipo <= 3 && sesion.IdTipo != 0)
                .Include(sesion => sesion.Usuario)
                .Include(sesion => sesion.Via)
                    .ThenInclude(via => via.Zona)
                        .ThenInclude(zona => zona.Sector)
                .Include(sesion => sesion.Via)
                    .ThenInclude(via => via.Grado)
                .OrderByDescending(sesion => sesion.Fecha) // Ordenar por la propiedad Fecha de manera ascendente
                .ToList();


            // Encuentra las fotos de las vías en esas zonas (consulta en memoria)


            return Ok(sesiones);
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener las calificaciones: " + e.Message);
        }
    }

    //==========================================
    [Authorize]
    [HttpGet("mostrarProyectos")]
    public async Task<ActionResult<IEnumerable<Sesion>>> MostrarProyectos()
    {
        try
        {

            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            Console.WriteLine(usuario.Id);
            // Encuentra las zonas en el sector dado
            var sesiones = _context.Sesiones
                .Where(sesion => sesion.IdUsuario == usuario.Id && sesion.IdTipo > 3)
                .Include(sesion => sesion.Usuario)
                .Include(sesion => sesion.Via)
                    .ThenInclude(via => via.Zona)
                        .ThenInclude(zona => zona.Sector)
                .Include(sesion => sesion.Via)
                    .ThenInclude(via => via.Grado)
                .OrderByDescending(sesion => sesion.Fecha) // Ordenar por la propiedad Fecha de manera ascendente
                .ToList();


            // Encuentra las fotos de las vías en esas zonas (consulta en memoria)


            return Ok(sesiones);
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener las calificaciones: " + e.Message);
        }
    }
    //==========================================
    [Authorize]
    [HttpGet("cantidadProyectos")]
    public async Task<ActionResult<int>> CantidadProyectos()
    {
        try
        {
            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            Console.WriteLine(usuario.Id);


            int sesionesCount = _context.Sesiones
                .Where(sesion => sesion.IdUsuario == usuario.Id && sesion.IdTipo == 4)
                .Count();

            return Ok(sesionesCount);
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener la cantidad de sesiones: " + e.Message);
        }
    }

    //==========================================

    [Authorize]
    [HttpGet("cantidadAscensos")]
    public async Task<ActionResult<int>> CantidadAscensos()
    {
        try
        {
            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            Console.WriteLine(usuario.Id);

            // Find the count of ascents that meet the criteria
            int ascensosCount = _context.Sesiones
                .Where(sesion => sesion.IdUsuario == usuario.Id && sesion.IdTipo <= 3 || sesion.IdTipo == 5 && sesion.IdTipo != 0)
                .Count();

            return Ok(ascensosCount);
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener la cantidad de ascensiones: " + e.Message);
        }
    }
    //==========================================
    [Authorize]
    [HttpGet("cantidadSesiones")]
    public async Task<ActionResult<int>> CantidadSesiones()
    {
        try
        {
            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            Console.WriteLine(usuario.Id);

            // Find the count of ascents that meet the criteria
            int ascensosCount = _context.Sesiones
                .Where(sesion => sesion.IdUsuario == usuario.Id)
                .Count();

            return Ok(ascensosCount);
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener la cantidad de ascensiones: " + e.Message);
        }
    }

    //==========================================
    [Authorize]
    [HttpGet("topGrado")]
    public async Task<ActionResult<string>> TopGrado()
    {
        try
        {
            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            Console.WriteLine(usuario.Id);

            // Find the highest grade climbed by the user
            var maxGrado = _context.Sesiones
                .Include(sesion => sesion.Via)
                .ThenInclude(via => via.Grado)
                .Where(sesion => sesion.IdUsuario == usuario.Id)
                .OrderByDescending(sesion => sesion.Via.IdGrado)
                .Select(sesion => sesion.Via.Grado.GradoN)
                .FirstOrDefault();

            return Ok(maxGrado);
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener el grado máximo: " + e.Message);
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


