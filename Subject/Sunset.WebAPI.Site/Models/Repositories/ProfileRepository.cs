using AutoMapper;
using Sunset.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Sunset.WebAPI.Site.Models.Repositories
{
    public class ProfileRepository
    {
        private readonly AppDbContext _context;

        public ProfileRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<bool> UpdateProfileAsync(Member member)
        {
            var existingMember = await _context.Members.FindAsync(member.Id);
            if (existingMember == null) return false;

            existingMember.MemberName = member.MemberName;
            existingMember.PhoneNumber = member.PhoneNumber;
            existingMember.Address = member.Address;
            existingMember.DateOfBirth = member.DateOfBirth;

            try
            {
                await _context.SaveChangesAsync();
                return true;
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var validationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Diagnostics.Debug.WriteLine($"Property: {validationError.PropertyName} Error: {validationError.ErrorMessage}");
                    }
                }
                throw;
            }
        }

        public Member GetMemberByEmail(string email)
        {
            return _context.Members.FirstOrDefault(m => m.Email == email);
        }

    }
}