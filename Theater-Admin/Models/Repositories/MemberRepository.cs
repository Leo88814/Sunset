using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;
using Theater_Admin.Models.Services;

namespace Theater_Admin.Models.Repositories
{
    public interface IMemberRepository
    {
        IEnumerable<MemberDto> GetAllMembers();

        void AddMember(MemberDto member);
        void SuspendMember(MemberDto member); //停權

        MemberDto GetMemberById(MemberDto dto);
    }
    public class MemberRepository : IMemberRepository
    {

        private readonly AppDbContext _db;

        public MemberRepository()
        {
            _db = new AppDbContext();
        }

        public void AddMember(MemberDto member)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<MemberDto> GetAllMembers()
        {
            return _db.Members.Select(x => new MemberDto
            {
                Id = x.Id,
                Account = x.Account,
                Password = x.Password,
                Email = x.Email,
                PhoneNumber = x.PhoneNumber,
                CurrentBalance = x.CurrentBalance,
                MemberName = x.MemberName,
                DateOfBirth = x.DateOfBirth,
                Address = x.Address,
                MemberStatus = x.MemberStatus,
                IsConfirmed = x.IsConfirmed,
                ConfirmCode = x.ConfirmCode
            });
        }

        public MemberDto GetMemberById(MemberDto dto)
        {
            var member = _db.Members.AsNoTracking().FirstOrDefault(x => x.Id == dto.Id);

            return new MemberDto
            {
                Id = member.Id,
                Account = member.Account,
                Password = member.Password,
                Email = member.Email,
                PhoneNumber = member.PhoneNumber,
                CurrentBalance = member.CurrentBalance,
                MemberName = member.MemberName,
                DateOfBirth = member.DateOfBirth,
                Address = member.Address,
                MemberStatus = member.MemberStatus,
                IsConfirmed = member.IsConfirmed,
                ConfirmCode = member.ConfirmCode
            };
        }

        public void SuspendMember(MemberDto dto)
        {
            Member  member = MvcApplication._mapper.Map<Member>(dto);

            _db.Entry(member).State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
        }


    }
}