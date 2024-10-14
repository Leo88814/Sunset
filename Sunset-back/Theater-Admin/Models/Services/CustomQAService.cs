using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.Repositories;

namespace Theater_Admin.Models.Services
{
    public class CustomQAService
    {
        private readonly ICustomServiceRepository _repository;

        public CustomQAService()
        {
            _repository = new CustomServiceRepository();
        }

        public IEnumerable<CustomServiceDto> GetAll()
        {
            return _repository.GetAllMessage();
        }


        public void Update(CustomServiceDto dto)
        {
            var QAinDb = _repository.GetMessageById(dto.Id);

            QAinDb.Question = dto.Question;
            QAinDb.Answer = dto.Answer; 

            _repository.EditMessage(QAinDb);

        }

        public void Delete(CustomServiceDto dto)
        {
            _repository.RemoveMessage(dto);
        }

    }
}