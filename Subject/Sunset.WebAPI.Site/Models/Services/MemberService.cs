using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Services
{
    public class MemberService
    {
        private readonly MembersRepository _repo;
        internal object GetMemberInfo()
        {
            _repo = new MembersRepository();
        }
    }
}