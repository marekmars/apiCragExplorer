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
public class UsuariosController : ControllerBase
{
    private readonly DataContext _context;
    private readonly IConfiguration config;
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly IWebHostEnvironment _environment;

    //==========================================
    public UsuariosController(DataContext context, IConfiguration config, IWebHostEnvironment env, IHttpClientFactory httpClientFactory)
    {
        _context = context;
        this.config = config;
        _environment = env;
        _httpClientFactory = httpClientFactory;
    }

    //==========================================
    [HttpPost("login")]
    [AllowAnonymous]

    public async Task<IActionResult> Login([FromForm] LoginView loginView) // para loguearse
    {
        try
        {
            string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(
                password: loginView.Clave,
                salt: System.Text.Encoding.ASCII.GetBytes(config["Salt"]),
                prf: KeyDerivationPrf.HMACSHA1,
                iterationCount: 1000,
                numBytesRequested: 256 / 8
            ));

            var u = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == loginView.Correo);
            if (u == null || u.Clave != hashed)
            {
                return BadRequest("Nombre de usuario o clave incorrectos");
            }
            else
            {
                var key = new SymmetricSecurityKey(
                    System.Text.Encoding.ASCII.GetBytes(
                        config["TokenAuthentication:SecretKey"]
                    )
                );
                var credenciales = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, u.Correo),
                    new Claim("Id", u.Id+""),
                    new Claim("Correo", u.Correo),
                    new Claim("FullName", u.Nombre + " " + u.Apellido),
                    new Claim("Avatar", u.Avatar)
                };

                var token = new JwtSecurityToken(
                    issuer: config["TokenAuthentication:Issuer"],
                    audience: config["TokenAuthentication:Audience"],
                    claims: claims,
                    expires: DateTime.Now.AddMinutes(60),
                    signingCredentials: credenciales
                );
                return Ok(new JwtSecurityTokenHandler().WriteToken(token));
            }
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }
    //==========================================[HttpPost("validar-token")]
    [HttpPost("login-google")]
    [AllowAnonymous]
    public async Task<IActionResult> LoginGoogle([FromBody] Usuario usuario) // para loguearse
    {
        try
        {
            var user = await _context.Usuarios.FirstOrDefaultAsync(x => x.Correo == usuario.Correo);

            if (user == null)
            {
                user = usuario;
                string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(
                    password: user.Clave,
                    salt: System.Text.Encoding.ASCII.GetBytes(config["Salt"]),
                    prf: KeyDerivationPrf.HMACSHA1,
                    iterationCount: 1000,
                    numBytesRequested: 256 / 8
                ));
                user.Clave = hashed;
                _context.Usuarios.Add(user);
                await _context.SaveChangesAsync();

                using (var client = _httpClientFactory.CreateClient())
                {
                    var response = await client.GetAsync(user.Avatar);

                    if (response.IsSuccessStatusCode)
                    {
                        var imageBytes = await response.Content.ReadAsByteArrayAsync();

                        string wwwPath = _environment.WebRootPath;
                        string path = Path.Combine(wwwPath, "Uploads/avatars");

                        if (!Directory.Exists(path))
                        {
                            Directory.CreateDirectory(path);
                        }

                        string fileName = $"img_avatar_{user.Id}.jpg";
                        string pathCompleto = Path.Combine(path, fileName);

                        using (MemoryStream stream = new MemoryStream(imageBytes))
                        {
                            using (System.Drawing.Image image = System.Drawing.Image.FromStream(stream))
                            {
                                image.Save(pathCompleto, System.Drawing.Imaging.ImageFormat.Jpeg);
                            }
                        }

                        user.Avatar = $"uploads/avatars/{fileName}";
                        _context.Update(user);
                        await _context.SaveChangesAsync();
                    }
                }

            }

            var key = new SymmetricSecurityKey(
                System.Text.Encoding.ASCII.GetBytes(config["TokenAuthentication:SecretKey"])
            );
            var credenciales = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.Correo),
                new Claim("Id", user.Id.ToString()),
                new Claim("Correo", user.Correo),
                new Claim("FullName", user.Nombre + " " + user.Apellido),
                new Claim("Avatar", user.Avatar)
            };

            var token = new JwtSecurityToken(
                issuer: config["TokenAuthentication:Issuer"],
                audience: config["TokenAuthentication:Audience"],
                claims: claims,
                expires: DateTime.Now.AddMinutes(60),
                signingCredentials: credenciales
            );
            Console.WriteLine("TOKEN" + token);
            return Ok(new JwtSecurityTokenHandler().WriteToken(token));
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }

        return BadRequest("Error en la autenticación.");
    }
    //==========================================

    [HttpPost("register")]
    [AllowAnonymous]
    public async Task<IActionResult> RegistrarUsuario([FromBody] Usuario usuario)
    {
        try
        {
            var user = usuario;
            int cantidad = _context.Usuarios.Count(u => u.Correo == usuario.Correo);
            if (cantidad > 0)
            {
                user = null;
                return Ok(user);
            }
            Console.WriteLine("ENTRO" + user.Avatar);
            string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(
               password: user.Clave,
               salt: System.Text.Encoding.ASCII.GetBytes(config["Salt"]),
               prf: KeyDerivationPrf.HMACSHA1,
               iterationCount: 1000,
               numBytesRequested: 256 / 8
           ));
            user.Clave = hashed;
            _context.Usuarios.Add(user);
            _context.SaveChanges();


            string nombreFoto = $"img_avatar_{user.Id}.jpg";

            if (user.Avatar.Contains(","))
            {
                user.Avatar = user.Avatar.Split(',')[1];
            }

            // Convierte la cadena base64 en bytes
            byte[] imageBytes = Convert.FromBase64String(user.Avatar);

            string wwwPath = _environment.WebRootPath;
            string path = Path.Combine(wwwPath, "Uploads/Avatars");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            string fileName = nombreFoto;
            string pathCompleto = Path.Combine(path, fileName);
            // inmueble.Foto = Path.Combine("/Uploads", fileName);


            // Crea una memoria en la secuencia de bytes
            using (MemoryStream stream = new MemoryStream(imageBytes))
            {
                // Crea una imagen a partir de la secuencia de bytes
                System.Drawing.Image image = System.Drawing.Image.FromStream(stream);
                image.Save(pathCompleto, System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            user.Avatar = $"uploads/avatars/{nombreFoto}";
            _context.Update(user);

            await _context.SaveChangesAsync();

            return Ok(user);
        }
        catch (Exception ex)
        {
            return BadRequest("Error Registrar " + ex.Message);
        }
    }

    //==========================================
    // [HttpPost("refresh-token")]
    // [Authorize] // Solo usuarios autenticados pueden acceder a esta acción
    // public async Task<IActionResult> RefreshToken()
    // {

    //     try
    //     {
    //         var correo = User.Identity?.Name;
    //         if (correo == null) return Unauthorized("Token no válido");
    //         var user = await _context.Usuarios.SingleOrDefaultAsync(x => x.Correo == correo);
    //         if (user == null) return BadRequest("El usuario no existe");
    //         // Obtiene el ID del usuario a partir del token actual
    //         var key = new SymmetricSecurityKey(
    //                     System.Text.Encoding.ASCII.GetBytes(
    //                         config["TokenAuthentication:SecretKey"]
    //                     )
    //                 );
    //         var credenciales = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
    //         var claims = new List<Claim>
    //             {
    //                 new Claim("Id", user.Id+""),
    //                 new Claim("Correo", user.Correo),
    //                 new Claim("FullName", user.Nombre + " " + user.Apellido),
    //                 new Claim("Avatar", user.Avatar)
    //             };

    //         var token = new JwtSecurityToken(
    //             issuer: config["TokenAuthentication:Issuer"],
    //             audience: config["TokenAuthentication:Audience"],
    //             claims: claims,
    //             expires: DateTime.Now.AddMinutes(60),
    //             signingCredentials: credenciales
    //         );


    //         // Devuelve el nuevo token
    //         return Ok(new JwtSecurityTokenHandler().WriteToken(token));
    //     }
    //     catch (Exception e)
    //     {
    //         return BadRequest(e.Message);
    //     }
    // }
    //==========================================
    [HttpGet("user")]
    [Authorize]
    public async Task<ActionResult<Usuario>> GetUser() // devuelve el propietario logueado
    {
        try
        {
            Console.WriteLine("ENTRO" + User.Identity?.Name);
            var usuario = User.Identity?.Name;
            Console.WriteLine("ENTRO" + usuario);
            if (usuario == null) return Unauthorized("Tsadoken no válido");
            var dbUser = await _context.Usuarios.SingleOrDefaultAsync(x => x.Correo == usuario);
            if (dbUser == null) return BadRequest("El usuario no existe");
            return dbUser;
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


