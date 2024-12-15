using Microsoft.EntityFrameworkCore;

namespace BusinessCardManagerAPI.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<BusinessCard> BusinessCards { get; set; } 
    }
}
