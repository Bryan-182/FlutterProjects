import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double weight = 100;
  bool bloqueado = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SliderPage'),
        ),
        body: Column(
          children: <Widget>[
            _createSlider(),
            createCheckBox(),
            createSwitch(),
            createImage()
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
        activeColor: Colors.red,
        label: 'Tamaño',
        min: 10,
        max: 500,
        value: weight,
        onChanged: (!bloqueado)
            ? (value) {
                setState(() {
                  weight = value;
                });
              }
            : null);
  }

  Widget createCheckBox() {
    return CheckboxListTile(
      title: Text('Bloquear'),
      value: bloqueado,
      onChanged: (value) {
        setState(() {
          bloqueado = value;
        });
      },
    );
  }

  Widget createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear'),
      value: bloqueado,
      onChanged: (value) {
        setState(() {
          bloqueado = value;
        });
      },
    );
  }

  Widget createImage() {
    return Image(
      image: NetworkImage(
        'https://image.freepik.com/vector-gratis/avatar-personaje-empresario-aislado_24877-60111.jpg',
      ),
      width: weight,
    );
  }
}
