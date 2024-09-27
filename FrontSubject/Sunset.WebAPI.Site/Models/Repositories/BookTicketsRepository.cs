using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Repositories
{
    public class BookTicketsRepository
    {
        private readonly AppDbContext _db;

        public BookTicketsRepository()
        {

            _db = new AppDbContext();
        }

        public List<ChoiceMoviesDto> GetMovie()
        {

            var allMovie = _db.MovieInfos
                 .AsNoTracking()
                 .OrderBy(m => m.PremiereDate)
                 .Select(m => new ChoiceMoviesDto
                 {
                     Id = m.Id,
                     MovieName = m.MovieName,
                     MainPicture = m.MainPicture,
                 })
             .ToList();

            return allMovie;
        }

        public List<ChoiceDatesDto> GetDate(int id)
        {
            var date = _db.MovieReleaseSchedules
                .Where(ms => ms.ShowDate.Id == id)
                .AsNoTracking()
                .OrderBy(sd => sd.ShowDate.Id)
                .Select(ms => new ChoiceDatesDto
                {
                    Id = ms.MovieInfo.Id,
                    DateId = ms.ShowDate.Id,
                    ShowtimeDate = ms.ShowDate.ShowTimeDate,
                    TimeId = ms.ShowTime.Id,
                    StartTime = ms.ShowTime.StartTime,
                }).ToList();

            return date;
        }

        //public List<ChoiceDatesDto> GetTime(int id)
        //{
        //    var time = _db.MovieReleaseSchedules
        //        .AsNoTracking()
        //        .Include(ms => ms.MovieInfo)
        //        .Where(ms => ms.MovieInfo.Id == id)
        //        .Include(sd => sd.ShowDate)
                
        //        .OrderBy(st => st.Id)
        //        .Select(st => new ChoiceDatesDto
        //        {
        //            Id = st.Id,
        //            TimeId = st.S.Id,
        //            StartTime = st.StartTime,
        //        }).ToList();
        //    return time;
        //}
    }
}