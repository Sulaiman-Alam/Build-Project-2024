using System;
using System.Collections.Generic;

namespace BuildProjectSummer2024.Models;

public partial class PlayerRole
{
    public int Id { get; set; }

    public string? RoleName { get; set; }

    public virtual ICollection<Player> Players { get; set; } = new List<Player>();
}
