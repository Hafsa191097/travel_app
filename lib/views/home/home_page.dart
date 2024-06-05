// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/appColors/colors.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/views/favroutes/widgets/favrouites.dart';
import 'package:travel_app/views/home/widgets/people.dart';
import 'package:travel_app/views/home/widgets/places_card.dart';
import 'package:travel_app/views/home/widgets/popular_places.dart';
import 'package:travel_app/views/home/widgets/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String searchTerm = "";

class _HomeScreenState extends State<HomeScreen> {
  List<PlaceCard> places = [
    PlaceCard(
      place: Places(
        imageUrl: 'assets/place1.png',
        placeName: 'Bridge Fuji, Tokyo',
        location: 'Tokyo, Japan',
        rating: '4.8',
      ),
    ),
    PlaceCard(
        place: Places(
      imageUrl: 'assets/place2.jpg',
      placeName: 'Andes, South America',
      location: 'South America',
      rating: '3.8',
    )),
    PlaceCard(
      place: Places(
        imageUrl: 'assets/place3.jpg',
        placeName: 'Saint-Georges-dElle',
        location: 'Normandie, France',
        rating: '4',
      ),
    ),
    PlaceCard(
      place: Places(
        imageUrl: 'assets/place4.jpg',
        placeName: 'Maldieves, Shanga',
        location: 'Maldieves',
        rating: '3.8',
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kcWhiteColor,
        elevation: 0,
        toolbarHeight: 100,
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hi, David 👋',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Explore the world',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/profile.png'),
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          _buildHomeScreen(),
          FavrouitesList(
              places: places.map((placeCard) => placeCard.place).toList()),
          Center(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarr(
              searchTerm,
              onUpdateSearchTerm: (value) => setState(() => searchTerm = value),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Popular places',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            PopularPlaces(places: places, searchTerm: searchTerm),
            SizedBox(height: 25),
            const PeopleList(),
          ],
        ),
      ),
    );
  }
}
