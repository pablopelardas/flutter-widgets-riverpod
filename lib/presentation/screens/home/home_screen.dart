import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: const Text('Flutter + Material 3')),
      body: _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 10),
        ...MenuItem.getMenuItems().map((item) => _CustomListTile(item: item)),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem item;

  const _CustomListTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(item.icon, color: colors.primary),
      title: Text(
        item.title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        item.subtitle,
        style: const TextStyle(color: Colors.black54),
      ),
      trailing: Icon(Icons.chevron_right_rounded, color: colors.primary),
      onTap: () => context.push(item.link),
    );
  }
}
