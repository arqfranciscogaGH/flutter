import 'package:flutter/material.dart';
import 'package:ars/imprimirOrdenServicio.dart';

class Home extends StatelessWidget {
  //
  /// Example Data
  final List<Map<String, dynamic>> data = [
    {
      'title': 'Produk 1',
      'price': 10000,
      'qty': 2,
      'total_price': 20000,
    },
    {
      'title': 'Produk 2',
      'price': 20000,
      'qty': 2,
      'total_price': 40000,
    },
    {
      'title': 'Produk 3',
      'price': 12000,
      'qty': 1,
      'total_price': 12000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    int _totalImporte = 0;
     int _totalCantidad = 0;
    for (var i = 0; i < data.length; i++) {
      _totalImporte += data[i]['total_price'];
      _totalCantidad=i;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Thermal Printer')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (c, i) {
                return ListTile(
                  title: Text(data[i]['title']),
                  subtitle: Text('precio ${data[i]['price']} x ${data[i]['qty']}'),
                  trailing: Text('cantidad ${data[i]['total_price']}'),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Total :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Número $_totalCantidad :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Importe $_totalImporte :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                    
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text('Imprimir'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => imprimirOrdenServicio(data)));
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
