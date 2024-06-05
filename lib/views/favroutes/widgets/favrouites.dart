import 'package:flutter/material.dart';
import 'package:travel_app/appColors/colors.dart';
import 'package:travel_app/models/place.dart';

// ignore: must_be_immutable
class FavrouitesList extends StatelessWidget {
  FavrouitesList({super.key, required this.places});
  List<Places> places;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcWhiteColor,
      appBar: AppBar(
        backgroundColor: kcWhiteColor,
        elevation: 0,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            height: 26,
            width: 26,
            child: Icon(
              Icons.arrow_back_ios,
              color: kcBalckColor,
              size: 18,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Favrouite Places',
          style: TextStyle(
            color: kcPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        height: 400,
        width: double.infinity,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: places.length,
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
                          places[index].imageUrl,
                          fit: BoxFit.cover,
                        )),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FittedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            places[index].placeName,
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: -0.3,
                              fontWeight: FontWeight.w700,
                              color: kcBalckColor,
                            ),
                          ),
                          Text(
                            places[index].location,
                            style:  TextStyle(
                              fontSize: 14,
                              letterSpacing: -0.3,
                              fontWeight: FontWeight.w300,
                              color: kcBalckColor,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Text(
                                places[index].rating,
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
    );
  }
}
