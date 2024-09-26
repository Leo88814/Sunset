using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations.Model;
using System.Linq;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;
using Theater_Admin.Models.Repositories;

namespace Theater_Admin.Models.Services
{
    public class MovieService
    {

        private readonly IMovieRepository _repository;


        public MovieService(IMovieRepository repository)
        {
            _repository = repository;
        }



        public void AddMovie(MovieDto dto)
        {
            bool IsMovieExist = _repository.IsMovieExist(dto.MovieName, dto.MovieLanguage);

            if (IsMovieExist)
            {
                throw new Exception("電影已存在");
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
            movieInDb.MovieName = dto.MovieName;
            movieInDb.GenreId = dto.GenreId;
            movieInDb.MovieLanguage = dto.MovieLanguage;
            movieInDb.MovieName = dto.MovieName;
            movieInDb.EnglishName = dto.EnglishName;
            movieInDb.Grading = dto.Grading;
            movieInDb.Synopsis = dto.Synopsis;
            movieInDb.TrailerURL = dto.TrailerURL;
            movieInDb.PremiereDate = dto.PremiereDate;
            movieInDb.OnAir = dto.OnAir;
            movieInDb.Director = dto.Director;
            movieInDb.MainPicture = dto.MainPicture;
            movieInDb.Distributor = dto.Distributor;

            _repository.UpdateMovie(movieInDb);
        }

        public MovieDto GetMovieById(int id)
        {
            return _repository.GetMovieById(id);
        }
    }
}