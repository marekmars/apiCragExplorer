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
                Foto foto = new()
                {
                    IdVia = idVia,
                    Url = urlFoto,
                    IdUsuario = usuario.Id
                };
                // _context.Fotos.Add(foto);
                // _context.SaveChanges();

                var sql = "INSERT INTO `fotos`(`idVia`, `url`, `idUsuario`) VALUES (@p0, @p1, @p2)";
                _context.Database.ExecuteSqlRaw(sql, idVia, urlFoto, idUsuario);
                Console.WriteLine(foto);

            }

            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest("Error al obtener las fotos del sector: " + e.Message);
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


