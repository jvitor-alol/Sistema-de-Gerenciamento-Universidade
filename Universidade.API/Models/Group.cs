﻿using System.ComponentModel.DataAnnotations;

namespace Universidade.API.Models
{
  public class Group
  {
    public int Id { get; set; }

    [Required]
    [StringLength(50)]
    public string Name { get; set; }

    [StringLength(255)]
    public string Description { get; set; }

    // Relacionamento muitos-para-muitos com usuários
    public ICollection<GroupUser> Users { get; set; }
  }
}
