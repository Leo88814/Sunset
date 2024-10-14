using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.Repositories;

namespace Theater_Admin.Models.Services
{
    public class StillService
    {
        private readonly IStillRepository _repository;


        public StillService(IStillRepository repository)
        {
            _repository = repository;
        }
        public IEnumerable<StillDto> GetAllStills(int movieId)
        {
            return _repository.GetAllStills(movieId);
        }

        public void AddStill(StillDto dto, HttpPostedFile file = null)
        {
            bool IsMaxCount = _repository.IsMaxCount(dto.MovieInfoId);

            if (IsMaxCount)
            {
                throw new Exception("以達到劇照最大數量");
            }


            if (file != null && file.ContentLength > 0)
            {
                string newFileName = UploadMovieImage(file);
                if (!string.IsNullOrEmpty(newFileName))
                {
                    dto.Stills = newFileName;
                }
                else
                {
                    throw new Exception("上傳失敗或圖片不正確");
                }
            }

            _repository.AddMovieStill(dto);
        }

        public string UploadMovieImage(HttpPostedFile file)
        {
            var fileName = file.FileName;
            var fileExtension = Path.GetExtension(fileName);

            if (!IsValidImageFile(fileExtension))
            {
                return null;
            }

            var newFileName = $"{Guid.NewGuid()}{fileExtension}";
            var filePath = Path.Combine(HttpContext.Current.Server.MapPath("~/Images"), newFileName);
            file.SaveAs(filePath);

            return newFileName;
        }

        private bool IsValidImageFile(string extension)
        {
            string[] allowedExtensions = { ".jpg", ".jpeg", ".png" };
            return Array.Exists(allowedExtensions, e => e.Equals(extension, StringComparison.OrdinalIgnoreCase));
        }

        internal void DeleteStill(int stillId)
        {
            _repository.DeleteStill(stillId);
        }
    }
}