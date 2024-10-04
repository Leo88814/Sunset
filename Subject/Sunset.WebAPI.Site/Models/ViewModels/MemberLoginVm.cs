using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.ViewModels
{
    public class MemberLoginVm
    {
        [Display(Name = "Email")]
        [Required(ErrorMessage = "請輸入{0}")]
        public string Email { get; set; }

        [Display(Name = "密碼")]
        [Required(ErrorMessage = "請輸入{0}")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}