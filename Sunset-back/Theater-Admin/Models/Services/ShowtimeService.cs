using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;
using Theater_Admin.Models.Repositories;

namespace Theater_Admin.Models.Services
{
    public class ShowtimeService
    {
        private IShowTimeRepository _repo;

        public ShowtimeService(IShowTimeRepository repo)
        {
            _repo = repo;
        }

        public IEnumerable<ShowtimeDto> GetShowTimesInAud(int audId)
        {
            return _repo.GetAllShowTimes(audId);
        }

        public void DeleteShowtime(int showtimeId)
        {
            _repo.DeleteShowTime(showtimeId);


        }
        public void AddShowTime(ShowtimeDto dto)
        {

            //todo 更改資料庫後新增判斷有無重疊場次
            var showDate = GetOrCreateShowDate(dto.ShowDateTime.Date);



            ShowtimeDto showTimetoAdd = new ShowtimeDto
            {
                Id = dto.Id,
                AuditoriumId = dto.AuditoriumId,
                MovieInfoId = dto.MovieInfoId,
                ShowDateId = showDate.Id,
                EndTime = dto.EndTime,
                StartTime = dto.StartTime,
                ShowDateTime = dto.ShowDateTime,
            };

            _repo.AddShowTime(showTimetoAdd);


        }



        private ShowDate GetOrCreateShowDate(DateTime date)
        {
            var showDate = _repo.GetShowDateByDate(date);

            if (showDate == null)
            {
                showDate = new ShowDate { ShowTimeDate = date, Id = 0 };
                showDate = _repo.AddShowDate(showDate);
            }

            return showDate;
        }

    }
}