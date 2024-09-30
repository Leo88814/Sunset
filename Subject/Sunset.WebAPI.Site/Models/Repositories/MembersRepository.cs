using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Repositories
{
    public class MembersRepository
    {
        private readonly AppDbContext _db;

        public MembersRepository()
        {
            _db = new AppDbContext();
        }

        //public MemberDto GetMembers(string email)
        //{
        //    var member = _db.Members.AsNoTracking().FirstOrDefault(x => x.Email == email);
        //    if (member == null) return null;

        //    return WebApiApplication._mapper.Map<MemberDto>(member);

        //}
    }
}