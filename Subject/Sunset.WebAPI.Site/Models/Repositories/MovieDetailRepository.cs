using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Sunset.WebAPI.Site.Models.Repositories
{
    public class MovieDetailRepository : IDisposable
    {
        private readonly AppDbContext _db;

        public MovieDetailRepository(AppDbContext db)
        {
            _db = db;
        }

        public MovieDetailDto GetMovieDetailById(int id)
        {
            var movieDetail = _db.MovieInfos
                .AsNoTracking()
                .Where(m => m.Id == id)
                .Select(m => new
                {
                    m.Id,
                    m.MovieName,
                    m.EnglishName,
                    m.TrailerURL,
                    m.Director,
                    m.MovieCast,
                    m.MovieLanguage,
                    m.Distributor,
                    m.Synopsis,
                    m.PremiereDate,
                    m.Grading,
                    m.Duration,
                    m.MainPicture,
                    m.TotalRating,
                    GenreName = m.MovieGenre.GenreName,
                    Stills = m.MovieImages.Select(mi => mi.stills).ToList()
                })
                .FirstOrDefault();

            if (movieDetail != null)
            {
                var movieDetailDto = new MovieDetailDto
                {
                    Id = movieDetail.Id,
                    MovieName = movieDetail.MovieName,
                    EnglishName = movieDetail.EnglishName,
                    TrailerURL = movieDetail.TrailerURL,
                    Director = movieDetail.Director,
                    MovieCast = movieDetail.MovieCast,
                    MovieLanguage = movieDetail.MovieLanguage,
                    Distributor = movieDetail.Distributor,
                    Synopsis = movieDetail.Synopsis,
                    PremiereDate = movieDetail.PremiereDate,
                    Grading = movieDetail.Grading,
                    Duration = movieDetail.Duration,
                    MainPicture = movieDetail.MainPicture,
                    TotalRating = movieDetail.TotalRating,
                    GenreName = movieDetail.GenreName,
                    stills = movieDetail.Stills,
                    Showtimes = GetShowtimesByMovieId(movieDetail.Id) // 在查詢結束後設置 Showtimes
                };

                return movieDetailDto;
            }

            return null;
        }

        public List<string> GetStillsByMovieInfoId(int movieInfoId)
        {
            var matchingStills = _db.MovieImages
                .Where(mi => mi.MovieInfoId == movieInfoId)
                .OrderBy(mi => mi.Id)
                .Select(mi => mi.stills)
                .ToList();

            return matchingStills;
        }

        public double GetAverageRatingByMovieId(int movieId)
        {
            var averageRating = _db.MovieRatings
                .Where(r => r.MovieInfoId == movieId)
                .Average(r => (double?)r.Rating) ?? 0;

            return averageRating;
        }

        public List<MovieReleaseScheduleDto> GetShowtimesByMovieId(int movieId)
        {
            var currentTime = DateTime.Now;

            var showtimes = _db.MovieReleaseSchedules
                .Where(s => s.MovieInfoId == movieId)
                .Join(_db.ShowDates, s => s.ShowDateId, d => d.Id, (s, d) => new { s, d.ShowTimeDate, s.ShowDateId })
                .OrderBy(sd => sd.ShowTimeDate)
                .ThenBy(sd => sd.s.ShowTime.StartTime)
                .ToList() // 在記憶體中進行轉換
                .Select(sd => new MovieReleaseScheduleDto
                {
                    ShowtimeId = sd.s.Id,
                    ShowDateId = sd.ShowDateId ?? 0, // 確保 ShowDateId 不為 null
                    Date = sd.ShowTimeDate,
                    FullDateTime = sd.ShowTimeDate + new TimeSpan(
                        sd.s.ShowTime.StartTime.Hours,
                        sd.s.ShowTime.StartTime.Minutes,
                        sd.s.ShowTime.StartTime.Seconds
                    ),
                    Time = (sd.ShowTimeDate + new TimeSpan(
                        sd.s.ShowTime.StartTime.Hours,
                        sd.s.ShowTime.StartTime.Minutes,
                        sd.s.ShowTime.StartTime.Seconds
                    )).ToString("HH:mm")
                })
                .ToList();

            showtimes = showtimes.Where(s => s.FullDateTime > currentTime).ToList();

            return showtimes;
        }

        public void Dispose()
        {
            _db.Dispose();
        }
    }
}