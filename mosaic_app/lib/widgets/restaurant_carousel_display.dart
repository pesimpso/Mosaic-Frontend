import 'package:flutter/material.dart';
import 'package:mosaicapp/models/restaurant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mosaicapp/widgets/restaurant_carousel_card.dart';

//Card to display restaurant information on a card for carousel display
class RestaurantCarouselDisplay extends StatelessWidget {
  List<Restaurant> _restaurants;
  List<RestaurantCarouselCard> cards = List<RestaurantCarouselCard>();

  RestaurantCarouselDisplay({@required List<Restaurant> restaurants}) {
    this._restaurants = restaurants;
    for (Restaurant restaurant in restaurants) {
      cards.add(RestaurantCarouselCard(restaurant));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 190,
        enableInfiniteScroll: true,
        reverse: true,
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.4,
      ),
      items: cards,
    );
  }
}
