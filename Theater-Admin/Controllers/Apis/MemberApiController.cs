using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.Repositories;
using Theater_Admin.Models.Services;

namespace Theater_Admin.Controllers.Apis
{
    [RoutePrefix("apis/member")]
    public class MemberApiController : ApiController
    {
        private readonly IMemberRepository _repo = new MemberRepository();

        private readonly MemberService _service;

        public MemberApiController()
        {
            _service = new MemberService(_repo);
        }

        [HttpGet]
        [Route("getall")]
        public IHttpActionResult GetAll()
        {
            var members = _service.GetMembers();

            return Ok(members);
        }

        [HttpPut]
        [Route("suspend/{dto.id}")]
        public IHttpActionResult SuspendMember(MemberDto dto)
        {
            _service.SuspendMember(dto);
            return Ok(dto);
        }
    }
}
