﻿using System;
using System.Collections.Generic;
using System.Linq;
using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;

namespace Sunset.WebAPI.Site.Models.Repositories
{
    public class TransactionHistoryRepository
    {
        public (List<TransactionHistoryDto> TopupHistory, decimal CurrentBalance) GetTopupHistoryByMemberId(string memberId)
        {
            using (var context = new AppDbContext())
            {
                int memberIdInt = int.Parse(memberId);

                var topupHistory = context.Topups
                    .Where(t => t.MemberId == memberIdInt)
                    .Select(t => new TransactionHistoryDto
                    {
                        Id = t.Id,
                        OrderNumber = t.OrderNumber,
                        TransactionDate = t.OrderTime,
                        Amount = t.TopUpAmount
                    })
                    .ToList();

                var currentBalance = context.Members
                    .Where(m => m.Id == memberIdInt)
                    .Select(m => m.CurrentBalance)
                    .FirstOrDefault();

                return (topupHistory, currentBalance);
            }
        }

        
    }
}