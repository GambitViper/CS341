using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Dentask.Models
{
    // Models returned by MeController actions.
    public class GetViewModel
    {
        [Display(Name = "Prefix")]
        public string Prefix { get; set; }

        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        public string LastName { get; set; }
    }
}