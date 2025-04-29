import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, bicycle, bus }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloperMode = false;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloperMode,
          onChanged: (value) => setState(() => isDeveloperMode = value),
          title: const Text('Developer Mode'),
        ),
        ExpansionTile(
          title: const Text('Transportation'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() => selectedTransportation = value!),
              title: const Text('Car'),
              subtitle: const Text('Travel by car'),
            ),
            RadioListTile(
              value: Transportation.bicycle,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() => selectedTransportation = value!),
              title: const Text('Bicycle'),
              subtitle: const Text('Travel by bicycle'),
            ),
            RadioListTile(
              value: Transportation.bus,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() => selectedTransportation = value!),
              title: const Text('Bus'),
              subtitle: const Text('Travel by bus'),
            ),
          ],
        ),

        CheckboxListTile(
          value: wantsBreakfast,
          onChanged: (value) => setState(() => wantsBreakfast = value!),
          title: const Text('Breakfast'),
          subtitle: const Text('Do you want breakfast?'),
        ),
        CheckboxListTile(
          value: wantsLunch,
          onChanged: (value) => setState(() => wantsLunch = value!),
          title: const Text('Lunch'),
          subtitle: const Text('Do you want lunch?'),
        ),
        CheckboxListTile(
          value: wantsDinner,
          onChanged: (value) => setState(() => wantsDinner = value!),
          title: const Text('Dinner'),
          subtitle: const Text('Do you want dinner?'),
        ),
      ],
    );
  }
}
