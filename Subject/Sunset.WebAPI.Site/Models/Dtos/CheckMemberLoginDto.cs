using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Dtos
{
	public class CheckMemberLoginDto
	{
        public int Id { get; set; }

        public string Account { get; set; }

        public string Password { get; set; }

        public string Email { get; set; }

        public decimal CurrentBalance { get; set; }
        public string PhoneNumber { get; set; }

        public string MemberName { get; set; }

        public DateTime DateOfBirth { get; set; }

        public string Address { get; set; }

        public bool MemberStatus { get; set; }

        public string ConfirmCode { get; set; }

        public string EncryptedPassword { get; set; }

        public bool IsConfirmed { get; set; }
    }
}