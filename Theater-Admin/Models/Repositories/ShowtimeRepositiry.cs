using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;
using Theater_Admin.Models.Vms;

namespace Theater_Admin.Models.Repositories
{
    public interface IShowTimeRepository
    {
        IEnumerable<ShowtimeDto> GetAllShowTimes(int AudId); //影廳id

        void AddShowTime(ShowtimeDto dto);
        void DeleteShowTime(int showtimeId); //showtimeid

        bool HasOverLapShowtime(ShowtimeDto dto);

        bool CanRemove(int showtimeId);

        ShowDate GetShowDateByDate(DateTime date);
        ShowDate AddShowDate(ShowDate showDate);
    }

    public class ShowtimeRepository : IShowTimeRepository
    {
        private AppDbContext _db;

        public ShowtimeRepository()
        {
            _db = new AppDbContext();
        }

        public ShowDate GetOrCreateShowDate(DateTime date)
        {
            var showDate = _db.ShowDates
                .FirstOrDefault(sd => sd.ShowTimeDate.Date == date.Date);

            if (showDate == null)
            {
                showDate = new ShowDate { ShowTimeDate = date, Id = 0 };

                _db.ShowDates.Add(showDate);

                _db.SaveChanges();
            }

            return showDate;
        }

        public void AddShowTime(ShowtimeDto dto)
        {
            _db.ShowTimes.Add(new ShowTime
            {
                Id = dto.Id,
                MovieInfoId = dto.MovieInfoId,
                ShowDateId = dto.ShowDateId,
                AuditoriumId = dto.AuditoriumId,
                StartTime = dto.StartTime,
                EndTime = dto.EndTime,
            });

            _db.SaveChanges();
        }

        public void DeleteShowTime(int showtimeId)
        {
            var showTimeInDb = _db.ShowTimes
                .FirstOrDefault(x => x.Id == showtimeId);

            _db.ShowTimes.Remove(showTimeInDb);
            _db.SaveChanges();
        }

        public IEnumerable<ShowtimeDto> GetAllShowTimes(int AudId)
        {

            return _db.ShowTimes
                   .AsNoTracking().Where(x => x.AuditoriumId == AudId)
                   .Select(s => new ShowtimeDto
                   {
                       Id = s.Id,
                       MovieInfoId = s.MovieInfoId,
                       ShowDateId = s.ShowDateId,
                       AuditoriumId = s.AuditoriumId,
                       StartTime = s.StartTime,
                       EndTime = s.EndTime,
                       ShowDateTime = DateTime.UtcNow,  //默認值
                   }).ToList();
        }

        public bool HasOverLapShowtime(ShowtimeDto dto)
        {
            var date = dto.ShowDateTime.Date;
            return _db.ShowTimes
                .Where(st => st.ShowDate.ShowTimeDate.Year == date.Year
                    && st.ShowDate.ShowTimeDate.Month == date.Month
                    && st.ShowDate.ShowTimeDate.Day == date.Day
                    && st.MovieInfoId == dto.MovieInfoId
                    && st.AuditoriumId == dto.AuditoriumId)
                .AsEnumerable()
                .Any(st => !(dto.EndTime <= st.StartTime || dto.StartTime >= st.EndTime));
        }



        public ShowDate GetShowDateByDate(DateTime date)
        {
            return _db.ShowDates
            .Where(sd => sd.ShowTimeDate.Year == date.Year
                && sd.ShowTimeDate.Month == date.Month
                && sd.ShowTimeDate.Day == date.Day)
            .FirstOrDefault();
        }

        public ShowDate AddShowDate(ShowDate showDate)
        {
            _db.ShowDates.Add(showDate);
            _db.SaveChanges();
            return showDate;
        }

        public bool CanRemove(int showtimeId)
        {
            return !_db.MovieReleaseSchedules.AsNoTracking().Any(x => x.ShowTimeId == showtimeId);
        }
    }
}