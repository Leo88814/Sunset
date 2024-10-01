using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Http;
using System.Web.Security;
using System.Web.UI.WebControls;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;

namespace Theater_Admin.Controllers
{
    public class LoginApiController : ApiController
    {
        [HttpPost]
        [Route("login")]
        public HttpResponseMessage Login(LoginDto vm)
        {
            var db = new AppDbContext();
            var member = db.Members.FirstOrDefault(x => x.Account == vm.Account);
            if (member == null) return Request.CreateResponse(HttpStatusCode.BadRequest, "帳號或密碼錯誤");

            // todo 驗證密碼
            // 取得必要的使用者資料,放在userData中
            string account = vm.Account;
            string name = member.Address;
            // 這裡的userData是一個 JSON 字串
            string userData = $"{{\"account\":\"{account}\",\"name\":\"{name}\"}}";

            // 利用表單認證生成認證票, 並回傳
            // 建立票證
            var ticket = new FormsAuthenticationTicket(
            1,                                   // 版本號
                vm.Account,                       // 使用者名稱
                DateTime.Now,                         // 發行時間
                DateTime.Now.AddMinutes(30),          // 到期時間
                true,                                 // 是否持久保存
                userData,                           // 票證中的使用者資料
                FormsAuthentication.FormsCookiePath   // Cookie 路徑
            );

            // 加密票證
            var encryptedTicket = FormsAuthentication.Encrypt(ticket);

            // 建立 Cookie
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket)
            {
                HttpOnly = true,       // 增加安全性
                Secure = true,          // 在 HTTPS 中傳輸
                Expires = ticket.Expiration
            };

            // 將 Cookie 加入回應
            var response = Request.CreateResponse(HttpStatusCode.OK);
            response.Headers.AddCookies(
                new[] { new CookieHeaderValue(cookie.Name, cookie.Value)
                        {
                            HttpOnly = true,
                            Secure = true,
                            Path = cookie.Path,
                            Expires = cookie.Expires
                        }
                });

            return response;

        }

    }
}
