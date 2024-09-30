using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Diagnostics; // 添加這行

namespace Sunset.WebAPI.Site.Models.Repositories
{
    public class MovieBlockbusterRepository
    {
        private readonly AppDbContext _db;

        public MovieBlockbusterRepository()
        {
            _db = new AppDbContext();
        }

        public List<MovieBlockbusterDto> GetMoviesWithAverageRatings()
        {
            var allMovie = _db.MovieInfos
                .AsNoTracking()
                .OrderBy(x => x.PremiereDate)
                .Join(
                    _db.MovieGenres,
                    movie => movie.GenreId,
                    genre => genre.Id,
                    (movie, genre) => new
                    {
                        movie,
                        genre
                    }
                )
                .Select(x => new MovieBlockbusterDto
                {
                    Id = x.movie.Id,
                    MovieName = x.movie.MovieName,
                    Grading = x.movie.Grading,
                    Duration = x.movie.Duration,
                    MainPicture = x.movie.MainPicture,
                    TotalRating = x.movie.TotalRating,
                    GenreName = x.genre.GenreName,
                    AverageRating = _db.MovieRatings
                        .Where(r => r.MovieInfoId == x.movie.Id && r.Rating.HasValue)
                        .Average(r => (double?)r.Rating) ?? 0 // 處理空值的評分
                })
                .ToList();

            // 添加日誌
            Debug.WriteLine("Movies fetched from database:");
            foreach (var movie in allMovie)
            {
                Debug.WriteLine($"Movie: {movie.MovieName}, Rating: {movie.AverageRating}");
            }

            return allMovie;
        }

        public List<MovieRating> GetRatingsByMovieId(int movieId)
        {
            return _db.MovieRatings.Where(r => r.MovieInfoId == movieId).ToList();
        }
    }
}