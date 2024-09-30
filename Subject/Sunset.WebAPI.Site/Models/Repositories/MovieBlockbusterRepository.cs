using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
            _db.MovieGenres,                   // 連接 MovieGenres 表
            movie => movie.GenreId,            // Movies 表中的 GenreId
            genre => genre.Id,                 // MovieGenres 表的主鍵 Id
            (movie, genre) => new              // 合併結果到一個匿名物件
            {
                movie,                         // Movies 表的資料
                genre                          // MovieGenres 表的資料
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
            GenreName = x.genre.GenreName,       // 從 MovieGenres 表選取 GenreName
			AverageRating = _db.MovieRatings
					.Where(r => r.MovieInfoId == x.movie.Id && r.Rating.HasValue)
					.Average(r => (double?)r.Rating) ?? 0 // 處理空值的評分
		})
        .ToList();

            return allMovie;
        }

		public List<MovieRating> GetRatingsByMovieId(int movieId)
		{
			return _db.MovieRatings.Where(r => r.MovieInfoId == movieId).ToList();
		}

	}
}