import 'package:calculate_age/classes/class.dart';
import 'package:calculate_age/widgets/bottomSheet.dart';
import 'package:flutter/material.dart';

//this function returns all days as a list
List<Days> getDaysItems() {
  List<Days> _daysItems = [
    for (int x = 0; x <= 30; x++) Days(x, x),
  ];

  return _daysItems;
}

//this function returns all month as a list
List<Months> getMonthsItems() {
  List<Months> _monthItems = [
    for (int x = 0; x <= 12; x++) Months(x, x),
  ];

  return _monthItems;
}

//creating the dropdownmenu of Days
List<DropdownMenuItem<Days>> buildDropDownMenuItems(List listItems) {
  List<DropdownMenuItem<Days>> items = [];
  for (Days listItem in listItems) {
    items.add(
      DropdownMenuItem(
        child: Text(listItem.number.toString()),
        value: listItem,
      ),
    );
  }
  return items;
}

//creating the dropdownmenu of Months
List<DropdownMenuItem<Months>> buildDropDownMenuMonthesItems(List listItems) {
  List<DropdownMenuItem<Months>> items = [];
  for (Months listItem in listItems) {
    items.add(
      DropdownMenuItem(
        child: Text(listItem.numbermonth.toString()),
        value: listItem,
      ),
    );
  }
  return items;
}

//////////////////////////////////////////////////////////////////////////////////////
////////////////////////CALCULATING THE AGE//////////////////////////////////////////

//this function calculate the age by passing (year, month, day) to it
void CalculateAge(BuildContext context, y, m, d) {
  //intializing the year of birth
  int yearOfBirth;
  //intializing the day of birth
  int DayOfBirth;
  //intializing the month of birth
  int monthOfBirth;

  //intializing the DateTime to get the time now
  DateTime now = new DateTime.now();

  //calculation of values
  yearOfBirth = (now.year - y) - 1;
  monthOfBirth = ((12 - m) + now.month) - 1;
  DayOfBirth = ((30 - d) + now.day);

  if (DayOfBirth >= 30) {
    DayOfBirth = DayOfBirth - 30;
    monthOfBirth = monthOfBirth + 1;
  }
  if (monthOfBirth >= 12) {
    yearOfBirth++;
    monthOfBirth = monthOfBirth - 12;
  }
  if (y > now.year || y == 0 || y == null) {
    yearOfBirth = 0;
  }
  if (d == 0) {
    DayOfBirth = 0;
  }
  if (m == 0) {
    monthOfBirth = 0;
  }

  //calculating how many monthes remain on the birthday
  int monthsRemain = (12 - monthOfBirth) - 1;
  int daysRemain = (30 - DayOfBirth);

  CustomBottomSheet(
    context,
    year: yearOfBirth,
    month: monthOfBirth,
    day: DayOfBirth,
    monthsRemain: monthsRemain,
    daysRemain: daysRemain,
  );
}
