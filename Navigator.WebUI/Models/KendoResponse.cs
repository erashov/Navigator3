using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Navigator.WebUI.Models
{
    public class KendoResponse
    {
        public Array Data { get; set; }
        public int Count { get; set; }
        public string Errors { get; set; }

        public KendoResponse(Array data, int count)
        {
            this.Data = data;
            this.Count = count;
        }

        public KendoResponse(string errors)
        {
            this.Errors = errors;
        }

        public KendoResponse()
        {

        }
    }
}