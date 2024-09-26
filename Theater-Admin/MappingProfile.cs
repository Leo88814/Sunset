﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;
namespace Theater_Admin
{
    public class MappingProfile:Profile
    {
        public MappingProfile()
        {
            CreateMap<MovieDto,Movie>().ReverseMap();
            CreateMap<AuditoriumDto, Auditorium>().ReverseMap();
        }
    }
}