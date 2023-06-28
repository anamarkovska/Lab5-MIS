import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labs/Model/termin.dart';
import 'package:nanoid/nanoid.dart';


class NovTermin extends StatefulWidget {
  final Function addTermin;

  NovTermin(this.addTermin);

  @override
  State<StatefulWidget> createState() => _NovTerminState();
}

class _NovTerminState extends State<NovTermin> {
  final _predmetController = TextEditingController();
  final _datumOdController = TextEditingController();
  final _datumDoController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  void _submitData() {
    if (_datumOdController.text.isEmpty && _datumDoController.text.isEmpty) {
      return;
    }
    var novDatumOd = DateTime.parse(_datumOdController.text);
    var novDatumDo = DateTime.parse(_datumDoController.text);
    var novPredmet = _predmetController.text;
    var novLatitude = double.parse(_latitudeController.text);
    var novLongitude = double.parse(_longitudeController.text);

    if (novPredmet.isEmpty) {
      return;
    }

    var newItem =
    Termin(id: nanoid(5), predmet: novPredmet, datumOd: novDatumOd, datumDo: novDatumDo, latitude: novLatitude, longitude: novLongitude);
    widget.addTermin(newItem);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _predmetController,
              decoration: InputDecoration(labelText: "Predmet: "),
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: _datumOdController,
              decoration: InputDecoration(labelText: "Datum Od: "),
              keyboardType: TextInputType.datetime,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: _datumDoController,
              decoration: InputDecoration(labelText: "Datum Do: "),
              keyboardType: TextInputType.datetime,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: _latitudeController,
              decoration: InputDecoration(labelText: "Latitude: "),
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: _longitudeController,
              decoration: InputDecoration(labelText: "Longitude: "),
              onSubmitted: (_) => _submitData(),
            ),
            IconButton(onPressed: () => _submitData(), icon: Icon(Icons.save))
          ],
        ));
  }
}