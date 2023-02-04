import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStar extends StatelessWidget {
  final double rating;
  final double size;
  const RatingStar({super.key, required this.rating, required this.size});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: size,
      glow: false,
      itemCount: int.parse(rating.toString()[0]),
      initialRating: rating,
      maxRating: 5,
      ratingWidget: RatingWidget(
          full: Icon(Icons.star, color: Colors.yellow.shade900),
          half: Icon(Icons.star, color: Colors.yellow.shade900),
          empty: Icon(Icons.star, color: Colors.yellow.shade900)),
      onRatingUpdate: (value) {},
    );
  }
}
