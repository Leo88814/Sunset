using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Theater_Admin.Models.Vms
{
    public class MemberVm
    {
        public int Id { get; set; }

        public string Account { get; set; }


        public string Email { get; set; }


        public string PhoneNumber { get; set; }

        public decimal CurrentBalance { get; set; }

        public string MemberName { get; set; }

        public DateTime? DateOfBirth { get; set; }

        public string Address { get; set; }

        public bool MemberStatus { get; set; }


    }
}