void main() {
  print(' ');
  print('---------------------------EJEMPLO DE COLECCIONES---------------------------');
  print(' ');
  print('---------------------------LIST---------------------------');
  // Creación de una lista de Nombres. List<String>
  List<String> Nombres = ['Rommel', 'Carolina', 'Ruth', 'Mayra', 'Raul'];

  // Imprimir la lista
  print('Lista inicial de Nombres: $Nombres');

  // Agregar nuevos Nombres. Agregamos un nuevo item con add()
  Nombres.add('Aby');
  Nombres.add('Oswaldo');
  print('Después de agregar los nombres Aby y Oswaldo: $Nombres');

  // Remover un nombre. Eliminamos con remove()
  Nombres.remove('Aby');
  print('Después de remover el nombre Aby: $Nombres');

  // Filtar nombres que empiezan con 'R'. Utilizamos la función where() para filtrar
  List<String> res = Nombres.where((nombre) => nombre.startsWith('R')).toList();
  print('Filtar nombres que empiezan con R: $res');

  print(' ');
  print('---------------------------MAP---------------------------');
  Map<String, double> calificaciones = {
    'Rommel': 9.7,
    'Carolina': 9.2,
    'Ruth': 7.8,
    'Juan': 5.6
  };

  // Imprimir el mapa.
  print('Calificaciones originales: $calificaciones');

  // Agregar un nuevo registro
  calificaciones['Aby'] = 9.5;
  print('Después de agregar Aby y calificación: $calificaciones');

  // Modificar la calificación de Carlos
  calificaciones['Carolina'] = 8.3;
  print('Después de modificar la calificación de Carolina: $calificaciones');

  // Remover a Juan. Eliminamos con remove()
  calificaciones.remove('Juan');
  print('Después de remover a Juan: $calificaciones');

  // Mostrar estudiantes con calificaciones mayores a 9
  print('Estudiantes con calificaciones mayores a 9:');
  calificaciones.forEach((nombre, calificacion) {
    if (calificacion > 9) {
      print('Nombre: $nombre - Calificación: $calificacion');
    }
  });
}
