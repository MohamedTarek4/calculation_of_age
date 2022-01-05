import 'package:calculate_age/classes/class.dart';
import 'package:calculate_age/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:calculate_age/functions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //intializing the dropdownlist of the "Days"
  List<DropdownMenuItem<Days>> _dropdownMenuDaysItems;

  //intializing the dropdownlist of the "Months"
  List<DropdownMenuItem<Months>> _dropdownMenuMonthesItems;

  Days _selectedItemDays;
  Months _selectedItemMonthes;

  //the TextEditingController of the textfield of the year
  TextEditingController yearTextEditingController = TextEditingController();

  void initState() {
    super.initState();
    //this is a list of dropdownlist to create the dropdownbottom of the "Days"
    _dropdownMenuDaysItems = buildDropDownMenuItems(getDaysItems());
    _selectedItemDays = _dropdownMenuDaysItems[0].value;

    //this is a list of dropdownlist to create the dropdownbottom of the "Months"
    _dropdownMenuMonthesItems = buildDropDownMenuMonthesItems(getMonthsItems());
    _selectedItemMonthes = _dropdownMenuMonthesItems[0].value;
  }

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //appbar,  the implmentation is founded at the class "function"
      appBar: calculateAge_appBar,

      //body
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomSizedBox(height: 80), // sizedBox that have a hieght 80

            TextModel(
                text: "Choose: ", size: 25.0, fontWeight: FontWeight.bold),

            CustomSizedBox(height: 30), // sizedBox with a hieght 30


            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextModel(text: "Day: "),
                CustomSizedBox(width: 100),
                DropdownButton<Days>(
                    value: _selectedItemDays,
                    items: _dropdownMenuDaysItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedItemDays = value;
                      });
                    }),
              ],
            ),



           

            CustomSizedBox(height: 30), // sizedBox with a hieght 30

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextModel(text: "Month: "),
                CustomSizedBox(width: 80), // sizedBox with a hieght 80
                DropdownButton<Months>(
                    value: _selectedItemMonthes,
                    items: _dropdownMenuMonthesItems,
                    onChanged: (value2) {
                      setState(() {
                        _selectedItemMonthes = value2;
                      });
                    }),
              ],
            ),

            CustomSizedBox(height: 30), // sizedBox with a hieght 30

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextModel(text: "Year: "),
                CustomSizedBox(width: 80), // sizedBox with a hieght 80
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: TextField(
                    autocorrect: true,
                    keyboardType: TextInputType.number,
                    controller: yearTextEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'year',
                    ),
                  ),
                ),
              ],
            ),

            //////////////////////////////////////////////////////////////////////////////////////////////
            CustomSizedBox(height: 30), // sizedBox with a hieght 30

            Center(
              child: SizedBox(
                width: 400,
                child: OutlineButton(
                  onPressed: () {

                    int y =yearTextEditingController==null?0: int.parse(yearTextEditingController.text);
                    int m = _selectedItemMonthes.numbermonth;
                    int d = _selectedItemDays.number;
                    CalculateAge(context, y, m, d);
                  },

                  child: Text("Calculate",
                      style: TextStyle(color: Colors.blueGrey[900])),
                  color: Colors.blueGrey[900],
                  borderSide:
                      new BorderSide(color: Colors.blueGrey[900], width: 3.0),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}

class TextModel extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;

  const TextModel({Key key, @required this.text, this.size, this.fontWeight, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size == null ? 18.0 : size,
        color: color==null? Colors.black: color,
        fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
      ),
    );
  }
}

class CustomSizedBox extends StatelessWidget {
  final double height;
  final double width;

  CustomSizedBox({
    double this.height,
    double this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height == null ? 0 : height,
      width: width == null ? 0 : width,
    );
  }
}
