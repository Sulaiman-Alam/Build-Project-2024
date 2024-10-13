using System;
using System.Collections.Generic;

namespace BuildProjectSummer2024.Models;

public partial class Stadium
{
    public int Id { get; set; }

    public string StadiumName { get; set; } = null!;

    public string City { get; set; } = null!;

    public int Capacity { get; set; }

    public virtual ICollection<Team> Teams { get; set; } = new List<Team>();
}
