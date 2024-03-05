using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Universidade.API.Data;
using Universidade.API.Models;

namespace Universidade.API.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class GroupController : ControllerBase
  {
    private readonly AppDbContext _appDbContext;

    public GroupController(AppDbContext context)
    {
      _appDbContext = context;
    }

    // GET: api/Group
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Group>>> GetGroups()
    {
      return await _appDbContext.Groups.ToListAsync();
    }

    // GET: api/Group/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Group>> GetGroup(int id)
    {
      var group = await _appDbContext.Groups.FindAsync(id);

      if (group == null)
      {
        return NotFound();
      }

      return group;
    }

    // POST: api/Group
    [HttpPost]
    public async Task<ActionResult<Group>> PostGroup(Group group)
    {
      _appDbContext.Groups.Add(group);
      await _appDbContext.SaveChangesAsync();

      return CreatedAtAction(nameof(GetGroup), new { id = group.Id }, group);
    }

    // PUT: api/Group/5
    [HttpPut("{id}")]
    public async Task<IActionResult> PutGroup(int id, Group group)
    {
      if (id != group.Id)
      {
        return BadRequest();
      }

      _appDbContext.Entry(group).State = EntityState.Modified;

      try
      {
        await _appDbContext.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!GroupExists(id))
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

    // DELETE: api/Group/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteGroup(int id)
    {
      var group = await _appDbContext.Groups.FindAsync(id);
      if (group == null)
      {
        return NotFound();
      }

      _appDbContext.Groups.Remove(group);
      await _appDbContext.SaveChangesAsync();

      return NoContent();
    }

    private bool GroupExists(int id)
    {
      return _appDbContext.Groups.Any(e => e.Id == id);
    }
  }
}
