using System;
using System.Collections.Generic;

namespace BuildProjectSummer2024.Models;

public partial class Player
{
    internal string RoleName;

    public int Id { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? Gender { get; set; }

    public DateOnly? Dob { get; set; }

    public string? Country { get; set; }

    public int TeamId { get; set; }

    public int RoleId { get; set; }

    public virtual PlayerRole Role { get; set; } = null!;

    public virtual Team Team { get; set; } = null!;
}
