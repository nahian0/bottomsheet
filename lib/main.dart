import 'package:flutter/material.dart';

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Sheet')),
        body: const BottomSheetExample(),
      ),
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(187, 204, 204, 231),
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: ElevatedButton(
          child: const Text('Bottom Sheet'),
          onPressed: () {
            showModalBottomSheet<void>(
              backgroundColor: Color.fromARGB(187, 241, 241, 245),
              context: context,
              builder: (BuildContext context) {
                return _bottomSheet(context);
              },
            );
          },
        ),
      ),
    );
  }
}

Widget _bottomSheet(context) {
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
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6)),
                            border: Border.all(color: Color(0xff2e64a4))),
                        child: Container(
                            padding: EdgeInsets.all(6),
                            child: Text(
                              "From date",
                              style: TextStyle(color: Colors.grey),
                            )),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    bottomRight: Radius.circular(6)),
                                border: Border.all(color: Color(0xff2e64a4))),
                            child: Container(
                              padding: EdgeInsets.all(2),
                              child: Icon(
                                Icons.calendar_today_outlined,
                                color: Color(0xff2e64a4),
                              ),
                            )))
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6)),
                            border: Border.all(color: Color(0xff2e64a4))),
                        child: Container(
                            padding: EdgeInsets.all(6),
                            child: Text("To date",
                                style: TextStyle(color: Colors.grey))),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(6),
                                bottomRight: Radius.circular(6)),
                            border: Border.all(color: Color(0xff2e64a4))),
                        child: Container(
                          padding: EdgeInsets.all(2),
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: Color(0xff2e64a4),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff2e64a4))),
                  child: Container(
                      padding: EdgeInsets.all(6),
                      child: Text(
                        "From date",
                        style: TextStyle(color: Colors.grey),
                      )),
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
            ],
          ),
        ],
      ),
    ),
  );
}
