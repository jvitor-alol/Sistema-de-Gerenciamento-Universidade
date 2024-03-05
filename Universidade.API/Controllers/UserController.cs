using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Universidade.API.Data;
using Universidade.API.Models;

namespace Universidade.API.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class UserController : ControllerBase
  {
    private readonly AppDbContext _appDbContext;

    public UserController(AppDbContext context)
    {
      _appDbContext = context;
    }

    // GET: api/Users
    [HttpGet]
    public async Task<ActionResult<IEnumerable<User>>> GetUsers()
    {
      var users = await _appDbContext.Users.Include(u => u.Groups).ToListAsync();
      return users;
    }


    // GET: api/Users/5
    [HttpGet("{id}")]
    public async Task<ActionResult<User>> GetUser(int id)
    {
      var user = await _appDbContext.Users.FindAsync(id);

      if (user == null)
      {
        return NotFound();
      }

      return user;
    }

    // POST: api/Users
    [HttpPost]
    public async Task<ActionResult<User>> PostUser(User user)
    {
      _appDbContext.Users.Add(user);
      await _appDbContext.SaveChangesAsync();

      return CreatedAtAction(nameof(GetUser), new { id = user.Id }, user);
    }

    // PUT: api/Users/5
    [HttpPut("{id}")]
    public async Task<IActionResult> PutUser(int id, User user)
    {
      if (id != user.Id)
      {
        return BadRequest();
      }

      _appDbContext.Entry(user).State = EntityState.Modified;

      try
      {
        await _appDbContext.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!UserExists(id))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return NoContent();
    }

    // DELETE: api/Users/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteUser(int id)
    {
      var user = await _appDbContext.Users.FindAsync(id);
      if (user == null)
      {
        return NotFound();
      }

      _appDbContext.Users.Remove(user);
      await _appDbContext.SaveChangesAsync();

      return NoContent();
    }

    private bool UserExists(int id)
    {
      return _appDbContext.Users.Any(e => e.Id == id);
    }
  }
}
