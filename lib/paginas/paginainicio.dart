import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class PaginaInicio extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<PaginaInicio>{
  TapGestureRecognizer _recognizer1;
  TapGestureRecognizer _recognizer2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //------
        decoration : BoxDecoration(
          image: DecorationImage(
          image: AssetImage("images/LOGO_MARCO_TRABAJO_c_1.jpg"),
          fit: BoxFit.cover
          ),
         ),
        //----

        child: Column(
          children: <Widget>[
            Flex(direction: Axis.vertical),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Text(
              '.',
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              ".",
              style: Theme.of(context).textTheme.caption,
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  text: "",
                  children: [
                    TextSpan(
                      text: "",
                      recognizer: _recognizer1,
                      style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontWeight: FontWeight.bold ),
                      ),
                    TextSpan(text: " "),
                    TextSpan(
                      text: "",
                      recognizer: _recognizer2,
                      style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontWeight: FontWeight.bold),

                      )
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
