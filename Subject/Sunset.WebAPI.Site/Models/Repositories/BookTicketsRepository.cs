﻿using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Results;
using static Sunset.WebAPI.Site.Models.Dtos.ChoiceDatesDto;


namespace Sunset.WebAPI.Site.Models.Repositories
{
	public class BookTicketsRepository
	{
		private readonly AppDbContext _db;

		public BookTicketsRepository()
		{

			_db = new AppDbContext();
		}

		public List<ChoiceMoviesDto> GetAllMovie()
		{

			var allMovie = _db.MovieInfos
				 .AsNoTracking()
				 .OrderBy(m => m.Id)
				 .Select(m => new ChoiceMoviesDto
				 {
					 Id = m.Id,
					 MovieName = m.MovieName,
					 MainPicture = m.MainPicture,
				 })
			 .ToList();

			return allMovie;
		}


		public List<ChoiceDatesDto> GetMovieDate(int id)
		{
			var allDate = _db.MovieReleaseSchedules
			.AsNoTracking()
			.Where(m => m.MovieInfoId == id)
			.GroupBy(sd => new
			{
				sd.MovieInfoId,
				sd.MovieInfo.MovieName,
				sd.MovieInfo.MainPicture,
				sd.ShowDate.Id,
				sd.ShowDate.ShowTimeDate
			})
			.Select(g => new ChoiceDatesDto
			{
				Id = g.Key.MovieInfoId,
				MovieName = g.Key.MovieName,
				MainPicture = g.Key.MainPicture,
				DateId = g.Key.Id, 
				ShowtimeDate = g.Key.ShowTimeDate,
				Times = g.Select(t => new ShowtimeDto
				{
					TimeId = t.ShowTime.Id,
					StartTime = t.ShowTime.StartTime,
				}).ToList()
			})
			.ToList();

			return allDate;
		}

		public List<ChoiceSeatsDto> GetMovieSeat(int id)
		{
			return null;

		}
	}
}