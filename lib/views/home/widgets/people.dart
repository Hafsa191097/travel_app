// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/appColors/colors.dart';

class PeopleList extends StatelessWidget {
  const PeopleList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 20),
            // padding: EdgeInsets.(10.h),
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
                      'assets/place2.jpg',
                      fit: BoxFit.cover,
                    )
                        
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FittedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          'Culinary Rutella',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        
                         Text(
                          'Loaction: Paris, France',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}