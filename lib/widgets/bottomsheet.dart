import 'package:calculate_age/screens/home.dart';
import 'package:flutter/material.dart';

void CustomBottomSheet(BuildContext context,
    {int year, int month, int day, int monthsRemain, int daysRemain}) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        if (month == 0 || day == 0 || year == 0 || year == null) {
          return Container(
            color: Colors.blueGrey[900],
            child: Center(
              child: Text(
                "Invalid data",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.blueGrey[900],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextModel(
                    text: "Your Age",
                    size: 25.0,
                    color: Colors.white,
                  ),
                  TextModel(
                    text:
                        "You have $year years and  $month months and $day days",
                    size: 15.0,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextModel(
                      text: "Time Remains For Your Birthday",
                      size: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextModel(
                    text: " $monthsRemain monthes and  $daysRemain days",
                    size: 15.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
        }
      });
}
