using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using AutoMapper;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;
using Theater_Admin.Models.Vms;
namespace Theater_Admin
{
    public class MappingProfile:Profile
    {
        public MappingProfile()
        {
            CreateMap<MovieDto,MovieInfo>().ReverseMap();
            CreateMap<AuditoriumDto, Auditorium>().ReverseMap();
            //CreateMap<ShowtimeDto, ShowTime>().ReverseMap();
            CreateMap<CustomServiceDto,CustomerService>().ReverseMap();
            CreateMap<MemberDto,Member>().ReverseMap();
        
            CreateMap<MovieVm, MovieDto>().ReverseMap();
            CreateMap<StillVm, StillDto>().ReverseMap();
            CreateMap<StillDto,MovieImage>().ReverseMap(); 
            CreateMap<AuditoriumVm, AuditoriumDto>();
            CreateMap<CustomServiceVm, CustomServiceDto>();
            CreateMap<MemberVm, MemberDto>();
            CreateMap<ShowtimeVm, ShowtimeDto>().ReverseMap();
            CreateMap<ShowtimeDto, ShowTime>().ReverseMap();
            CreateMap<LoginVm, LoginDto>();
            CreateMap<User,LoginDto>();
        }
    }
}