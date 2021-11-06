import 'package:flutter/material.dart';
import 'package:layout_study/widget/photo_in_row.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String fragmentText = "Fragment";

  void updateFragmentText(String txt) {
    fragmentText = txt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "New",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  photoInRow(),
                  photoInRow(),
                  photoInRow(),
                  photoInRow(),
                ],
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text("button")
            ),
            Expanded(
              child: TextBox(fragmentText: fragmentText),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FragmentBtn("Red", (String txt) {
                  setState(() {
                    updateFragmentText("Red");
                  });
                }),
                FragmentBtn("Blue", (String txt) {
                  setState(() {
                    updateFragmentText("Blue");
                  });
                }),
              ],
            ),
            SizedBox(height: 24,)
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
    required this.fragmentText,
  }) : super(key: key);

  final String fragmentText;

  @override
  Widget build(BuildContext context) {
    final Color boxColor = fragmentText == "Blue" ? Colors.blue : Colors.red;

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      color: boxColor,
      child: Center(
        child: Text(
          fragmentText + ' Fragment',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ),

    );
  }
}

class FragmentBtn extends StatelessWidget {
  final String title;
  final FragmentCallback fragmentCallback;

  FragmentBtn(this.title, this.fragmentCallback);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
            onPressed: () {
              fragmentCallback(title);
            },
            child: Text(title)
        )
    );
  }
}

typedef FragmentCallback = void Function(String txt);