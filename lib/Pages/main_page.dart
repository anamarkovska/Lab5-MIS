import 'package:flutter/material.dart';
import 'package:labs/Model/termin.dart';
import '../Widgets/nov_termin.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  final List<Termin> _termini = [
    Termin(id: 0,
        predmet: "Mobilni informaciski sistemi",
        datumOd: DateTime.parse('2023-06-22 10:00'),
        datumDo: DateTime.parse('2023-06-22 11:00')),
    Termin(id: 1,
        predmet: "Pretpriemnistvo",
        datumOd: DateTime.parse('2023-06-24 08:00'),
        datumDo: DateTime.parse('2023-06-24 08:30')),
    Termin(id: 2,
        predmet: "VVKN",
        datumOd: DateTime.parse('2023-06-25 12:00'),
        datumDo: DateTime.parse('2023-06-25 12:30')),
    Termin(id: 3,
        predmet: "UIKTP",
        datumOd: DateTime.parse('2023-06-28 13:00'),
        datumDo: DateTime.parse('2023-06-28 14:00')),
  ];

  void _addItemFunction(BuildContext ct) {
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: NovTermin(_addNewTerminToList),
              behavior: HitTestBehavior.opaque);
        });
  }

  void _addNewTerminToList(Termin termin) {
    setState(() {
      _termini.add(termin);
    });
  }

  void _deleteTermin(Object? id) {
    setState(() {
      _termini.removeWhere((element) => element.id == id);
      // _events = DataSource(_termini);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: Text("Schedules"),
          actions: <Widget>[
            IconButton(
              onPressed: () => _addItemFunction(context),
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: SingleChildScrollView (child: Center(
            child: Column(
              children: [
                Container(
                  height: 800,
                  child: _termini.isEmpty
                      ? Text("No schedules")
                      : ListView.builder(
                      itemBuilder: (ctx, index) {
                        return Card(
                            elevation: 4,
                            margin: EdgeInsets.all(10),
                            child: ListTile(
                              title: Text(_termini[index].predmet, style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text("${_termini[index].datumOd}"),
                              trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => _deleteTermin(_termini[index].id)),
                            ));
                      },
                      itemCount: _termini.length),
                ),
              ],
            )
        ),
        )
    );
  }
}