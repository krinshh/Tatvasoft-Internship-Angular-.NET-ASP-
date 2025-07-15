using Microsoft.EntityFrameworkCore;
using Mission.Entities.Models;

namespace Mission.Entities
{
    public class MissionDbContext(DbContextOptions<MissionDbContext> options) : DbContext(options)
    {
        public DbSet<User> Users { get; set; }

        public DbSet<MissionSkill> MissionSkills { get; set; }

        public DbSet<MissionTheme> MissionThemes { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().HasData(new User()
            {
                Id = 1,
                FirstName = "krinsh",
                LastName = "dhedhi",
                EmailAddress = "krinshdhedhi@gmai.com",
                Password = "admin",
                PhoneNumber = "01234567890",
                UserType = "admin",
            });

            base.OnModelCreating(modelBuilder);
        }
    }
}
