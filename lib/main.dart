import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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

class MyDataTableWidget extends StatelessWidget {
  MyDataTableWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: const <DataColumn>[
      DataColumn(label: Text('Columna 1')),
      DataColumn(label: Text('Columna 2'))
    ], rows: const <DataRow>[
      DataRow(cells: <DataCell>[
        DataCell(Text('Celda 1.1')),
        DataCell(Text('Celda 1.2'))
      ]),
      DataRow(cells: <DataCell>[
        DataCell(Text('Celda 2.1')),
        DataCell(Text('Celda 2.2'))
      ])
    ]);
  }
}
