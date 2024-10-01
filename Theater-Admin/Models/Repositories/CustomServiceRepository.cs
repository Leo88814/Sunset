using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
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

        void DeleteMessage(CustomServiceDto message);
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
            _db.CustomerServices.Add(new CustomerService
            {
                Id = message.Id,
                Question = message.Question,
                Answer = message.Answer,


            });
            _db.SaveChanges();
        }

        public void RemoveMessage(CustomServiceDto message)
        {
            var target =_db.CustomerServices.AsNoTracking().FirstOrDefault(x => x.Id == message.Id);
            _db.CustomerServices.Remove(target);
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

        public void DeleteMessage(CustomServiceDto message)
        {
            var toDelete = _db.CustomerServices.AsNoTracking().FirstOrDefault(y => y.Id == message.Id);
            _db.CustomerServices.Remove(toDelete);
            _db.SaveChanges();
        }
    }
}