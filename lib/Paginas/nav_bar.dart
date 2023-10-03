import 'package:drugenius/Paginas/Farmacocinetica.dart';
import 'package:drugenius/Paginas/configuracion.dart';
import 'package:drugenius/Paginas/list_medicamentos.dart';
import 'package:drugenius/Paginas/perfil.dart';
import 'package:drugenius/main.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Roberto Carlos Sanchez'),
            accountEmail: Text('rcsanchez96@gmail.com'),
            currentAccountPicture: CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage("https://i.ibb.co/bvgjvQs/Yo.jpg"),
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 41, 130, 172),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.unibe.edu.do/wp-content/uploads/2018/12/medicina-familiar-unibe.jpg"),
                    fit: BoxFit.fill)),
          ),
          buildMenuItem(
            text: "Inicio",
            icon: Icons.home,
            onClicked: () => selectedItem(context, 0),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Generalidades",
            icon: Icons.bloodtype,
            onClicked: () => selectedItem(context, 1),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Medicamentos",
            icon: Icons.medication_liquid_outlined,
            onClicked: () => selectedItem(context, 2),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Farmacocinética",
            icon: Icons.healing_outlined,
            onClicked: () => selectedItem(context, 3),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Videos y Podcasts",
            icon: Icons.ondemand_video_outlined,
            onClicked: () => selectedItem(context, 4),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Evaluaciones",
            icon: Icons.quiz_outlined,
            onClicked: () => selectedItem(context, 5),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Juegos",
            icon: Icons.sports_esports_outlined,
            onClicked: () => selectedItem(context, 6),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Calculadora de Dosis",
            icon: Icons.calculate_outlined,
            onClicked: () => selectedItem(context, 7),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Foro de Discusión",
            icon: Icons.forum_outlined,
            onClicked: () => selectedItem(context, 8),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Perfil",
            icon: Icons.account_circle,
            onClicked: () => selectedItem(context, 9),
          ),
          const SizedBox(height: 10),
          buildMenuItem(
            text: "Configuración",
            icon: Icons.settings,
            onClicked: () => selectedItem(context, 10),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Color.fromARGB(255, 0, 0, 0);
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const DrugeniusMenu(), // Reemplaza con la pantalla deseada
          ),
        );
        break;

      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const ListMedicamentos(), // Reemplaza con la pantalla deseada
          ),
        );
        break;

      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const ListMedicamentos(), // Reemplaza con la pantalla deseada
          ),
        );
        break;

      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Farmacocinetica(), // Reemplaza con la pantalla deseada
          ),
        );
        break;

      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Farmacocinetica(), // Reemplaza con la pantalla deseada
          ),
        );
        break;

      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Farmacocinetica(), // Reemplaza con la pantalla deseada
          ),
        );
        break;

      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Farmacocinetica(), // Reemplaza con la pantalla deseada
          ),
        );
        break;

      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Farmacocinetica(), // Reemplaza con la pantalla deseada
          ),
        );
        break;

      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Farmacocinetica(), // Reemplaza con la pantalla deseada
          ),
        );
        break;

      case 9:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Perfil(), // Reemplaza con la pantalla deseada
          ),
        );
        break;

      case 10:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Configuracion(), // Reemplaza con la pantalla deseada
          ),
        );
        break;
    }
  }
}
