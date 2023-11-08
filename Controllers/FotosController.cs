using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using CragExplorer.Models;

namespace CragExplorer.Controllers;

[ApiController]
[Route("api/[controller]")]
public class FotosController : ControllerBase
{
    private readonly DataContext _context;
    private readonly IConfiguration config;
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly IWebHostEnvironment _environment;

    //==========================================
    public FotosController(DataContext context, IConfiguration config, IWebHostEnvironment env, IHttpClientFactory httpClientFactory)
    {
        _context = context;
        this.config = config;
        _environment = env;
        _httpClientFactory = httpClientFactory;
    }
    //==========================================
    [Authorize]
    [HttpPost("agregar/{idVia}")]
    public async Task<ActionResult<IEnumerable<string>>> PostFotosVia([FromForm] List<string> fotos, int idVia)
    {
        try
        {
            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            var via = await _context.Vias.FirstOrDefaultAsync(x => x.Id == idVia);
            int idUsuario = usuario.Id;
            Console.WriteLine(fotos.Count);

            foreach (var item in fotos)
            {

                string urlFoto = item;

                string randomChars = "ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz0123456789";
                string random = "";
                Random rand = new();

                for (int i = 0; i < 10; i++)
                {
                    random += randomChars[rand.Next(randomChars.Length)];
                }


                string nombreFoto = $"via_{idVia}_{random}.jpg";
                Console.WriteLine(nombreFoto);
                if (urlFoto.Contains(","))
                {
                    urlFoto = urlFoto.Split(',')[1];
                }

                // Convierte la cadena base64 en bytes
                byte[] imageBytes = Convert.FromBase64String(urlFoto);

                string wwwPath = _environment.WebRootPath;
                string path = Path.Combine(wwwPath, "Uploads/Fotos");

                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                string fileName = nombreFoto;
                string pathCompleto = Path.Combine(path, fileName);

                // Crea una memoria en la secuencia de bytes
                using (MemoryStream stream = new MemoryStream(imageBytes))
                {
                    // Crea una imagen a partir de la secuencia de bytes
                    using (System.Drawing.Image image = System.Drawing.Image.FromStream(stream))
                    {
                        image.Save(pathCompleto, System.Drawing.Imaging.ImageFormat.Jpeg);
                    }
                }
                Console.WriteLine("ANTES DE CREAR");
                urlFoto = $"uploads/Fotos/{nombreFoto}";
                Console.WriteLine("IDVIA: " + idVia);
                Console.WriteLine("URL: " + urlFoto);
                Console.WriteLine("IDUSUARIO: " + usuario.Id);

                _context.Fotos.Add(new Foto()
                {
                    IdVia = idVia,
                    Url = urlFoto,
                    IdUsuario = usuario.Id,
                });
                _context.SaveChanges();


            }

            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener las fotos del sector: " + e.Message);
        }
    }

    //==========================================
   [Authorize]
[HttpDelete("eliminarFoto/{id}")]
public async Task<ActionResult> EliminarFoto(int id)
{
    try
    {
        // Buscar la foto por ID
        var foto = await _context.Fotos.FindAsync(id);

        if (foto == null)
        {
            return NotFound("La foto no existe.");
        }

        // Verificar que el usuario autenticado sea el propietario de la foto (si es necesario)
        var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);

        if (usuario == null || foto.IdUsuario != usuario.Id)
        {
            return Unauthorized("No tienes permisos para eliminar esta foto.");
        }

        string wwwPath = _environment.WebRootPath;
        string filePath = Path.Combine(wwwPath, foto.Url);

        // if (System.IO.File.Exists(filePath))
        // {
        //     // Elimina el archivo
        //     System.IO.File.Delete(filePath);
        // }
System.IO.File.Delete(filePath);
        // Eliminar la foto del contexto y guardar los cambios
        _context.Fotos.Remove(foto);
        await _context.SaveChangesAsync();

        return Ok("La foto ha sido eliminada con éxito.");
    }
    catch (Exception e)
    {
        return BadRequest($"Error al eliminar la foto: {e.Message}");
    }
}
    //==========================================

    [Authorize]
    [HttpGet("{idVia}/fotoUsuario")]

    public async Task<ActionResult<IEnumerable<string>>> GetFotoUsuarioSesion(int idVia)
    {
        try
        {
            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            // Encuentra las zonas en el sector dado

            // Encuentra las vías en esas zonas (consulta en memoria)
            var fotoEnVia = _context.Fotos
                .AsEnumerable() // Cambio a operación en memoria
                .Where(foto => foto.IdVia == idVia && foto.IdUsuario == usuario.Id)
                .Select(foto => foto.Url)
                .ToList();
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
    [HttpGet("{idVia}/fotos")]

    public async Task<ActionResult<IEnumerable<string>>> GetFotosUsuario(int idVia)
    {
        try
        {
            var usuario = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == User.Identity.Name);
            // Encuentra las zonas en el sector dado

            // Encuentra las vías en esas zonas (consulta en memoria)
            var fotoEnVia = _context.Fotos
                .AsEnumerable() // Cambio a operación en memoria
                .Where(foto => foto.IdVia == idVia && foto.IdUsuario == usuario.Id)
                .ToList();
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


