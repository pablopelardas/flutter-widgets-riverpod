import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const SideMenu({super.key, this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = -1;
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 20;
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (int index) {
        setState(() {
          navDrawerIndex = index;
        });

        context.push(MenuItem.getMenuItems()[index].link);
        if (widget.scaffoldKey != null) {
          widget.scaffoldKey!.currentState?.closeDrawer();
        }
      },
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: hasNotch ? 0 : 10,
            left: 10,
            right: 10,
            bottom: 10,
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/1002021?v=4',
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Flutter + Material 3'),
                  Text('flutter.dev'),
                ],
              ),
            ],
          ),
        ),
        ...MenuItem.getMenuItems()
            .sublist(0, 3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),

        Padding(padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider()),
        ...MenuItem.getMenuItems()
            .sublist(3, MenuItem.getMenuItems().length)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
