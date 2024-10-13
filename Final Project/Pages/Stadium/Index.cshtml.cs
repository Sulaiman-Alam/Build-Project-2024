using BuildProjectSummer2024.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BuildProjectSummer2024.Pages.Stadium
{
    public class IndexModel : PageModel
    {
		private readonly BuildProject2024Context _context;
		public List<Models.Stadium> Stadiums;
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

            IQueryable<Models.Stadium> patientsQuery = _context.Stadia; 

            int totalPatients = patientsQuery.Count(); 
            TotalPages = (int)Math.Ceiling(totalPatients / (double)pageSize);

            Stadiums = _context.Stadia.Select(x => new Models.Stadium
            {
                Id = x.Id,
                City = x.City,
                StadiumName = x.StadiumName,
                Capacity = x.Capacity
            })
            .Skip((PageIndex - 1) * pageSize)
            .Take(pageSize)
            .ToList();
        }
    }
}
