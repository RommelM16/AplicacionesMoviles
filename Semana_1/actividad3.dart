
void main() {
  // Crear inventario
  Inventario inventario = Inventario();

  // Agregar productos al inventario
  inventario.nuevoProducto(Producto(nombre: 'Laptop LENOVO IDEAPAD 5', precio: 1100.00, cantidad: 5, categoria: 'Computadores'));
  inventario.nuevoProducto(Producto(nombre: 'Winndows 11 PRO', precio: 40.00, cantidad: 30, categoria: 'Software'));
  inventario.nuevoProducto(Producto(nombre: 'Auriculares', precio: 20.00, cantidad: 20, categoria: 'Accesorios'));
  inventario.nuevoProducto(Producto(nombre: 'Monitor HP 14', precio: 350.00, cantidad: 8, categoria: 'Video'));
  inventario.nuevoProducto(Producto(nombre: 'Laptop ASUS TUF 1050', precio: 1500.00, cantidad: 3, categoria: 'Computadores'));
  inventario.nuevoProducto(Producto(nombre: 'Antivisrus ESET', precio: 25.00, cantidad: 15, categoria: 'Software'));
  inventario.nuevoProducto(Producto(nombre: 'Teclado Genius', precio: 15.00, cantidad: 20, categoria: 'Accesorios'));
  inventario.nuevoProducto(Producto(nombre: 'Monitor DELL 19', precio: 400.00, cantidad: 12, categoria: 'Video'));
  inventario.nuevoProducto(Producto(nombre: 'Laptop HP INVICTUS', precio: 1650.00, cantidad: 2, categoria: 'Computadores'));
  inventario.nuevoProducto(Producto(nombre: 'AutoCAD 2024', precio: 80.00, cantidad: 8, categoria: 'Software'));
  inventario.nuevoProducto(Producto(nombre: 'Mouse inalambrico', precio: 8.00, cantidad: 25, categoria: 'Accesorios'));
  inventario.nuevoProducto(Producto(nombre: 'Proyector', precio: 800.00, cantidad: 5, categoria: 'Video'));

  // Buscar productos por nombre
  print('\nBuscar por nombre: "Proyector"');
  inventario.buscarProductoPorNombre('Proyector');

  // Buscar productos por categoría
  print('\nBuscar por categoría: "Computadores"');
  inventario.buscarProductoPorCategoria('Computadores');

  // Actualizar la cantidad en stock de un producto
  print('\nActualizar la cantidad de "Auriculares" a 25');
  inventario.actualizarCantidad('Auriculares', 25);

  // Calcular el valor total del inventario
  print('\nValor total del inventario:');
  inventario.calcularValorTotalInventario();

  // Mostrar todos los productos de una categoría específica
  print('\nMostrar productos en la categoría "Video"');
  inventario.mostrarProductosPorCategoria('Video');
}

// Clase definición Producto
class Producto {
  String nombre;
  double precio;
  int cantidad;
  String categoria;

  Producto({
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.categoria,
  });

  // Método mostrar información del producto
  @override
  String toString() {
    return 'Nombre: $nombre, Precio: \$${precio.toStringAsFixed(2)}, Cantidad: $cantidad, Categoría: $categoria';
  }
}

// Clase Inventario
class Inventario {
  List<Producto> productos = [];

  // Función agregar un nuevo producto al inventario
  void nuevoProducto(Producto producto) {
    productos.add(producto);
    print('Producto agregado: ${producto.nombre}');
  }

  // Función buscar un producto por nombre
  void buscarProductoPorNombre(String nombre) {
    List<Producto> resultados = productos.where((producto) => producto.nombre.toLowerCase() == nombre.toLowerCase()).toList();
    if (resultados.isEmpty) {
      print('No se encontraron productos con el nombre: $nombre');
    } else {
      print('Productos encontrados:');
      resultados.forEach((producto) => print(producto));
    }
  }

  // Función buscar productos por categoría
  void buscarProductoPorCategoria(String categoria) {
    List<Producto> resultados = productos.where((producto) => producto.categoria.toLowerCase() == categoria.toLowerCase()).toList();
    if (resultados.isEmpty) {
      print('No se encontraron productos en la categoría: $categoria');
    } else {
      print('Productos en la categoría "$categoria":');
      resultados.forEach((producto) => print(producto));
    }
  }

  // Función actualizar stock de un producto
  void actualizarCantidad(String nombre, int nuevaCantidad) {
    for (var producto in productos) {
      if (producto.nombre.toLowerCase() == nombre.toLowerCase()) {
        producto.cantidad = nuevaCantidad;
        print('La cantidad del producto "${producto.nombre}" ha sido actualizada a $nuevaCantidad.');
        return;
      }
    }
    print('No se encontró el producto con nombre: $nombre');
  }

  // Función calcular el valor total del inventario
  void calcularValorTotalInventario() {
    double valorTotal = 0;
    for (var producto in productos) {
      valorTotal += producto.precio * producto.cantidad;
    }
    print('El valor total del inventario es: \$${valorTotal.toStringAsFixed(2)}');
  }

  // Función mostrar productos por categoría 
  void mostrarProductosPorCategoria(String categoria) {
    List<Producto> productosCategoria = productos.where((producto) => producto.categoria.toLowerCase() == categoria.toLowerCase()).toList();
    if (productosCategoria.isEmpty) {
      print('No hay productos en la categoría: $categoria');
    } else {
      print('Productos en la categoría "$categoria":');
      productosCategoria.forEach((producto) => print(producto));
    }
  }
}
