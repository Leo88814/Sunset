using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;

namespace Theater_Admin.Models.Repositories
{
    public interface IAuditoriumRepository
    {
        IEnumerable<AuditoriumDto> GetAllAuditoriums();
        AuditoriumDto GetAuditoriumById(int id);
        void UpdateAuditorium(AuditoriumDto movie);

        bool CanEdit(int id);
    }

    public class AuditoriumRepository : IAuditoriumRepository
    {


        private AppDbContext _db;

        public AuditoriumRepository()
        {
            _db = new AppDbContext();
        }




        public IEnumerable<Auditorium> GetAllAuditorium()
        {
            return _db.Auditoriums;
        }


        public AuditoriumDto GetAuditoriumById(int id)
        {
            var auditoriums = _db.Auditoriums.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (auditoriums == null)
                return null;

            return new AuditoriumDto
            {
                Id = auditoriums.Id,
                CinemaId = auditoriums.CinemaId,
                AuditoriumName = auditoriums.AuditoriumName,
                SeatCapacity = auditoriums.SeatCapacity,
                AuditoriumStatus = auditoriums.AuditoriumStatus,
            };
        }

        public bool CanEdit(int id)
        {
            DateTime currentTime = DateTime.Now;

            var currentShowTime =
                _db.Showtimes.Where(st => st.AuditoriumId == id &&                      //尋找使用這個影廳id的場次                                                                                   
                 st.ShowtimeDate.Add(st.StartTime) <= currentTime &&                    //場次開始的時間必須小於現在
                 st.ShowtimeDate.Add(st.EndTime) > currentTime).FirstOrDefault();       //場次結束的時間必須大於現在  也許可省略

            var nextShowTime =
                _db.Showtimes.Where(st => st.AuditoriumId == id &&                      //使用影廳id尋找使用這個影廳的場次                                                                                     
                                    st.ShowtimeDate.Add(st.StartTime) > currentTime)    //場次的時間必須大於現在
                                    .OrderBy(st => st.ShowtimeDate)                     
                                    .ThenBy(st => st.StartTime)
                                    .FirstOrDefault();                                  //根據規則排序的第一個為下一場


            if (currentShowTime != null) //影廳正在使用中
            {
                return false;
            }
            else if (nextShowTime != null &&   
                     nextShowTime.ShowtimeDate.Add(nextShowTime.StartTime) <= currentTime.AddMinutes(30))
            {
                return false;
            }//影廳目前未使用，但30分鐘內有新的電影上映，不可修改
            else
            {
                return true;
            }//影廳目前未使用，且30分鐘內沒有新的電影上映，可以進行修改
        }

        public void UpdateAuditorium(AuditoriumDto dto)
        {
            Auditorium auditorium = MvcApplication._mapper.Map<Auditorium>(dto);

            _db.Entry(auditorium).State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
        }

        IEnumerable<AuditoriumDto> IAuditoriumRepository.GetAllAuditoriums()
        {
            return _db.Auditoriums
        .AsNoTracking()
        .Select(m => new AuditoriumDto
        {
            Id = m.Id,
            CinemaId = m.CinemaId,
            AuditoriumName = m.AuditoriumName,
            SeatCapacity = m.SeatCapacity,
            AuditoriumStatus = m.AuditoriumStatus,


        })
        .ToList();
        }


    }
}