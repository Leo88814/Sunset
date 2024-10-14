using BookStore.FrontEnd.Site.Models.Infra;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.Repositories;

namespace Theater_Admin.Models.Services
{
    public class UserService
    {
        private IUserRepository _repo;
        public UserService()
        {
            _repo = new UserRepository();
        }
        public UserService(IUserRepository repo)
        {
            _repo = repo;
        }


        internal Result ValidateLogin(LoginDto dto)
        {
            //找出user
            LoginDto user = _repo.Get(dto.Account);


            if (user == null)
                return Result.Fail("帳號或密碼錯誤");

            //將密碼雜湊後比對
            string hashPassword = HashUtility.ToSHA256(dto.Password);
            bool isPasswordCorrect = (hashPassword.CompareTo(user.Password) == 0);
            
   


            //回傳結果
            return isPasswordCorrect ? Result.Success() : Result.Fail("帳號或密碼錯誤");
        }



        public void UpdatePassword(LoginDto dto)
        {
            LoginDto userInDb = _repo.Get(dto.Account);


            string salt = HashUtility.GetSalt();
            string hashPassword = HashUtility.ToSHA256(dto.Password, salt);


            userInDb.Password = hashPassword;

            _repo.Update(userInDb);

        }


        
    }
}