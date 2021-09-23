import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String name = '';
  String email = '';
  String password = '';
  String date = '';

  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('InputPage'),
        ),
        body: ListView(
          children: <Widget>[
            nameField(),
            Divider(
              height: 50,
            ),
            passwordField(),
            Divider(
              height: 50,
            ),
            emailField(),
            Divider(
              height: 50,
            ),
            inputDate(context)
          ],
        ),
      ),
    );
  }

  Widget nameField() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('Cantidad de letras ${name.length}'),
          hintText: 'Nombre',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.verified_user),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          name = value;
        });
      },
    );
  }

  Widget passwordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
    );
  }

  Widget emailField() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text('Cantidad de letras ${name.length}'),
          hintText: 'Nombre',
          labelText: 'Nombre',
          helperText: 'Solo es el nombre',
          suffixIcon: Icon(Icons.verified_user),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          name = value;
        });
      },
    );
  }

  Widget inputDate(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: 'Fecha',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar)),
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        selectDate(context);
      },
    );
  }

  selectDate(BuildContext context) async {
    DateTime picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2022),
    );

    if (picker != null) {
      setState(() {
        date = picker.toString();
        _inputFieldDateController.text = date;
      });
    }
  }
}
