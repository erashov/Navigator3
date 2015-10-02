using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Navigator.WebUI.Models
{
    public class KendoGridRequest
    {
        public int take { get; set; }
        public int skip { get; set; }
        public int page { get; set; }
        public List<KendoGridSort> sort { get; set; }
    }
    public class KendoGridSort
    {
        public string field { get; set; }
        public string dir { get; set; }
    }
}