using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;

namespace Theater_Admin.Models.Repositories
{
    public interface ILoginRepository
    {
        void GetUser(LoginDto dto);
        bool ValidLogin(LoginDto dto);
    }
    public class LoginRepository : ILoginRepository
    {
        private AppDbContext _db;
        public LoginRepository(AppDbContext db)
        {
            _db = db;
        }
        public void GetUser(LoginDto dto)
        {
           var user = _db.Users.AsNoTracking().FirstOrDefault(x => x.Account == dto.Account);

           
        }

        public bool ValidLogin(LoginDto dto)
        {
            var user = _db.Users.AsNoTracking().FirstOrDefault(x => x.Account == dto.Account);

            if(dto.Password == user.Password)
            {
                return true;
            }
            return false;
        }




       
    }
}