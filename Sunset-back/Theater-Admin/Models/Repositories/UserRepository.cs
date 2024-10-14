using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;

namespace Theater_Admin.Models.Repositories
{
    public interface IUserRepository
    {

        LoginDto Get(string account);
        void Update(LoginDto loginUser);
    }

    public class UserRepository : IUserRepository
    {
        private AppDbContext _db;
        public UserRepository()
        {
            _db = new AppDbContext(); //要改傳入
        }
        public LoginDto Get(string account)
        {
            var user = _db.Users.FirstOrDefault(x => x.Account == account);
            if (user == null)
                return null;
            return MvcApplication._mapper.Map<LoginDto>(user);
        }


        public void Update(LoginDto LoginUser)
        {
            User user = MvcApplication._mapper.Map<User>(LoginUser); //把memberdto轉成member


            _db.Entry(user).State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
        }




    }
}