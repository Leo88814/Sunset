using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Repositories
{
	public class MemberRepository
	{
		private readonly AppDbContext _db;
		public MemberRepository()
		{
			_db = new AppDbContext();
		}
		public void Create(RegisterDto dto)
		{
			_db.Members.Add(new Member
			{
				Account = dto.Account,
				Password = dto.EncryptedPassword,
				MemberName = dto.MemberName,
				PhoneNumber = dto.PhoneNumber,
				Address = dto.Address,
				Email = dto.Email,
				DateOfBirth = dto.DateOfBirth,
				MemberStatus = dto.MemberStatus,
				ConfirmCode = dto.ConfirmCode,
				IsConfirmed = dto.IsConfirmed,
			});

			_db.SaveChanges();
		}

		public bool IsAccountExist(string email)
		{
			var member = _db.Members
				.AsNoTracking()
				.FirstOrDefault(x => x.Email == email);

			return member != null;
		}

		public CheckMemberLoginDto Get(string email)
		{
			var member = _db.Members.AsNoTracking().FirstOrDefault(x => x.Email == email);
			if (member == null) return null;

			return WebApiApplication._mapper.Map<CheckMemberLoginDto>(member);
		}

    }
}