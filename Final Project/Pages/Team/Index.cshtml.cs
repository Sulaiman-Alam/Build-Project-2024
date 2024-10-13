using BuildProjectSummer2024.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using BuildProjectSummer2024.Models.PageModels;

namespace BuildProjectSummer2024.Pages.Team
{
    public class IndexModel : PageModel
    {
		private readonly BuildProject2024Context _context;
		public List<TeamModel> Teams;
        public int PageIndex { get; set; } 
        public int TotalPages { get; set; } 
        public bool HasPreviousPage => PageIndex > 1; 
        public bool HasNextPage => PageIndex < TotalPages; 

        public IndexModel(BuildProject2024Context context)
		{
			_context = context;
		}

		public void OnGet(int? pageIndex)
        {
            const int pageSize = 5; 
            PageIndex = pageIndex ?? 1; 

            IQueryable<Models.Team> patientsQuery = _context.Teams; 

            int totalPatients = patientsQuery.Count(); 
            TotalPages = (int)Math.Ceiling(totalPatients / (double)pageSize); 

            Teams = _context.Teams.Select(x => new TeamModel
            {
                Id = x.Id,
                TeamName = x.TeamName,
                City = x.City,
                StadiumId = x.StadiumId,
                Stadium = new Models.Stadium
                {
                    Id = x.StadiumId,
                    StadiumName = x.Stadium.StadiumName
                },
                PlayerCount = x.Players.Count
            })
            .Skip((PageIndex - 1) * pageSize) 
            .Take(pageSize) 
            .ToList();
        }
    }
}
