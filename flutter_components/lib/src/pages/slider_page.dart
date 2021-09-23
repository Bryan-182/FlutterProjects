import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100;
  bool _lockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(
              child: _createImage(),
            )
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño imagen',
      onChanged: (_lockCheck)
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
      value: _sliderValue,
      min: 10.0,
      max: 500.0,
    );
  }

  Widget _createCheckBox() {
    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _lockCheck,
        onChanged: (value) {
          setState(() {
            _lockCheck = value;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _lockCheck,
        onChanged: (value) {
          setState(() {
            _lockCheck = value;
          });
        });
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://cdn.freebiesupply.com/logos/large/2x/spider-man-logo-png-transparent.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }
}
