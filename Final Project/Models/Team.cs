using System;
using System.Collections.Generic;

namespace BuildProjectSummer2024.Models;

public partial class Team
{
    public int Id { get; set; }

    public string TeamName { get; set; } = null!;

    public string? City { get; set; }

    public int StadiumId { get; set; }

    public virtual ICollection<Player> Players { get; set; } = new List<Player>();

    public virtual Stadium Stadium { get; set; } = null!;
}
