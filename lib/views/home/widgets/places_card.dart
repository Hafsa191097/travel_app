
import 'package:flutter/material.dart';
import 'package:travel_app/appColors/colors.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/services/share.dart';

// ignore: must_be_immutable
class PlaceCard extends StatefulWidget {
  Places place;

  // ignore: prefer_const_constructors_in_immutables
  PlaceCard({
    super.key,
    required this.place
  });

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  bool isfavourite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.asset(
              widget.place.imageUrl,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.place.placeName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.white, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          widget.place.location,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        const Spacer(),
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          widget.place.rating,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
             Positioned(
              top: 15,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  ShareData.shareRecipeToEmail(widget.place);
                },
                child: const Icon(
                  Icons.share_location_outlined,
                  color: Colors.white,
                ),
              ),
            ),
             Positioned(
              top: 15,
              left: 8,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    isfavourite = !isfavourite;
                  });
                },
                child: isfavourite ? Icon(Icons.favorite, color: kcPrimaryColor) : const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
