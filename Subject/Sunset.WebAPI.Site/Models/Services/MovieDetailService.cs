using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.Repositories;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System; // 新增引用

namespace Sunset.WebAPI.Site.Models.Services
{
    public class MovieDetailService
    {
        private readonly MovieDetailRepository _repository;

        // 使用依賴注入來初始化 repository
        public MovieDetailService(MovieDetailRepository repository)
        {
            _repository = repository;
        }

        public MovieDetailDto GetMovieDetailById(int id)
        {
            try
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
                    movie.Showtimes = _repository.GetShowtimesByMovieId(movie.Id); // 確保 Showtimes 被設置
                }
                return movie;
            }
            catch (Exception ex)
            {
                // 錯誤處理
                // 可以記錄錯誤日誌或拋出自定義例外
                throw new Exception("Error retrieving movie details", ex);
            }
        }

        private void MatchPath(MovieDetailDto movie, string path)
        {
            if (movie != null)
            {
                // 修正主圖片的路徑
                movie.MainPicture = Path.Combine(path, movie.MainPicture);

                // 為每個劇照加上圖片路徑前綴
                if (movie.stills != null && movie.stills.Any())
                {
                    movie.stills = movie.stills.Select(still => Path.Combine(path, still.Trim())).ToList();
                }
            }
        }
    }
}
