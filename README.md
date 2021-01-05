# Data Table

## Introducción
Mostrar datos en tablas es una práctica habitual para desarrolladores de aplicaciones. La información estructurada en filas y columnas ayuda a los usuarios a entenderla e interpretarla mejor.
Flutter proporciona al desarrollador el Widget DataTable con el objetivo de simplificar esta tarea. 

## A tener en cuenta
Se recomienda la utilización de este widget cuando se tienen unas pocas filas, dado los requerimientos que tiene.

## ¿Cómo se utiliza?
- Se añade el DataTable() Widget.
- Se definen las columnas en la propiedad columns del widget con un array de DataColumn con tantos elementos como columnas
- Se define las filas en la propiedad rows del widget con un array de DataRow con tantos elementos como filas.
- En cada fila se definen las celdas en la propiedad cells del DataRow con un array de DataCells con tantos elementos como celdas tenga la fila
### Ejemplo
Como en tantas ocasiones la mejor forma de explicarlo es mediante un ejemplo.
A continuación se muestra una tabla muy básica de 2 filas y 2 columnas:

```dart
DataTable(columns: const <DataColumn>[
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
```