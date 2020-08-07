
class Restaurant {
  double distFromUser;

  //Stores the community rating for the restaurant
  double rating;

  //Stores the user's rating of the restaurant if it exists
  double userRating;

  String name;
  String address;
  String phone;

  //Tracks whether the user has favorited the restaurant
  bool favorited;

  //Parameterized constructor
  Restaurant(this.distFromUser, this.rating, this.userRating, this.name, this.address, this.phone, this.favorited);
}
