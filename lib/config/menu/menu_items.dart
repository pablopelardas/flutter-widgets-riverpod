import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });

  static List<MenuItem> getMenuItems() {
    return [
      MenuItem(
        title: 'Botones',
        subtitle: 'Varios botones en Flutter',
        link: '/buttons',
        icon: Icons.smart_button_outlined,
      ),
      MenuItem(
        title: 'Tarjetas',
        subtitle: 'Un contenedor estilizado',
        link: '/card',
        icon: Icons.credit_card,
      ),
      MenuItem(
        title: 'Progress Indicators',
        subtitle: 'Controla el progreso de una tarea',
        link: '/progress',
        icon: Icons.refresh,
      ),
      MenuItem(
        title: 'Snackbars and Dialogs',
        subtitle: 'Mensajes breves en la parte inferior',
        link: '/snackbar',
        icon: Icons.snippet_folder,
      ),
      MenuItem(
        title: 'App Tutorial',
        subtitle: 'Guía para el usuario',
        link: '/app_tutorial',
        icon: Icons.tour,
      ),
      MenuItem(
        title: 'UI Controls',
        subtitle: 'Controles de interfaz de usuario',
        link: '/ui_controls',
        icon: Icons.control_camera,
      ),
      MenuItem(
        title: 'Animated',
        subtitle: 'Animaciones en Flutter',
        link: '/animated',
        icon: Icons.animation,
      ),
      MenuItem(
        title: 'Infinite Scroll',
        subtitle: 'Desplazamiento infinito',
        link: '/infinite_scroll',
        icon: Icons.ac_unit,
      ),
      MenuItem(
        title: 'Counter',
        subtitle: 'Contador simple',
        link: '/counter',
        icon: Icons.add_circle_outline,
      ),
      MenuItem(
        title: 'Theme Changer',
        subtitle: 'Cambia el tema de la app',
        link: '/theme',
        icon: Icons.color_lens,
      ),
    ];
  }
}
