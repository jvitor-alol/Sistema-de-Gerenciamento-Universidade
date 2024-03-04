using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Universidade.Server.Data;

namespace Universidade.Server.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class UserController : ControllerBase
  {
    private readonly AppDbContext _appDbContext;
    public UserController(AppDbContext appDbContext)
    {
      _appDbContext = appDbContext;
    }
  }
}
