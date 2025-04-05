# 📦 Inventario Informático - App Flutter

Aplicación multiplataforma desarrollada en **Flutter** para gestionar el inventario de equipos informáticos dentro de una empresa. Permite registrar equipos, asignarlos a usuarios, gestionar su mantenimiento, registrar incidencias y hacer seguimiento de su ubicación.

---

## 🛠 Funcionalidades

- 📋 Registro de nuevos equipos con:
  - Nombre del equipo
  - Usuario asignado
  - Ubicación
  - Estado del equipo
  - Historial de mantenimiento
  - Incidencias
- 📄 Listado de equipos registrados
- ✏️ Edición y eliminación de equipos (en desarrollo)
- 🔍 Seguimiento del material informático asignado a cada usuario
- 🧭 Seguimiento de ubicación de los equipos
- 💾 Almacenamiento local con **SQLite**
- 📱 Soporte multiplataforma: Android, iOS, Web y Escritorio

---

## 🧱 Tecnologías utilizadas

- [Flutter](https://flutter.dev) - Framework UI
- [Dart](https://dart.dev) - Lenguaje principal
- [sqflite](https://pub.dev/packages/sqflite) - Plugin de base de datos SQLite para Flutter
- [path_provider](https://pub.dev/packages/path_provider) - Acceso al sistema de archivos

---

## 🚀 Estructura del Proyecto

```bash
lib/
├── main.dart                # Punto de entrada de la app
├── database_helper.dart     # Helper de SQLite (CRUD)
├── equipo_form.dart         # Formulario para añadir nuevos equipos
├── equipos_list.dart        # Listado de equipos registrados
├── home_page.dart           # Pantalla principal (navegación entre vistas)
└── widgets/                 # (opcional) Widgets personalizados y reutilizables



## 🧪 Cómo ejecutar la app

Clona este repositorio:

```bash
git clone https://github.com/tuusuario/inventario_flutter.git
cd inventario_flutter
```

Instala las dependencias:

```bash
flutter pub get
```

Ejecuta la app:

```bash
flutter run
```

## 🎯 Roadmap

- [x] Registro básico de equipos
- [x] Listado de equipos
- [ ] Edición de registros
- [ ] Eliminación de registros
- [ ] Filtros y búsqueda avanzada
- [ ] Exportación de datos (CSV o PDF)
- [ ] Backup y restauración de base de datos
- [ ] Historial detallado por equipo

## ✍️ Autor

**[Aday Glz]**  
_Técnico de IT — desarrollando soluciones para facilitar el día a día del departamento técnico y mejorar la gestión del sistema informático._
