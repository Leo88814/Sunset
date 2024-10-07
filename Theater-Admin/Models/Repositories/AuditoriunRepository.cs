using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;
using System.Data.Entity.SqlServer;
using System.Data.Entity.Core.Objects;


namespace Theater_Admin.Models.Repositories
{
    public interface IAuditoriumRepository
    {
        IEnumerable<AuditoriumDto> GetAllAuditoriums();
        AuditoriumDto GetAuditoriumById(int id);
        void UpdateAuditorium(AuditoriumDto movie);

        ShowTimeScheduleDto GetCurrentShowTime(int auditoriumId, DateTime currentTime);
        ShowTimeScheduleDto GetNextShowTime(int auditoriumId, DateTime currentTime);


    }

    public class AuditoriumRepository : IAuditoriumRepository
    {


        private AppDbContext _db;

        public AuditoriumRepository()
        {
            _db = new AppDbContext();
        }

   public ShowTimeScheduleDto GetCurrentShowTime(int auditoriumId, DateTime currentTime)
    {
        return _db.ShowTimes
            .Where(st => st.AuditoriumId == auditoriumId)
            .AsEnumerable()
            .Select(st => new
            {
                StartDateTime = st.ShowDate.ShowTimeDate.Add(st.StartTime),
                EndDateTime = st.ShowDate.ShowTimeDate.Add(st.EndTime),
                TimeDifference = (st.ShowDate.ShowTimeDate.Add(st.StartTime) - currentTime).TotalSeconds
            })
            .Where(x => x.TimeDifference <= 0 && x.EndDateTime > currentTime)
            .OrderByDescending(x => x.TimeDifference)
            .Select(x => new ShowTimeScheduleDto
            {
                ShowDateTime = x.StartDateTime
            })
            .FirstOrDefault();
    }

    public ShowTimeScheduleDto GetNextShowTime(int auditoriumId, DateTime currentTime)
    {
        return _db.ShowTimes
            .Where(st => st.AuditoriumId == auditoriumId)
            .AsEnumerable()
            .Select(st => new
            {
                ShowTime = st,
                StartDateTime = st.ShowDate.ShowTimeDate.Add(st.StartTime),
                TimeDifference = (st.ShowDate.ShowTimeDate.Add(st.StartTime) - currentTime).TotalSeconds
            })
            .Where(x => x.TimeDifference > 0)
            .OrderBy(x => x.TimeDifference)
            .Select(x => new ShowTimeScheduleDto
            {
                ShowDateTime = x.StartDateTime
            })
            .FirstOrDefault();
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