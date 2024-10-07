using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Sunset.WebAPI.Site.Models.Dtos
{
    public class ProfileDto
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "姓名是必填欄位")]
        [StringLength(100, ErrorMessage = "姓名不能超過100個字元")]
        public string MemberName { get; set; }

        [Phone(ErrorMessage = "請輸入有效的電話號碼")]
        public string PhoneNumber { get; set; }

        [StringLength(200, ErrorMessage = "地址不能超過200個字元")]
        public string Address { get; set; }


        [DataType(DataType.Date, ErrorMessage = "請輸入有效的日期")]
        public DateTime? DateOfBirth { get; set; }
    }
}