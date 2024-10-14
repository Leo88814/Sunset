using BookStore.FrontEnd.Site.Models.Infra;
using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.Repositories;
using Sunset.WebAPI.Site.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Results;

namespace Sunset.WebAPI.Site.Models.Services
{
	public class MemberService
	{
		private readonly MemberRepository _repo;
		public MemberService()
		{
			_repo = new MemberRepository();
		}

		public void Register(RegisterDto dto)
		{
			// 判斷是否帳號已存在
			bool isAccountExist = _repo.IsAccountExist(dto.Email);
			if (isAccountExist) throw new Exception("帳號已存在");

			// 建立新會員
			//  為密碼進行雜湊
			string salt = HashUtility.GetSalt();
			string hasPassword = HashUtility.ToSHA256(dto.Password, salt);

			//  加入 confirm code
			string confirmCode = Guid.NewGuid().ToString("N");

			//  建立新會員
			dto.ConfirmCode = confirmCode;
			dto.EncryptedPassword = hasPassword;
			dto.IsConfirmed = false;
			dto.MemberStatus = true;
			_repo.Create(dto);

			// todo 寄送驗證信
		}

		public Result ValidateLogin(MemberLoginDto dto)
		{
			// 找出 user
			CheckMemberLoginDto member = _repo.Get(dto.Email);
			if (member == null) return Result.Fail("帳號或密碼錯誤"); //帳號不存在

			// 是否已開通
			if (member.MemberStatus == false)
			{
				return Result.Fail("帳戶尚未開通");
			}

			// 將密碼雜湊後比對
			string hashPassword = HashUtility.ToSHA256(dto.Password);
			bool isPasswordCorrect = (hashPassword.CompareTo(member.Password) == 0);

			//回傳結果
			return isPasswordCorrect ? Result.Success() : Result.Fail("帳號或密碼錯誤"); //密碼錯誤
		}

		public void ChangePassword(string account, ChangePasswordDto dto)
		{
			CheckMemberLoginDto memberInDb = _repo.Get(account);
			string salt = HashUtility.GetSalt();
			string hasPassword = HashUtility.ToSHA256(dto.Password, salt);
			if (hasPassword != memberInDb.Password)
			{
				throw new Exception("密碼錯誤");
			}

			var hashNewPassword = HashUtility.ToSHA256(dto.NewPassword, salt);
			memberInDb.Password = hashNewPassword;

			_repo.Update(memberInDb);
		}
	}
}