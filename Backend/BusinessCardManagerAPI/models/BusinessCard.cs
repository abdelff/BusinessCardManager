using System;

namespace BusinessCardManagerAPI.Models
{
    public class BusinessCard
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Company { get; set; }
        public string Title { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
