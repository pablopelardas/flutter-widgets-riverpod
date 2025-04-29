import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {
  static final String name = 'theme';
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorList = ref.watch(colorListProvider);
    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (_, index) {
        return _ColorItem(index);
      },
    );
  }
}

class _ColorItem extends ConsumerWidget {
  final int index;
  const _ColorItem(this.index);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorList = ref.watch(colorListProvider);
    return RadioListTile(
      value: index,
      groupValue: ref.watch(themeNotifierProvider).selectedColor,
      onChanged: (value) {
        ref.read(themeNotifierProvider.notifier).setColor(value!);
      },
      title: Text(
        'Color $index',
        style: TextStyle(color: colorList[index], fontWeight: FontWeight.bold),
      ),
      subtitle: Text('${colorList[index].toARGB32()}'),
      secondary: CircleAvatar(backgroundColor: colorList[index]),
      activeColor: colorList[index],
      selected: ref.watch(themeNotifierProvider).selectedColor == index,
    );
  }
}
