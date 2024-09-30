using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Sunset.WebAPI.Site.Models.Repositories
{
	public class MovieDetailRepository
	{
		private readonly AppDbContext _db;

		public MovieDetailRepository()
		{
			_db = new AppDbContext();
		}

		public MovieDetailDto GetMovieDetailById(int id)
		{
			// 查詢 MovieInfo 與對應的 MovieGenre 和 MovieImage
			var movieDetail = _db.MovieInfos
				.AsNoTracking()
				.Where(m => m.Id == id)
				.Select(m => new MovieDetailDto
				{
					Id = m.Id,
					MovieName = m.MovieName,
					EnglishName = m.EnglishName,
					TrailerURL = m.TrailerURL,
					Director = m.Director,
					MovieCast = m.MovieCast,
					MovieLanguage = m.MovieLanguage,
					Distributor = m.Distributor,
					Synopsis = m.Synopsis,
					PremiereDate = m.PremiereDate,
					Grading = m.Grading,
					Duration = m.Duration,
					MainPicture = m.MainPicture,
					TotalRating = m.TotalRating,
					GenreName = m.MovieGenre.GenreName,
					// 取得對應的 stills，並轉換為 List<string>
					stills = m.MovieImages.Select(mi => mi.stills).ToList()
				})
				.FirstOrDefault();

			return movieDetail;
		}

		// 根據 MovieInfoId 來抓取對應的劇照
		public List<string> GetStillsByMovieInfoId(int movieInfoId)
		{
			// 查詢 MovieImages 中所有與 MovieInfoId 相符的劇照
			var matchingStills = _db.MovieImages
				.Where(mi => mi.MovieInfoId == movieInfoId)
				.OrderBy(mi => mi.Id) // 如需排序，這裡可以調整排序邏輯
				.Select(mi => mi.stills)
				.ToList();

			return matchingStills;
		}
		// 根據 MovieId 計算平均評價
		public double GetAverageRatingByMovieId(int movieId)
		{
			var averageRating = _db.MovieRatings
				.Where(r => r.MovieInfoId == movieId)
				.Average(r => (double?)r.Rating) ?? 0; // 如果沒有評價則返回 0

			return averageRating;
		}

        //public List<MovieReleaseScheduleDto> GetShowtimesByMovieId(int movieId)
        //{
        //    var currentTime = DateTime.Now;

        //    // 從 MovieReleaseSchedules 中獲得符合條件的場次資料
        //    var showtimes = _db.MovieReleaseSchedules
        //        .Where(s => s.MovieInfoId == movieId)
        //        .OrderBy(s => s.ShowDate)
        //        .ThenBy(s => s.ShowTime.StartTime)
        //        .Select(s => new MovieReleaseScheduleDto
        //        {
        //            ShowtimeId = s.Id,
        //            Date = s.ShowDate,
        //            FullDateTime = DbFunctions.CreateDateTime(
        //                s.ShowDate.Year,
        //                s.ShowDate.Month,
        //                s.ShowDate.Day,
        //                s.ShowTime.StartTime.Hours,
        //                s.ShowTime.StartTime.Minutes,
        //                s.ShowTime.StartTime.Second
        //            )
        //        })
        //        .ToList();

        //    // 過濾掉過去的場次
        //    showtimes = showtimes.Where(s => s.FullDateTime > currentTime).ToList();

        //    // 格式化時間顯示
        //    showtimes.ForEach(s => s.Time = s.FullDateTime.ToString("HH:mm"));

        //    return showtimes;
        //}

    }
}
