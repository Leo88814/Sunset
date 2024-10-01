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


        public AuditoriumService(IAuditoriumRepository repo)
        {
            _repo = repo;

        }

        public IEnumerable<AuditoriumDto> GetAllAuditoriums()
        {
            return _repo.GetAllAuditoriums();
        }

        public bool IsAuditoriumInUse(int auditoriumId)
        {
            DateTime currentTime = DateTime.Now;

            var currentShowTime = _repo.GetCurrentShowTime(auditoriumId, currentTime);
            var nextShowTime = _repo.GetNextShowTime(auditoriumId, currentTime);

            if (currentShowTime != null)
            {
                return true; // 當前有正在進行的放映
            }
            else if (nextShowTime != null && nextShowTime.ShowDateTime <= currentTime.AddMinutes(30))
            {
                return true; // 30分鐘內有新的放映開始
            }
            else
            {
                return false; // 影廳當前未使用，且30分鐘內沒有新的放映
            }
        }


        public void UpdateAuditorium(AuditoriumDto dto)
        {
            AuditoriumDto auditoriumInDb = _repo.GetAuditoriumById(dto.Id);

            if (!IsAuditoriumInUse(dto.Id))
            {
                auditoriumInDb.AuditoriumStatus = dto.AuditoriumStatus;

                _repo.UpdateAuditorium(auditoriumInDb);
            }


        }

    }
}