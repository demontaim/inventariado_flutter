import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'equipo_form.dart';

class EquiposList extends StatelessWidget {
  const EquiposList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipos Registrados'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EquipoForm()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue[50],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: Text(
                    'Menú',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              ListTile(
                title: Text('Ver Equipos'),
                onTap: () {
                  Navigator.pop(context); // Cerrar el menú
                },
              ),
              ListTile(
                title: Text('Agregar Nuevo Equipo'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EquipoForm()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper.instance.queryAllEquipos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los equipos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay equipos registrados'));
          } else {
            final equipos = snapshot.data!;
            return ListView.builder(
              itemCount: equipos.length,
              itemBuilder: (context, index) {
                final equipo = equipos[index];
                return ListTile(
                  title: Text(equipo['nombre']),
                  subtitle: Text('Usuario: ${equipo['usuario_asignado']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await DatabaseHelper.instance.deleteEquipo(equipo['id']);
                      (context as Element).reassemble();
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
