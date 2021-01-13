import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Driver {
  String name;
  String team;
  int points;

  Driver({this.name, this.team, this.points});
}

var drivers = <Driver>[
  Driver(name: "Lewis Hamilton", team: "Mercedes", points: 347),
  Driver(name: "Valteri Bottas", team: "Mercedes", points: 223),
  Driver(name: "Max Verstappen", team: "Red Bull Racing", points: 214),
  Driver(name: "Sergio Perez", team: "Racing Points", points: 125),
  Driver(name: "Daniel Ricciardo", team: "Renault", points: 119),
  Driver(name: "Carlos Sainz", team: "McLaren", points: 105),
  Driver(name: "Alexander Albon", team: "Red Bull Racing", points: 105),
  Driver(name: "Charles Leclerc", team: "Ferrari", points: 98),
  Driver(name: "Lando Norris", team: "McLaren", points: 97),
  Driver(name: "Pierre Gasly", team: "AlphaTauri", points: 75)
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Table Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("My Data Table")),
        body: MyDataTableWidget(),
      ),
    );
  }
}

class MyDataTableWidget extends StatefulWidget {
  @override
  MyDataTableWidgetState createState() {
    return new MyDataTableWidgetState();
  }
}

class MyDataTableWidgetState extends State<MyDataTableWidget> {
  List<int> selectedIndex = []; //List of selected rows
  int sortColumnIndex = null; // To not sort by column at start app
  bool sortAscending = true;
  bool selectedAll = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          SizedBox(height: 10),

          // ======= Example Table 1 ==========

          /*Text("Tabla 1:"),
          DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text('Columna 1')),
              DataColumn(label: Text('Columna 2'))
            ],
            rows: const <DataRow>[
              DataRow(cells: <DataCell>[
                DataCell(Text('Celda 1.1')),
                DataCell(Text('Celda 1.2'))
              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text('Celda 2.1')),
                DataCell(Text('Celda 2.2'))
              ])
            ],
          ),*/
          Text("Tabla 2:"),
          SizedBox(height: 10),
          DataTable(
              sortColumnIndex: sortColumnIndex,
              sortAscending: sortAscending,
              columns: <DataColumn>[
                DataColumn(
                    label: Text("Name"),
                    numeric: false,
                    onSort: (i, b) {
                      setState(() {
                        sortAscending == true
                            ? drivers.sort((a, b) => a.name.compareTo(b.name))
                            : drivers.sort((a, b) => b.name.compareTo(a.name));
                        sortAscending = !sortAscending;
                        sortColumnIndex = 0;
                        selectedIndex.clear();
                      });
                    },
                    tooltip: "To display driver's name"),
                DataColumn(
                    label: Text("Team"),
                    numeric: false,
                    onSort: (i, b) {
                      setState(() {
                        sortAscending == true
                            ? drivers.sort((a, b) => a.team.compareTo(b.team))
                            : drivers.sort((a, b) => b.team.compareTo(a.team));
                        sortAscending = !sortAscending;
                        sortColumnIndex = 1;
                        selectedIndex.clear();
                      });
                    },
                    tooltip: "To display driver's team"),
                DataColumn(
                    label: Text("Points"),
                    numeric: true,
                    onSort: (i, b) {
                      setState(() {
                        sortAscending == true
                            ? drivers
                                .sort((a, b) => a.points.compareTo(b.points))
                            : drivers
                                .sort((a, b) => b.points.compareTo(a.points));
                        sortAscending = !sortAscending;
                        sortColumnIndex = 2;
                        selectedIndex.clear();
                      });
                    },
                    tooltip: "To display driver's points")
              ],
              rows: drivers
                  .map((e) => DataRow(
                          selected:
                              (selectedIndex.contains(drivers.indexOf(e))),
                          onSelectChanged: (a) {
                            setState(() {
                              if (selectedIndex.contains(drivers.indexOf(e))) {
                                selectedIndex.remove(drivers.indexOf(e));
                              } else {
                                selectedIndex.add(drivers.indexOf(e));
                              }
                            });
                          },
                          cells: [
                            DataCell(Text(e.name),
                                showEditIcon: false, placeholder: false),
                            DataCell(
                              Text(e.team),
                              showEditIcon: false,
                              placeholder: false,
                            ),
                            DataCell(Text(e.points.toString()),
                                showEditIcon: true, placeholder: true)
                          ]))
                  .toList())
        ]));
  }
}
