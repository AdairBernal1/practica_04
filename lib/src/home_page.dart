import 'package:flutter/material.dart';
import 'package:practica_04/src/datos_recibidos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _valor = 1;
  final nomCtrl = TextEditingController();
  final data = Data(nombre: '', sexo: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: const Text('Practica 03'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nomCtrl,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: 'Ingresa el nombre',
              contentPadding: EdgeInsets.all(20),
            ),
          ),
          const SizedBox(height: 20),
          DropdownButton(
              value: _valor,
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text('Mujer'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Hombre'),
                ),
              ],
              onChanged: (int? selected) {
                _valor = selected!;
              }),
          const SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange[200], onPrimary: Colors.white),
              child: const Text('Enviar'),
              onPressed: () {
                setState(() {
                  data.nombre = nomCtrl.text;

                  if (_valor == 1) {
                    data.sexo = 'Mujer';
                  } else {
                    data.sexo = 'Hombre';
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DatosPage(data: data)));
                });
              })
        ],
      )),
    );
  }
}

class Data {
  String nombre;
  String sexo;

  Data({required this.nombre, required this.sexo});
}
