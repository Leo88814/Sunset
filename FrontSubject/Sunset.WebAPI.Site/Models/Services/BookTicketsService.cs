using Sunset.WebAPI.Site.Models.Dtos;
using Sunset.WebAPI.Site.Models.Exts;
using Sunset.WebAPI.Site.Models.Repositories;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Services
{
    public class BookTicketsService
    {
        private readonly BookTicketsRepository _repo;

        public BookTicketsService()
        {
            _repo = new BookTicketsRepository();
        }

        public List<ChoiceMoviesDto> GetInfo()
        {
            var path = "../images/";
            var indexMovie = _repo.GetMovie();
            indexMovie.MatchPath(path);

            return indexMovie;
        }

       
    }
}