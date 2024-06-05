import 'package:flutter/material.dart';
import 'package:travel_app/appColors/colors.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/views/home/widgets/places_card.dart';

class PopularPlaces extends StatelessWidget {
  const PopularPlaces(
      {super.key, required this.places, required this.searchTerm});
  final List<PlaceCard> places;
  final String searchTerm;
  @override
  Widget build(BuildContext context) {
    final filteredPlaces = places
        .where((place) =>
            place.place.placeName.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Chip(
              key: UniqueKey(),
              label:  Text(
                'Nature',
                style: TextStyle(color: kcWhiteColor),
              ),
              color: const MaterialStatePropertyAll(Colors.black54),
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              visualDensity: VisualDensity.compact,
              labelStyle: const TextStyle(fontSize: 12),
              labelPadding: const EdgeInsets.all(4),
            ),
            Chip(
              key: UniqueKey(),
              label: const Text('Adventure'),
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              visualDensity: VisualDensity.compact,
              labelStyle: const TextStyle(fontSize: 12),
              labelPadding: const EdgeInsets.all(4),
            ),
            Chip(
              key: UniqueKey(),
              label: const Text('Culture'),
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              visualDensity: VisualDensity.compact,
              labelStyle: const TextStyle(fontSize: 12),
              labelPadding: const EdgeInsets.all(4),
            ),
            Chip(
              key: UniqueKey(),
              label: const Text('Food'),
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              visualDensity: VisualDensity.compact,
              labelStyle: const TextStyle(fontSize: 12),
              labelPadding: const EdgeInsets.all(4),
            ),
          ],
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: filteredPlaces
                .map((place) => PlaceCard(
                      place: Places(
                        imageUrl: place.place.imageUrl,
                      placeName: place.place.placeName,
                      location: place.place.location,
                      rating: place.place.rating,
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

