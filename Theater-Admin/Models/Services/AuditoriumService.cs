using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;
using Theater_Admin.Models.Repositories;

namespace Theater_Admin.Models.Services
{
    public class AuditoriumService
    {
        private readonly IAuditoriumRepository _repo;
        private readonly AppDbContext _db;

        public AuditoriumService()
        {
            _repo = new AuditoriumRepository();
            _db = new AppDbContext();
        }

        public IEnumerable<AuditoriumDto> GetAllAuditoriums()
        {
            return _repo.GetAllAuditoriums();
        }


        public void UpdateAuditorium(AuditoriumDto dto)
        {
            AuditoriumDto auditoriumInDb = _repo.GetAuditoriumById(dto.Id);

            //找出這個廳是否正在播放電影

            //var onAirMovie = _db.Showtimes
            //if(_db.)


            auditoriumInDb.AuditoriumStatus = dto.AuditoriumStatus;

            _repo.UpdateAuditorium(auditoriumInDb);
        }

    }
}