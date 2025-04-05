import 'package:flutter/material.dart';
import 'database_helper.dart'; // Importamos el helper de base de datos
import 'equipo_form.dart'; // Importamos el formulario para agregar equipos
import 'equipos_list.dart'; // Importamos la pantalla que muestra la lista de equipos

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventario IT',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EquiposList(), // Pantalla principal de la aplicación
      routes: {
        '/nuevo':
            (context) => EquipoForm(), // Ruta para agregar un nuevo equipo
      },
    );
  }
}
