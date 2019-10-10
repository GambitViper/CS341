using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dentask.Models;

namespace Dentask.ViewModels
{
    public class RandomAppointmentViewModel
    {
        public Appointment Appointment { get; set; }
        public List<Customer> Customers { get; set; }
    }
}