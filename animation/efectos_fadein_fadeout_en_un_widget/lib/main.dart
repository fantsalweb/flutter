import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Opacity Demo';
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

// El trabajo de StatefulWidget es tomar algunos datos y crear una clase State.
// En este caso, nuestro Widget toma un título y crea un _MyHomePageState.
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// La clase State es responsable de dos cosas: mantener algunos datos que puedes
// actualizar y construir la UI usando esa información.
class _MyHomePageState extends State<MyHomePage> {
  // Si el recuadro verde debe ser visible o invisible.
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          // Si el Widget debe ser visible, anime a 1.0 (completamente visible). Si
          // el Widget debe estar oculto, anime a 0.0 (invisible)
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          // El cuadro verde debe ser el hijo de AnimatedOpacity
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Asegúrate de llamar a setState. Esto le dice a Flutter que reconstruya el 
          // UI con los cambios!
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.flip),
      ), // Está coma final hace que el auto-formateo sea más agradable para los métodos de construcción.
    );
  }
}