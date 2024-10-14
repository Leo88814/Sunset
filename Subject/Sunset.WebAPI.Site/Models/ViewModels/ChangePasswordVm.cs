using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.ViewModels
{
	public class ChangePasswordVm
	{
		public int Id { get; set; }
		public string Email { get; set; }
		[Display(Name = "舊密碼")]
		[Required(ErrorMessage = "請輸入{0}")]
		[StringLength(50)]
		[DataType(DataType.Password)]
		public string Password { get; set; }


		[Display(Name = "新密碼")]
		[Required(ErrorMessage = "請輸入{0}")]
		[StringLength(50)]
		[DataType(DataType.Password)]
		public string NewPassword { get; set; }


		[Display(Name = "確認新密碼")]
		[Required(ErrorMessage = "請輸入{0}")]
		[StringLength(50)]
		[Compare(nameof(NewPassword))]
		[DataType(DataType.Password)]
		public string ConfirmPassword { get; set; }
	}
}