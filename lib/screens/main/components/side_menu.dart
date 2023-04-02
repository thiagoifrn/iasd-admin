import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../util/app_routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo-iasd.jpeg"),
          ),
          DrawerListTile(
            title: "Painel Principal",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              Navigator.pushReplacementNamed(context, AppRoutes.PAINEL);
            },
          ),
          DrawerListTile(
            title: "Documentos",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Navigator.pushNamed(context, '/Documents');
            },
          ),
          DrawerListTile(
            title: "Configurações",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
