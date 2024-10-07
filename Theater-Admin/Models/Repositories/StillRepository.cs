using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;

namespace Theater_Admin.Models.Repositories
{
    public interface IStillRepository
    {
        //StillDto GetStillById(int id);
        void AddMovieStill(StillDto stillDto);

        void DeleteStill(int stillId);
        IEnumerable<StillDto> GetAllStills(int movieId);

        bool IsMaxCount(int movieId);
    }
    public class StillRepository : IStillRepository
    {
        private AppDbContext _db;

        public StillRepository()
        {
            _db = new AppDbContext();
        }
        public void AddMovieStill(StillDto stillDto)
        {
            _db.MovieImages.Add(new MovieImage
            {
                Id = stillDto.Id,
                MovieInfoId = stillDto.MovieInfoId,
                stills = stillDto.Stills,
            });

            _db.SaveChanges();
        }

        public void DeleteStill(int stillId)
        {
            var still = _db.MovieImages.Include("MovieInfo").FirstOrDefault(x => x.Id == stillId);

            _db.MovieImages.Remove(still);
            _db.SaveChanges();

        }

        public IEnumerable<StillDto> GetAllStills(int movieId) //抓到電影的所有劇照的名稱
        {
            return _db.MovieImages
       .AsNoTracking().Include("MovieInfo").Where(x => x.MovieInfoId == movieId)
       .Select(s => new StillDto
       {
           Id = s.Id,
           MovieInfoId = s.MovieInfoId,
           Stills = s.stills
       }).ToList();
        }

        public bool IsMaxCount(int movieId)
        {
            var stills = _db.MovieImages.AsNoTracking().Include("MovieInfo").Count(x => x.MovieInfoId == movieId);
            
            if (stills >= 3)
                return true;
            else
                return false;
        }

        //public StillDto GetStillById(int id) //找到劇照
        //{
        //    var still = _db.MovieImages.AsNoTracking().Include("MovieInfo").FirstOrDefault(x => x.Id == id);
        //    if (still == null)
        //        return null;

        //    return new StillDto
        //    {
        //        Id = still.Id,
        //        MovieInfoId = still.MovieInfoId,
        //        Stills = still.stills,
        //    };
        //}



    }
}