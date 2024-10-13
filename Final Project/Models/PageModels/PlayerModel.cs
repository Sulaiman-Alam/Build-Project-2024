namespace BuildProjectSummer2024.Models.PageModels
{
    public class PlayerModel
    {
        public int Id { get; set; }

        public string FirstName { get; set; } = null!;

        public string LastName { get; set; } = null!;

        public string? Gender { get; set; }

        public DateOnly? Dob { get; set; }

        public string? Country { get; set; }

        public string? RoleName { get; set; }

        public string? TeamName { get; set; }

        public int TeamId { get; set; }

        public int RoleId { get; set; }
    }
}
