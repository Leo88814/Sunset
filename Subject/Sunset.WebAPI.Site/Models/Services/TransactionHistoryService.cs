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

        public (List<TransactionHistoryDto> TopupHistory, decimal CurrentBalance) GetTopupHistoryByMemberId(string memberId)
        {
            return _repository.GetTopupHistoryByMemberId(memberId);
        }

    }
}