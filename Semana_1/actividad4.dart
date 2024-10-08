
void main() {
  // Crear una instancia para gestionar las calificaciones
  GestionCalificaciones gestion = GestionCalificaciones();

  // Añadir estudiantes con sus respectivas calificaciones
  gestion.agregarEstudiante(Estudiante(
    nombre: 'Rommel Morocho',
    calificaciones: {'Matemáticas': 8.0, 'Historia': 7.5, 'Ciencias': 9.0},
  ));
  gestion.agregarEstudiante(Estudiante(
    nombre: 'Carolina Ortega',
    calificaciones: {'Matemáticas': 9.5, 'Historia': 8.0, 'Ciencias': 8.5},
  ));
  gestion.agregarEstudiante(Estudiante(
    nombre: 'Ricardo Ramírez',
    calificaciones: {'Matemáticas': 6.0, 'Historia': 7.0, 'Ciencias': 6.5},
  ));

  // Determinar la calificación más alta y más baja en Matemáticas
  print('\nCalificaciones más alta y más baja en Matemáticas:');
  gestion.calificacionAltaYBajaPorAsignatura('Matemáticas');

  // Mostrar estudiantes con un promedio superior a 80
  print('\nEstudiantes con promedio superior a 80:');
  gestion.estudiantesConPromedioSuperiorA(8.0);

  // Ordenar estudiantes por promedio de forma ascendente
  print('\nEstudiantes ordenados por promedio ascendente:');
  gestion.ordenarEstudiantesPorPromedio(ascendente: true);

  // Ordenar estudiantes por promedio de forma descendente
  print('\nEstudiantes ordenados por promedio descendente:');
  gestion.ordenarEstudiantesPorPromedio(ascendente: false);
}

// Clase estudiante 
class Estudiante {
  String nombre;
  Map<String, double> calificaciones;

  Estudiante({required this.nombre, required this.calificaciones});

  // Método para calcular el promedio de calificaciones del estudiante
  double calcularPromedio() {
    double suma = calificaciones.values.reduce((a, b) => a + b);
    return suma / calificaciones.length;
  }

  // Método para mostrar la información del estudiante y sus calificaciones
  @override
  String toString() {
    return 'Estudiante: $nombre, Promedio: ${calcularPromedio().toStringAsFixed(2)}';
  }
}

// Clase para Operaciones 
class GestionCalificaciones {
  List<Estudiante> estudiantes = [];

  // Función para añadir un nuevo estudiante
  void agregarEstudiante(Estudiante estudiante) {
    estudiantes.add(estudiante);
    print('Estudiante agregado: ${estudiante.nombre}');
  }

  // Función para determinar la calificación más alta y más baja de una asignatura
  void calificacionAltaYBajaPorAsignatura(String asignatura) {
    double? calificacionMasAlta;
    double? calificacionMasBaja;
    String? estudianteAlta;
    String? estudianteBaja;

    for (var estudiante in estudiantes) {
      if (estudiante.calificaciones.containsKey(asignatura)) {
        double calificacion = estudiante.calificaciones[asignatura]!;
        if (calificacionMasAlta == null || calificacion > calificacionMasAlta) {
          calificacionMasAlta = calificacion;
          estudianteAlta = estudiante.nombre;
        }
        if (calificacionMasBaja == null || calificacion < calificacionMasBaja) {
          calificacionMasBaja = calificacion;
          estudianteBaja = estudiante.nombre;
        }
      }
    }

    if (calificacionMasAlta != null && calificacionMasBaja != null) {
      print('Asignatura: $asignatura');
      print('Calificación más alta: $calificacionMasAlta (Estudiante: $estudianteAlta)');
      print('Calificación más baja: $calificacionMasBaja (Estudiante: $estudianteBaja)');
    } else {
      print('No se encontraron calificaciones para la asignatura: $asignatura');
    }
  }

  // Función para mostrar los estudiantes con un promedio superior a un valor dado
  void estudiantesConPromedioSuperiorA(double valor) {
    print('Estudiantes con promedio superior a $valor:');
    for (var estudiante in estudiantes) {
      if (estudiante.calcularPromedio() > valor) {
        print(estudiante);
      }
    }
  }

  // Función para ordenar los estudiantes por su promedio en forma ascendente o descendente
  void ordenarEstudiantesPorPromedio({bool ascendente = true}) {
    estudiantes.sort((a, b) => a.calcularPromedio().compareTo(b.calcularPromedio()));
    if (!ascendente) {
      estudiantes = estudiantes.reversed.toList();
    }
    print('Estudiantes ordenados por promedio (${ascendente ? 'Ascendente' : 'Descendente'}):');
    estudiantes.forEach((estudiante) => print(estudiante));
  }
}
