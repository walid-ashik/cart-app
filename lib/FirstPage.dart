import 'package:cart_app/main.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController _headerKeyController = TextEditingController();
  TextEditingController _headerValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "URL",
                      hintText: "including https://"),
                  controller: controller,
                )),
            SizedBox(
              height: 8,
            ),
            Align(
                alignment: Alignment.center,
                child: TextField(
                  controller: _headerKeyController,
                  decoration: InputDecoration(
                      labelText: "Header Key", hintText: "e.g. Authorization"),
                )),
            SizedBox(
              height: 8,
            ),
            Align(
                alignment: Alignment.center,
                child: TextField(
                  controller: _headerValueController,
                  decoration: InputDecoration(
                      labelText: "Header Value",
                      hintText: "e.g. token-token"),
                )),
            SizedBox(
              height: 38,
            ),
            InkWell(
              onTap: () {

                if(controller.text.isEmpty) return;

                Map<String, String> headers = Map();
                headers[_headerKeyController.text] = _headerValueController.text;

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyHomePage(url: controller.text, headers: headers,)));
              },
              child: Container(
                  height: 50,
                  color: Colors.blue,
                  child: Center(child: Text('NEXT'))),
            )
          ],
        ),
      )),
    );
  }
}
