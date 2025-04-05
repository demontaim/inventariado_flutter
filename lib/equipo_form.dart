import 'package:flutter/material.dart';
import 'database_helper.dart'; // Importamos el helper de base de datos

class EquipoForm extends StatelessWidget {
  final nombreController = TextEditingController();
  final usuarioController = TextEditingController();
  final ubicacionController = TextEditingController();
  final estadoController = TextEditingController();

  EquipoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nuevo Equipo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre del equipo'),
            ),
            TextField(
              controller: usuarioController,
              decoration: InputDecoration(labelText: 'Usuario Asignado'),
            ),
            TextField(
              controller: ubicacionController,
              decoration: InputDecoration(labelText: 'Ubicación'),
            ),
            TextField(
              controller: estadoController,
              decoration: InputDecoration(labelText: 'Estado'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Verificamos que no haya campos vacíos
                if (nombreController.text.isEmpty ||
                    usuarioController.text.isEmpty ||
                    ubicacionController.text.isEmpty ||
                    estadoController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Por favor, rellena todos los campos.'),
                    ),
                  );
                  return;
                }

                // Creamos un mapa con los valores de los campos
                final equipo = {
                  'nombre': nombreController.text,
                  'usuario_asignado': usuarioController.text,
                  'ubicacion': ubicacionController.text,
                  'estado': estadoController.text,
                  'historial_mantenimiento': '',
                  'incidencias': '',
                };

                // Intentamos insertar el equipo en la base de datos
                await DatabaseHelper.instance.insertEquipo(equipo);

                // Mostramos un mensaje de éxito
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Equipo guardado correctamente.')),
                );

                // Volvemos a la pantalla anterior (lista de equipos)
                Navigator.pop(context);
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
