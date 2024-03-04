using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Universidade.Server.Data;

namespace Universidade.Server.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class UsersController : ControllerBase
  {
    private readonly AppDbContext _appDbContext;
    public UsersController(AppDbContext appDbContext)
    {
      _appDbContext = appDbContext;
    }
  }
}
