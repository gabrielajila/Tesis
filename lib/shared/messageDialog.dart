import 'package:flutter/material.dart';

Future<dynamic> messageDialog(
    BuildContext context, String titulo, String mensaje) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '$titulo',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                '$mensaje',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Cerrar el dialog
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
