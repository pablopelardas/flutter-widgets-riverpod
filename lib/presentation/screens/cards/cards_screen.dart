import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0.0'},
  {'elevation': 1.0, 'label': 'Elevation 1.0'},
  {'elevation': 2.0, 'label': 'Elevation 2.0'},
  {'elevation': 3.0, 'label': 'Elevation 3.0'},
  {'elevation': 4.0, 'label': 'Elevation 4.0'},
  {'elevation': 5.0, 'label': 'Elevation 5.0'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
            (card) =>
                _CardType1(label: card['label'], elevation: card['elevation']),
          ),
          ...cards.map(
            (card) =>
                _CardType2(label: card['label'], elevation: card['elevation']),
          ),
          ...cards.map(
            (card) =>
                _CardType3(label: card['label'], elevation: card['elevation']),
          ),
          ...cards.map(
            (card) =>
                _CardType4(label: card['label'], elevation: card['elevation']),
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({this.label = 'Elevation 0.0', this.elevation = 0.0});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {
                  // Handle the button press
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(label, style: const TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({this.label = 'Elevation 0.0', this.elevation = 0.0});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.blue, width: 2),
      ),
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {
                  // Handle the button press
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(label, style: const TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({this.label = 'Elevation 0.0', this.elevation = 0.0});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceContainerHighest,
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {
                  // Handle the button press
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(label, style: const TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({this.label = 'Elevation 0.0', this.elevation = 0.0});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/250',
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.more_vert_outlined),
                onPressed: () {
                  // Handle the button press
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
