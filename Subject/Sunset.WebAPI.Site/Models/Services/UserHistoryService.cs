using Sunset.WebAPI.Site.Models.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Services
{
	public class UserHistoryService
	{
		private readonly UserHistoryRepository _repository;

		public UserHistoryService()
		{
			_repository = new UserHistoryRepository();
		}

	}
}