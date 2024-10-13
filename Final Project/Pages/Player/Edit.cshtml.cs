using BuildProjectSummer2024.Models;
using BuildProjectSummer2024.Models.PageModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace BuildProjectSummer2024.Pages.Player
{
    public class EditModel : PageModel
    {
        private readonly BuildProject2024Context _context;

        public EditModel(BuildProject2024Context context)
        {
            _context = context;
        }

        [BindProperty]
        public PlayerModel Player { get; set; }
        public SelectList Teams { get; set; }
        public SelectList Roles { get; set; }

        public void OnGet(int? id)
        {
            if (id == null)
            {
                Player = new PlayerModel();
            }
            else
            {
                var dbPlayer = _context.Players.Find(id);
                var dbTeam = _context.Teams.Find(dbPlayer.TeamId);

                if (dbPlayer == null)
                {
                    Player = new PlayerModel();
                }
                else
                {
                    Player = new PlayerModel {
                        Id = dbPlayer.Id,
                        FirstName = dbPlayer.FirstName,
                        LastName = dbPlayer.LastName,
                        Gender = dbPlayer.Gender,
                        Dob = dbPlayer.Dob,
                        TeamName = dbTeam.TeamName,
                        RoleName = dbPlayer.RoleName,
                        Country = dbPlayer.Country
                    };
                }
            }

            var TeamsList = _context.Teams.Select(x => new Models.Team { Id = x.Id, TeamName = x.TeamName });
            Teams = new SelectList(TeamsList, "Id", "TeamName");

            var RoleList = _context.PlayerRoles.Select(x => new Models.PlayerRole { Id = x.Id, RoleName = x.RoleName});
            Roles = new SelectList(RoleList, "Id", "RoleName");
        }
        public async Task<IActionResult> OnPost()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            if (Player.Id == 0)
            {
                var dbPlayer = new Models.Player
                {
                    FirstName = Player.FirstName,
                    LastName = Player.LastName,
                    Dob = Player.Dob,
                    Gender = Player.Gender,
                    Id = Player.Id,
                    TeamId = Player.TeamId,
                    RoleId = Player.RoleId,
                    Country = Player.Country
                };
                _context.Players.Add(dbPlayer);
            }
            else
            {
                var dbPlayer = _context.Players.Find(Player.Id);

                dbPlayer.FirstName = Player.FirstName;
                dbPlayer.LastName = Player.LastName;
                dbPlayer.Dob = Player.Dob;
                dbPlayer.Gender = Player.Gender;
                dbPlayer.Id = Player.Id;
                dbPlayer.TeamId = Player.TeamId;
                dbPlayer.RoleId = Player.RoleId;
                dbPlayer.Country = Player.Country;
                _context.Players.Update(dbPlayer);
            }
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
