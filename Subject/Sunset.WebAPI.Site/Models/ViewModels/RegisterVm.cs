﻿using BookStore.FrontEnd.Site.Models.Infra;
using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace Sunset.WebAPI.Site.Models.ViewModels
{
	public class RegisterVm
	{
		public int Id { get; set; }

		[Display(Name = "帳號")]
		[Required(ErrorMessage = "請輸入{0}")]
		[StringLength(50)]
		public string Account { get; set; }

		[Display(Name = "密碼")]
		[Required(ErrorMessage = "請輸入{0}")]
		[StringLength(50)]
		[DataType(DataType.Password)]
		public string Password { get; set; }

		[Display(Name = "確認密碼")]
		[Required(ErrorMessage = "請輸入{0}")]
		[StringLength(50)]
		[Compare(nameof(Password))]
		[DataType(DataType.Password)]
		public string ConfirmPassword { get; set; }

		[Required(ErrorMessage = "請輸入{0}")]
		[StringLength(100)]
		[EmailAddress]
		public string Email { get; set; }

		[Display(Name = "姓名")]
		[Required(ErrorMessage = "請輸入{0}")]
		[StringLength(30)]
		public string MemberName { get; set; }

		[Display(Name = "手機")]
		[StringLength(10)]
		public string PhoneNumber { get; set; }

		[Display(Name = "地址")]
		[StringLength(255)]
		public string Address { get; set; }

		[Display(Name = "生日")]
		public DateTime DateOfBirth { get; set; }
    }

	public static class RegisterExt
	{
		public static Member ToMember(this RegisterVm vm)
		{
			var salt = HashUtility.GetSalt();
			var hashPassword = HashUtility.ToSHA256(vm.Password, salt); //建立密碼的雜湊值
			var confirmCode = Guid.NewGuid().ToString("N"); //發送確認信時使用

			return new Member
			{
				Id = vm.Id, //這行可有可無，用不到
				Account = vm.Account,
				Password = hashPassword,
				Email = vm.Email,
				MemberName = vm.MemberName,
				PhoneNumber = vm.PhoneNumber,
				Address = vm.Address,
				DateOfBirth = vm.DateOfBirth,
				CurrentBalance = 0,
				IsConfirmed = false, //新會員預設狀態是: 未確認
				ConfirmCode = confirmCode,
			};
		}
		public static RegisterDto ToDto(this RegisterVm vm)
		{
			return new RegisterDto
			{
				Id = vm.Id, //這行可有可無，用不到
				Account = vm.Account,
				Password = vm.Password,
				Email = vm.Email,
				MemberName = vm.MemberName,
				PhoneNumber = vm.PhoneNumber,
				Address = vm.Address,
				DateOfBirth = vm.DateOfBirth,
			};
		}
	}
}