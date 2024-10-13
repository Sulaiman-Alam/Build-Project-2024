using BuildProjectSummer2024.Models;
using BuildProjectSummer2024.Models.PageModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace BuildProjectSummer2024.Pages.Player
{
    public class IndexModel : PageModel
    {
		private readonly BuildProject2024Context _context;
		public List<PlayerModel> Players;
        public int PageIndex { get; set; }
        public int TotalPages { get; set; }
        public bool HasPreviousPage => PageIndex > 1;
        public bool HasNextPage => PageIndex < TotalPages;

        public string TeamName { get; set; }

        public IndexModel(BuildProject2024Context context)
        {
            _context = context;
        }

        public void OnGet(int? teamId, int? pageIndex)
        {
            const int pageSize = 5;
            PageIndex = pageIndex ?? 1;
            IQueryable<Models.Player> playersQuery = _context.Players.Where(x => !teamId.HasValue || x.TeamId == teamId);

            int totalPlayers = playersQuery.Count();
            TotalPages = (int)Math.Ceiling(totalPlayers / (double)pageSize);

            if (teamId.HasValue)
            {
                TeamName = _context.Teams.Find(teamId).TeamName;
            }

            Players = playersQuery.Select(x => new PlayerModel
            {
                Id = x.Id,
                FirstName = x.FirstName,
                LastName = x.LastName,
                Gender = x.Gender,
                Dob = x.Dob,
                TeamName = x.Team.TeamName,
                RoleId = x.RoleId,
                TeamId = x.TeamId,
                RoleName = x.Role.RoleName,
                Country = x.Country
            })
            .Skip((PageIndex - 1) * pageSize)
            .Take(pageSize)
            .ToList();
        }
    }
}
