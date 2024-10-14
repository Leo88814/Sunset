using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;

namespace Theater_Admin.Models.Repositories
{
    public interface IMovieRepository
    {
        IEnumerable<MovieDto> GetAllMovies();
        MovieDto GetMovieById(int id);
        void AddMovie(MovieDto movie);
        void UpdateMovie(MovieDto movie);
        //void DeleteMovie(int id); //也許軟刪除

        bool IsMovieExist(string name, string language);
    }

    public class MovieRepository : IMovieRepository
    {


        private AppDbContext _db;

        public MovieRepository()
        {
            _db = new AppDbContext();
        }

        public MovieRepository(AppDbContext db)
        {
            _db = db;
        }



        public void AddMovie(MovieDto dto)
        {
            _db.MovieInfos.Add(new MovieInfo
            {
                Id = dto.Id,
                GenreId = dto.GenreId,
               
                MovieName = dto.MovieName,
                EnglishName = dto.EnglishName,
                Grading = dto.Grading,
                Synopsis = dto.Synopsis,
                TrailerURL = dto.TrailerURL,
                PremiereDate = dto.PremiereDate,
                OnAir = dto.OnAir,
                Director = dto.Director,
                MovieCast = dto.MovieCast,
                MovieLanguage = dto.MovieLanguage,
                Duration = dto.Duration,
                Distributor = dto.Distributor,
                MainPicture = dto.MainPicture,
                TotalRating = 0,


            });

            _db.SaveChanges();

        }

        public MovieDto GetMovieById(int id)
        {
            var movie = _db.MovieInfos.AsNoTracking().FirstOrDefault(x => x.Id == id);
            if (movie == null)
                return null;

            return new MovieDto
            {
                Id = movie.Id,
                GenreId = movie.GenreId,

                MovieName = movie.MovieName,
                EnglishName = movie.EnglishName,
                Grading = movie.Grading,
                Synopsis = movie.Synopsis,
                TrailerURL = movie.TrailerURL,
                PremiereDate = movie.PremiereDate,
                OnAir = movie.OnAir,
                Director = movie.Director,
                MovieCast = movie.MovieCast,
                MovieLanguage = movie.MovieLanguage,
                Duration = movie.Duration,
                Distributor = movie.Distributor,
                MainPicture = movie.MainPicture,
                TotalRating = movie.TotalRating,
            };
        }

        public void UpdateMovie(MovieDto dto)
        {
            MovieInfo movie = MvcApplication._mapper.Map<MovieInfo>(dto);

            _db.Entry(movie).State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
        }

        IEnumerable<MovieDto> IMovieRepository.GetAllMovies()
        {
            return _db.MovieInfos
        .AsNoTracking()
        .Select(m => new MovieDto
        {
            Id = m.Id,
            GenreId = m.GenreId,
            MovieName = m.MovieName,
            EnglishName = m.EnglishName,
            Grading = m.Grading,
            Synopsis = m.Synopsis,
            TrailerURL = m.TrailerURL,
            PremiereDate = m.PremiereDate,
            OnAir = m.OnAir,
            Director = m.Director,
            MovieCast = m.MovieCast,
            MovieLanguage = m.MovieLanguage,
            Duration = m.Duration,
            Distributor = m.Distributor,
            MainPicture = m.MainPicture,
            TotalRating = m.TotalRating,
        })
        .ToList();
        }

        public bool IsMovieExist(string name, string language) //如果有電影名稱和語言名稱相同的判斷為存在
        {
            var movie = _db.MovieInfos.FirstOrDefault(m => m.MovieName == name && m.MovieLanguage == language);
            return movie != null;
        }
    }
}
