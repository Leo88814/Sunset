using System.Collections.Generic;
using Sunset.WebAPI.Site.Models.Dtos;
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
            var path = "../images/"; // 假設圖片存放在這個路徑
            MatchPath(userHistory, path); // 呼叫 MatchPath 方法來修正路徑
            return userHistory;
        }

        private void MatchPath(List<UserHistoryDto> userHistory, string path)
        {
            foreach (var history in userHistory)
            {
                history.MainPicture = path + history.MainPicture;
            }
        }
    }
}