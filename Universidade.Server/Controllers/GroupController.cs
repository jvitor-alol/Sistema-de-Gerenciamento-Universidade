using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Universidade.Server.Data;

namespace Universidade.Server.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class GroupController : ControllerBase
  {
    private readonly AppDbContext _appDbContext;
    public GroupController(AppDbContext appDbContext)
    {
      _appDbContext = appDbContext;
    }
  }
}
