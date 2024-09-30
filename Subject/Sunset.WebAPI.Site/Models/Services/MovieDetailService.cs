using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.Repositories;
using System.Collections.Generic;
using System.Linq;

namespace Sunset.WebAPI.Site.Models.Services
{
	public class MovieDetailService
	{
		private readonly MovieDetailRepository _repository;

		public MovieDetailService()
		{
			_repository = new MovieDetailRepository();
		}

		public MovieDetailDto GetMovieDetailById(int id)
		{
			// 從資料庫取得電影詳細資料
			var movie = _repository.GetMovieDetailById(id);

			if (movie != null)
			{
				// 根據 MovieInfoId 來取得對應的劇照
				movie.stills = _repository.GetStillsByMovieInfoId(movie.Id);

				// 呼叫 MatchPath 方法來修正圖片路徑
				MatchPath(movie, "../images/"); // 設定正確的圖片路徑
				movie.AverageRating = _repository.GetAverageRatingByMovieId(movie.Id);
				//movie.Showtimes = _repository.GetShowtimesByMovieId(movie.Id);
			}
			return movie;
		}
        //public List<MovieReleaseScheduleDto> GetShowtimesByMovieId(int movieId)
        //{
        //    return _repository.GetShowtimesByMovieId(movieId);
        //}

        private void MatchPath(MovieDetailDto movie, string path)
		{
			if (movie != null)
			{
				// 修正主圖片的路徑
				movie.MainPicture = path + movie.MainPicture;

				// 為每個劇照加上圖片路徑前綴
				if (movie.stills != null && movie.stills.Any())
				{
					movie.stills = movie.stills.Select(still => path + still.Trim()).ToList();
				}
			}
		}
	}
}
