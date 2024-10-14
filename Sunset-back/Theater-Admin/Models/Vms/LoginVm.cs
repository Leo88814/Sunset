using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Theater_Admin.Models.Vms
{
    public class LoginVm
    {
        [Required(ErrorMessage = DAHelper.Requierd)]
        [Display(Name = "帳號")]
        //[strenlength]
        public string Account { get; set; }

        [Required(ErrorMessage = DAHelper.Requierd)]
        [Display(Name = "密碼")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}