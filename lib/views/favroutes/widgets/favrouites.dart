import 'package:flutter/material.dart';
import 'package:travel_app/appColors/colors.dart';
import 'package:travel_app/services/global.dart';

// ignore: must_be_immutable
class FavrouitesList extends StatelessWidget {
  FavrouitesList({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 600,
            width: double.infinity,
            child: favourite.isEmpty ? const Center(child: Text('No Favourites')) : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: favourite.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kcPrimaryColor.withOpacity(0.07),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.04),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              favourite[index].imageUrl,
                              fit: BoxFit.cover,
                            )),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: FittedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                favourite[index].placeName,
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: -0.3,
                                  fontWeight: FontWeight.w700,
                                  color: kcBalckColor,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                favourite[index].location,
                                style:  TextStyle(
                                  fontSize: 14,
                                  letterSpacing: -0.3,
                                  fontWeight: FontWeight.w300,
                                  color: kcBalckColor,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    favourite[index].rating,
                                    style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: -0.3,
                                      fontWeight: FontWeight.w300,
                                      color: kcBalckColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
