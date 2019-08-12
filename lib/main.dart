import 'package:flutter/material.dart';

import './svg_button.dart';
import './horizontal_clipper.dart';
import './vertical_clipper.dart';
import './diagonal_clipper.dart';
import './sized_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Before/After Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: HomePage(),
      );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum Mode { horizontal, vertical, diagonal }

class _HomePageState extends State<HomePage> {
  Mode mode;
  double clip = 0.5;

  @override
  void initState() {
    this.mode = Mode.horizontal;
  }

  Widget buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgButton(
            'assets/horizontal-comp.svg',
            tooltip: 'horizontal',
            color: this.mode == Mode.horizontal ? Colors.black : Colors.grey,
            onPressed: () => setState(() {
              this.mode = Mode.horizontal;
            }),
          ),
          SvgButton(
            'assets/vertical-comp.svg',
            tooltip: 'vertical',
            color: this.mode == Mode.vertical ? Colors.black : Colors.grey,
            onPressed: () => setState(() {
              this.mode = Mode.vertical;
            }),
          ),
          SvgButton(
            'assets/diagonal-comp.svg',
            tooltip: 'diagonal',
            color: this.mode == Mode.diagonal ? Colors.black : Colors.grey,
            onPressed: () => setState(() {
              this.mode = Mode.diagonal;
            }),
          ),
        ],
      );

  getClipper() {
    switch (this.mode) {
      case Mode.horizontal:
        return HorizontalClipper(clip);

      case Mode.vertical:
        return VerticalClipper(clip);

      case Mode.diagonal:
        return DiagonalClipper(clip);
    }
  }

  Widget buildOverlay() => Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child:
                SizedImage(Image.asset('assets/after.jpg'), 382.0, 555.0, 8.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ClipPath(
              clipper: this.getClipper(),
              child: SizedImage(
                  Image.asset('assets/before.jpg'), 382.0, 555.0, 8.0),
            ),
          ),
        ],
      );

  Widget buildSlider() => Slider(
        value: this.clip,
        onChanged: (factor) => setState(() {
          this.clip = factor;
        }),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              this.buildButtons(),
              this.buildOverlay(),
              this.buildSlider(),
            ],
          ),
        ),
      );
}
