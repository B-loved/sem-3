﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HealthInsuranceService.Data
{
    public class Admin
    {
        [Key]
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
    }
}