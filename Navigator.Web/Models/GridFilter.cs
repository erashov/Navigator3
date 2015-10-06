using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Navigator.Web.Models
{
    public class GridFilter
    {
        public string Operator { get; set; }
        public string Field { get; set; }
        public string Value { get; set; }
    }
}