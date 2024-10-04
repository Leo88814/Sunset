using System;
using System.Collections.Generic;
using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using Sunset.WebAPI.Site.Repositories;

namespace Sunset.WebAPI.Site.Services
{
	public class UserHistoryService
	{
		private readonly UserHistoryRepository _userHistoryRepository;

		public UserHistoryService(UserHistoryRepository userHistoryRepository)
		{
			_userHistoryRepository = userHistoryRepository;
		}

		public List<UserHistoryDto> GetUserHistoryByMemberId(string memberId)
		{
			var userHistory = _userHistoryRepository.GetUserHistoryByMemberId(memberId);
			var path = "/images/"; // 假設圖片存放在這個路徑
			MatchPath(userHistory, path); // 呼叫 MatchPath 方法來修正路徑
			return userHistory;
		}

		public UserHistoryDto GetUserHistoryDetail(string orderNumber)
		{
			var userHistoryDetail = _userHistoryRepository.GetUserHistoryDetail(orderNumber);
			if (userHistoryDetail != null)
			{
				var path = "/images/"; // 假設圖片存放在這個路徑
				userHistoryDetail.MainPicture = path + userHistoryDetail.MainPicture; // 修正圖片路徑
			}
			return userHistoryDetail;
		}

		public bool RateOrder(int orderId, int rating)
		{
			return _userHistoryRepository.RateOrder(orderId, rating);
		}

		private void MatchPath(List<UserHistoryDto> userHistory, string path)
		{
			foreach (var history in userHistory)
			{
				history.MainPicture = path + history.MainPicture;
			}
		}

		public Member GetMemberByEmail(string email)
		{
			// 實現根據 email 獲取會員的方法
			return _userHistoryRepository.GetMemberByEmail(email);
		}

		public bool CancelOrder(int orderId, string memberId)
		{
			return _userHistoryRepository.CancelOrder(orderId, memberId);
		}
	}
}