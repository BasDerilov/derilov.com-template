using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace fictionsplash.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        
        public string color { get; set; }

        public IndexModel(ILogger<IndexModel> logger, string color = "#fce043")
        {
            _logger = logger;
            this.color = color;
        }

        public void OnGet()
        {

        }
    }
}
