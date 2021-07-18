import 'package:flutter/material.dart';
import 'package:product_manager/core/auth/auth_repository.dart';
import 'package:product_manager/ui/router/router.dart';
import 'package:provider/provider.dart';

class SmallScreensNav extends StatelessWidget {
  const SmallScreensNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 5,
      currentIndex: 0,
      onTap: (index) => {
        if (index == 0)
          {Navigator.pushNamed(context, Routes.routeProducts)}
        else if (index == 2)
          {context.read<AuthRepository>().logout()}
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_rounded),
          label: 'Productos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.filter_alt_outlined),
          label: 'filtrar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Logout',
        ),
      ],
    );
  }
}
