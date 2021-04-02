import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'weight_card.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NumberPicker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Integer'),
              Tab(text: 'Decimal'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _IntegerExample(),
            WeightCard(),
          ],
        ),
      ),
    );
  }
}

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {
  int _currentHorizontalIntValue = 10;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 35),
        Text('Horizontal', style: Theme.of(context).textTheme.headline6),
        NumberPicker(
          value: _currentHorizontalIntValue,
          minValue: 0,
          maxValue: 100,
          step: 1,
          itemHeight: 50,
          itemWidth: 50,
          axis: Axis.horizontal,
          onChanged: (value) =>
              setState(() => _currentHorizontalIntValue = value),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black26),
          ),
        ),
      ],
    );
  }
  Widget _drawSlider() {
    return WeightBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return NumberPicker(
            minValue: 30,
            maxValue: 106,
            step: 1,
            value: 40,
            axis: Axis.horizontal,
            onChanged: (value) =>
                setState(() => _currentHorizontalIntValue = value),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black26),
            ),
          );
        },
      ),
    );
  }
}

class WeightBackground extends StatelessWidget {
  final Widget child;

  const WeightBackground({this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: 100.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(244, 244, 244, 1.0),
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
          child: child,
        ),
        SvgPicture.asset(
          "images/weight_arrow.svg",
          height: 10.0,
          width: 18.0,
        ),
      ],
    );
  }
}

//after box decoration and  umber picker this will come
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     IconButton(
//       icon: Icon(Icons.remove),
//       onPressed: () => setState(() {
//         final newValue = _currentHorizontalIntValue - 1;
//         _currentHorizontalIntValue = newValue.clamp(0, 100);
//       }),
//     ),
//     Text('ue: $_currentHorizontalIntValue'),
//     IconButton(
//       icon: Icon(Icons.add),
//       onPressed: () => setState(() {
//         final newValue = _currentHorizontalIntValue + 1;
//         _currentHorizontalIntValue = newValue.clamp(0, 100);
//       }),
//     ),
//   ],
// ),
