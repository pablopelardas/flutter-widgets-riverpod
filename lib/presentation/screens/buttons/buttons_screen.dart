import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            ElevatedButton(
              onPressed: null,
              child: const Text('Elevated Button Disabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Elevated Button Icon'),
            ),
            FilledButton(onPressed: () {}, child: Text('Filled Button')),
            FilledButton.icon(
              onPressed: () {},
              label: Text('Filled Button Icon'),
              icon: Icon(Icons.add),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Outlined Button Icon'),
            ),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Text Button Icon'),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              tooltip: 'Icon Button',
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  colors.primaryContainer,
                ),
                foregroundColor: WidgetStateProperty.all(
                  colors.onPrimaryContainer,
                ),
              ),
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              'Hola mundo',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
      ),
    );
  }
}
