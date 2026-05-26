import 'package:flutter/material.dart';

void main() {
  runApp(const VoleyApp());
}

class VoleyApp extends StatelessWidget {
  const VoleyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guía de Voleibol',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const VoleyHomePage(),
      },
    );
  }
}

class VoleyHomePage extends StatefulWidget {
  const VoleyHomePage({super.key});

  @override
  State<VoleyHomePage> createState() => _VoleyHomePageState();
}

class _VoleyHomePageState extends State<VoleyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const PosicionesPage(),
    const RotacionPage(),
    const SaquePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aprende Voleibol'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Posiciones',
          ),
          NavigationDestination(
            icon: Icon(Icons.rotate_right_outlined),
            selectedIcon: Icon(Icons.rotate_right),
            label: 'Rotación',
          ),
          NavigationDestination(
            icon: Icon(Icons.sports_volleyball_outlined),
            selectedIcon: Icon(Icons.sports_volleyball),
            label: 'Saque',
          ),
        ],
      ),
    );
  }
}

class PosicionesPage extends StatelessWidget {
  const PosicionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          'Posiciones en la Cancha',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'En voleibol, hay 6 jugadores en la cancha por equipo. La cancha se divide en dos zonas: la delantera (cerca de la red) y la zaguera (atrás). Las posiciones se numeran del 1 al 6 empezando por la zona de saque y en sentido contrario a las agujas del reloj.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 24),
        _buildPositionCard(
          context,
          'Posición 1: Zaguero Derecho',
          'Es el jugador que realiza el saque. Se ubica en la parte trasera derecha de la cancha. También defiende los ataques en esa zona.',
        ),
        _buildPositionCard(
          context,
          'Posición 2: Delantero Derecho',
          'Ubicado en la red a la derecha. Generalmente es el Opuesto o el Armador en algunas formaciones. Encargado de bloquear y atacar por la derecha.',
        ),
        _buildPositionCard(
          context,
          'Posición 3: Delantero Centro',
          'Ubicado en el medio de la red. Suele ser el Central, especializado en bloqueos rápidos y ataques cortos.',
        ),
        _buildPositionCard(
          context,
          'Posición 4: Delantero Izquierdo',
          'Ubicado en la red a la izquierda. Generalmente es el Punta-Receptor, principal atacante del equipo.',
        ),
        _buildPositionCard(
          context,
          'Posición 5: Zaguero Izquierdo',
          'Ubicado en la parte trasera izquierda. Encargado de defender y recibir los ataques del contrario. A menudo aquí defiende el Líbero.',
        ),
        _buildPositionCard(
          context,
          'Posición 6: Zaguero Centro',
          'Ubicado en el centro de la parte trasera. Defensor clave para bolas largas, zagueros y apoyos.',
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              const Text('Esquema de Posiciones (Red arriba)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _CourtPosition(number: '4', label: 'Del.\nIzq.'),
                  _CourtPosition(number: '3', label: 'Del.\nCentro'),
                  _CourtPosition(number: '2', label: 'Del.\nDer.'),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _CourtPosition(number: '5', label: 'Zag.\nIzq.'),
                  _CourtPosition(number: '6', label: 'Zag.\nCentro'),
                  _CourtPosition(number: '1', label: 'Zag.\nDer.\n(Saque)'),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPositionCard(BuildContext context, String title, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class _CourtPosition extends StatelessWidget {
  final String number;
  final String label;

  const _CourtPosition({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          child: Text(number, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        const SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class RotacionPage extends StatelessWidget {
  const RotacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          '¿Cómo se rota?',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'La rotación es un mecanismo fundamental del voleibol que asegura que todos los jugadores pasen por todas las posiciones de la cancha (excepto el Líbero, que tiene reglas especiales).',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 24),
        _buildInfoTile(
          context,
          Icons.sync,
          'Sentido de la Rotación',
          'El equipo rota en el sentido de las agujas del reloj.\nEjemplo: 1 -> 6 -> 5 -> 4 -> 3 -> 2 -> 1.',
        ),
        _buildInfoTile(
          context,
          Icons.check_circle_outline,
          '¿Cuándo se rota?',
          'Se rota ÚNICAMENTE cuando el equipo receptor gana el punto. A esto se le llama recuperar el saque o "cambio de saque". En ese momento, antes de ir a sacar, el equipo hace la rotación.',
        ),
        _buildInfoTile(
          context,
          Icons.cancel_outlined,
          '¿Cuándo NO se rota?',
          'Si el equipo que está sacando gana el punto, mantiene el saque y NO se rota. El mismo jugador en posición 1 vuelve a sacar.',
        ),
        _buildInfoTile(
          context,
          Icons.warning_amber_rounded,
          'Falta de posición',
          'Al momento del saque, cada jugador debe estar en su posición correspondiente. Si no lo están, o si el orden de saque es incorrecto, el árbitro pita "falta de posición" y el punto va para el rival.',
        ),
      ],
    );
  }

  Widget _buildInfoTile(BuildContext context, IconData icon, String title, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(description, style: const TextStyle(fontSize: 14, height: 1.4)),
        ),
      ),
    );
  }
}

class SaquePage extends StatelessWidget {
  const SaquePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          'El Saque',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'El saque (o servicio) es la acción que pone el balón en juego. Es el único momento del partido donde el jugador tiene control total sin interferencia del rival.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 24),
        _buildSaqueSection(
          context,
          '¿Quién saca?',
          'Saca el jugador que se encuentra en la Posición 1 (Zaguero Derecho). Cuando un equipo recupera el saque y hace la rotación, el jugador que estaba en Posición 2 pasa a la Posición 1 y se convierte en el encargado de sacar.',
        ),
        _buildSaqueSection(
          context,
          'Reglas del Saque',
          '• El sacador debe golpear el balón desde detrás de la línea de fondo.\n• Tiene 8 segundos para sacar tras el pitazo del árbitro.\n• El balón debe soltarse o lanzarse al aire antes de ser golpeado.\n• El balón puede tocar la red y pasar al campo contrario.\n• No puede pisar la línea de fondo al momento del salto/golpe.',
        ),
        _buildSaqueSection(
          context,
          'Tipos de Saque Comunes',
          '• Saque por Abajo: Ideal para empezar. Se golpea de abajo hacia arriba.\n• Saque Flotante: Se golpea el centro del balón de forma seca para que no gire, haciendo que su trayectoria en el aire sea inestable e impredecible.\n• Saque en Suspensión (Salto): Un saque potente parecido a un remate, donde el jugador salta y le pega con fuerza y "topspin" para que baje rápidamente.',
        ),
      ],
    );
  }

  Widget _buildSaqueSection(BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).colorScheme.primary)),
          const SizedBox(height: 12),
          Text(content, style: const TextStyle(fontSize: 16, height: 1.5)),
        ],
      ),
    );
  }
}
