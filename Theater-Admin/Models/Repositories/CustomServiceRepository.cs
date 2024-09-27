using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Theater_Admin.Models.Dtos;
using Theater_Admin.Models.EFModels;

namespace Theater_Admin.Models.Repositories
{
    public interface ICustomServiceRepository
    {
        IEnumerable<CustomServiceDto> GetAllMessage();
        void AddMessage(CustomServiceDto message);
        void RemoveMessage(CustomServiceDto message);
        void EditMessage(CustomServiceDto message);

        CustomServiceDto GetMessageById(int id);
    }
    public class CustomServiceRepository : ICustomServiceRepository
    {
        private AppDbContext _db;

        public CustomServiceRepository()
        {
            _db = new AppDbContext();
        }
        IEnumerable<CustomServiceDto> ICustomServiceRepository.GetAllMessage()
        {
            return _db.CustomerServices.AsNoTracking().Select(cs => new CustomServiceDto
                                                                    {
                                                                        Id = cs.Id,
                                                                        Question = cs.Question,
                                                                        Answer = cs.Answer,
                                                                    }).ToList();
        }

        public void AddMessage(CustomServiceDto message)
        {
            throw new NotImplementedException();
        }

        public void RemoveMessage(CustomServiceDto message)
        {
            throw new NotImplementedException();
        }

        public void EditMessage(CustomServiceDto dto)
        {
            CustomerService customerService = MvcApplication._mapper.Map<CustomerService>(dto);

            _db.Entry(customerService).State = System.Data.Entity.EntityState.Modified;
            _db.SaveChanges();
        }

        public CustomServiceDto GetMessageById(int id)
        {
            var QA = _db.CustomerServices.AsNoTracking().FirstOrDefault(x => x.Id == id);

            return new CustomServiceDto
            {
                Id = QA.Id,
                Question = QA.Question,
                Answer = QA.Answer,
            };

        }
    }
}