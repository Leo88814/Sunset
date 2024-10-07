using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.Repositories;

namespace Theater_Admin.Models.Services
{
    public class MemberService
    {
        private readonly IMemberRepository _repo;
        public MemberService( IMemberRepository repo) {
            _repo = repo;   
        }


        public void SuspendMember(MemberDto dto)
        {
            var MemberInDb = _repo.GetMemberById(dto);

            MemberInDb.MemberStatus = dto.MemberStatus;
            
            _repo.SuspendMember(MemberInDb);
        }

        public IEnumerable<MemberDto> GetMembers()
        {
            return _repo.GetAllMembers();
        }
    }
}