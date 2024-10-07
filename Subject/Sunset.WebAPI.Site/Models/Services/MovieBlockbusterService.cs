using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.Repositories;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics; // 添加這行

namespace Sunset.WebAPI.Site.Models.Services
{
    public class MovieBlockbusterService
    {
        private readonly MovieBlockbusterRepository _repository;

        public MovieBlockbusterService()
        {
            _repository = new MovieBlockbusterRepository();
        }

        public List<MovieBlockbusterDto> GetInfo()
        {
            var path = "../images/";
            var indexMovie = _repository.GetMoviesWithAverageRatings();
            MatchPath(indexMovie, path); // 呼叫 MatchPath 方法來修正路徑

            // 添加日誌
            Debug.WriteLine("Movies fetched from repository:");
            foreach (var movie in indexMovie)
            {
                Debug.WriteLine($"Movie: {movie.MovieName}, Rating: {movie.AverageRating}");
            }

            return indexMovie;
        }

        private void MatchPath(List<MovieBlockbusterDto> movies, string path)
        {
            foreach (var movie in movies)
            {
                movie.MainPicture = path + movie.MainPicture;
            }
        }

        public List<MovieBlockbusterDto> GetMovies()
        {
            return _repository.GetMoviesWithAverageRatings();
        }

        // 計算電影平均評分的方法
        private decimal CalculateAverageRating(int movieId)
        {
            var ratings = _repository.GetRatingsByMovieId(movieId);
            if (ratings == null || ratings.Count == 0)
            {
                return 0; // 如果沒有評分，返回 0
            }

            return (decimal)ratings.Average(r => r.Rating); // 假設 Rating 是評分的數值
        }
    }
}
