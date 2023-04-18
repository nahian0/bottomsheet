import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class BottomSheett extends StatefulWidget {
  BottomSheett({super.key});

  @override
  State<BottomSheett> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheett> {
  DateTime? selectedFromDate;
  DateTime? selectedToDate;

  TextEditingController _fromDateController = TextEditingController();
  TextEditingController _toDateController = TextEditingController();
  TextEditingController _keyWordsController = TextEditingController();

  String text1 = "";
  String text2 = "";
  String text3 = "";

  void _setText(BuildContext context) {
    setState(() {
      text1 = _fromDateController.text;
      text2 = _toDateController.text;
      text3 = _keyWordsController.text;
    });
  }

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedFromDate ?? DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedFromDate)
      setState(() {
        selectedFromDate = picked;
        _fromDateController.text =
            DateFormat('yyyy-MM-dd').format(selectedFromDate!);
      });
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedToDate ?? DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedToDate)
      setState(() {
        selectedToDate = picked;
        _toDateController.text =
            DateFormat('yyyy-MM-dd').format(selectedToDate!);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(187, 204, 204, 231),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              child: const Text('Bottom Sheet'),
              onPressed: () {
                showModalBottomSheet<void>(
                  backgroundColor: Color.fromARGB(187, 241, 241, 245),
                  context: context,
                  builder: (BuildContext context) {
                    return _bottomSheet(
                        context,
                        _fromDateController,
                        _selectFromDate,
                        _toDateController,
                        _selectToDate,
                        _keyWordsController,
                        _setText);
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text(text1), Text(text2)],
            ),
            Center(
              child: Text(text3),
            )
          ],
        ),
      ),
    );
  }
}

Widget _bottomSheet(
    context,
    TextEditingController fromDatecontroller,
    Function selectFromDate,
    TextEditingController todatecontroller,
    Function selectToDate,
    TextEditingController keyWordsController,
    Function setText) {
  return Container(
    height: 280,
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    child: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Search posted jobs",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2e64a4),
                  )),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  child: Icon(
                    Icons.close,
                    color: Color(0xff2e64a4),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              "Select Date",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _textFields(context, fromDatecontroller, selectFromDate,
              todatecontroller, selectToDate),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              "Keywords",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff2e64a4)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: keyWordsController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'From date',
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.all(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setText(context);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff2e64a4),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff2e64a4))),
                    child: Container(
                        padding: EdgeInsets.all(6),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Search",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 252, 249, 249),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _textFields(
  context,
  TextEditingController fromdateController,
  Function selectfromDate,
  TextEditingController todateController,
  Function selecttoDate,
) {
  return Container(
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff2e64a4)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: fromdateController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'From date',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Color(0xff2e64a4)),
                    ),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () => selectfromDate(context),
                      child: Container(
                        child: Icon(
                          Icons.calendar_today,
                          color: Color(0xff2e64a4),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff2e64a4)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: todateController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'To date',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Color(0xff2e64a4)),
                    ),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () => selecttoDate(context),
                      child: Container(
                        child: Icon(
                          Icons.calendar_today,
                          color: Color(0xff2e64a4),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
