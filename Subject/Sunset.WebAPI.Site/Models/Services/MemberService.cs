using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Results;

namespace Sunset.WebAPI.Site.Models.Services
{
    public class MemberService
    {
        private readonly MembersRepository _repo;
        public MemberService()
        {
            _repo = new MembersRepository();
        }
        //public Result Login(MemberLoginDto dto)
        //{
        //    // 找出 user
        //    MemberDto member = _repo.GetMembers(dto.Email);
        //    if (member == null) return Result.Fail("帳號或密碼錯誤"); //帳號不存在

        //    // 是否已開通
        //    if (!member.IsConfirmed.HasValue || member.IsConfirmed.Value == false)
        //    {
        //        return Result.Fail("帳戶尚未開通");
        //    }

        //    // 將密碼雜湊後比對
        //    string hashPassword = HashUtility.ToSHA256(dto.Password);
        //    bool isPasswordCorrect = (hashPassword.CompareTo(member.EncryptedPassword) == 0);

        //    //回傳結果
        //    return isPasswordCorrect ? Result.Success() : Result.Fail("帳號或密碼錯誤"); //密碼錯誤
        //}

    }
}