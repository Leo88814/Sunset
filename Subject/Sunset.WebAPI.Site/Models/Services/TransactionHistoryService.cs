using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sunset.WebAPI.Site.Models.Repositories;
using Sunset.WebAPI.Site.Models.Dtos;

namespace Sunset.WebAPI.Site.Models.Services
{
    public class TransactionHistoryService
    {
        private readonly TransactionHistoryRepository _repository;

        public TransactionHistoryService()
        {
            _repository = new TransactionHistoryRepository();
        }

        public (List<TopupDto> TopupHistory, decimal CurrentBalance) GetTopupHistoryByMemberId(string memberId)
        {
            return _repository.GetTopupHistoryByMemberId(memberId);
        }

        public string GenerateOrderNumber()
        {
            // 使用當前日期時間和隨機數生成訂單號
            var timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
            var random = new Random();
            var randomNumber = random.Next(1000, 9999); // 生成四位隨機數

            return $"ORD-{timestamp}-{randomNumber}";
        }
    }
}