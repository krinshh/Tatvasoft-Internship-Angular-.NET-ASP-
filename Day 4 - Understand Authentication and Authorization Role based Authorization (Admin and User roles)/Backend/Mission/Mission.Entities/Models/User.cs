using System.ComponentModel.DataAnnotations;

namespace Mission.Entities.Models
{
  public class User
  {
    public int Id { get; set; }
    public required string FirstName { get; set; }
    public required string LastName { get; set; }
    public required string EmailAddress { get; set; }
    public required string Password { get; set; }
    public required string PhoneNumber { get; set; }
    public required string UserType { get; set; }
    public string? UserImage { get; set; }  // Optional
  }

}
