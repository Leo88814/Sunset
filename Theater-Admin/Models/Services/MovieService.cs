using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations.Model;
using System.IO;
using System.Linq;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;
using Theater_Admin.Models.Repositories;
using Theater_Admin.Models.Vms;

namespace Theater_Admin.Models.Services
{
    public class MovieService
    {

        private readonly IMovieRepository _repository;


        public MovieService(IMovieRepository repository)
        {
            _repository = repository;
        }



        public void AddMovie(MovieDto dto, HttpPostedFile file = null)
        {
            bool IsMovieExist = _repository.IsMovieExist(dto.MovieName, dto.MovieLanguage);

            if (IsMovieExist)
            {
                throw new Exception("電影已存在");
            }

            if (file != null && file.ContentLength > 0)
            {
                string newFileName = UploadMovieImage(file);
                if (!string.IsNullOrEmpty(newFileName))
                {
                    dto.MainPicture = newFileName;
                }
                else
                {
                    throw new Exception("上傳失敗或圖片不正確");
                }
            }

            _repository.AddMovie(dto);
        }

        public void DeleteMovie(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<MovieDto> GetAllMovies()
        {
            return _repository.GetAllMovies();
        }


        public void UpdateMovie(MovieDto dto)
        {
            MovieDto movieInDb = _repository.GetMovieById(dto.Id);

            //看起來很怪
            movieInDb.Id = dto.Id;
            movieInDb.GenreId = dto.GenreId;

            movieInDb.MovieName = dto.MovieName;
            movieInDb.EnglishName = dto.EnglishName;
            movieInDb.Grading = dto.Grading;
            movieInDb.Synopsis = dto.Synopsis;
            movieInDb.TrailerURL = dto.TrailerURL;
            movieInDb.PremiereDate = dto.PremiereDate;
            movieInDb.OnAir = dto.OnAir;
            movieInDb.Director = dto.Director;
            movieInDb.MovieCast = dto.MovieCast;
            movieInDb.MovieLanguage = dto.MovieLanguage;
            movieInDb.Duration = dto.Duration;
            movieInDb.Distributor = dto.Distributor;
            movieInDb.MainPicture = dto.MainPicture;
            movieInDb.TotalRating = dto.TotalRating;

            _repository.UpdateMovie(movieInDb);
        }

        public MovieVm GetMovieById(int id)
        {
            var movieInDb = _repository.GetMovieById(id);

            MovieVm vm = MvcApplication._mapper.Map<MovieVm>(movieInDb);
            return vm;
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
    }
}