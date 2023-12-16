import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int as = 34;

  late int firstnumber;
  late int secondnumber;
  String texttodisplay = "";
  late String result;
  late String signoperator;
  void btnclicked(String btvalue) {
    if (btvalue == "C") {
      texttodisplay = "";
      firstnumber = 0;
      secondnumber = 0;
      result = "";
    } else if (btvalue == "+" ||
        btvalue == "-" ||
        btvalue == "x" ||
        btvalue == "/") {
      firstnumber = int.parse(texttodisplay);

      signoperator = btvalue;
      result = "";
    } else if (btvalue == "=") {
      secondnumber = int.parse(texttodisplay);
      if (signoperator == "+") {
        result = (firstnumber + secondnumber).toString();
      }
      if (signoperator == "-") {
        result = (firstnumber - secondnumber).toString();
      }
      if (signoperator == "x") {
        result = (firstnumber * secondnumber).toString();
      }
      if (signoperator == "/") {
        result = (firstnumber / secondnumber).toString();
      }
    } else {
      result = (texttodisplay + btvalue).toString();
    }

    setState(() {
      texttodisplay = result;
    });
  }

  Widget custombutton(String btvalue) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnclicked(btvalue),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(25.0),
        ),
        child: Text(btvalue, style: const TextStyle(fontSize: 40)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Align(
        alignment: Alignment.center,
        child: Text(
          'Calculator App',
          style: TextStyle(fontSize: 30),
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: _getMargin(context)),
              padding: const EdgeInsets.only(top: 50, left: 10),
              width: 550,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              child: Text(
                texttodisplay,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Row(
              children: [
                custombutton("7"),
                custombutton("8"),
                custombutton("9"),
                custombutton("+"),
              ],
            ),
            Row(
              children: [
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("x"),
              ],
            ),
            Row(
              children: [
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("/"),
              ],
            ),
            Row(
              children: [
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("-"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double _getMargin(BuildContext context) {
    // Determine the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Define the margin values for mobile and tablet devices
    double mobileMargin = 50;
    double tabletMargin = 400;

    // Check if the screen width is greater than or equal to 600
    if (screenWidth >= 600) {
      // Return the tablet margin value
      return tabletMargin;
    } else {
      // Return the mobile margin value
      return mobileMargin;
    }
  }
}
