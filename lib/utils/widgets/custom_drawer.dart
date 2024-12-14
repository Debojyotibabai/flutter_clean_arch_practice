import 'package:clean_architecture_rivaan_ranawat/config/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final List<Map<String, dynamic>> drawerMenu = [
    {
      "title": "Dashboard",
      "icon": Icons.dashboard,
      "route": Routes.dashboard,
    },
    {
      "title": "Edit Profile",
      "icon": Icons.face,
      "route": Routes.editProfile,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[100],
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            child: ListView.builder(
              itemCount: drawerMenu.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => context.goNamed(drawerMenu[index]["route"]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            drawerMenu[index]["icon"],
                            color: Colors.red[900],
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            drawerMenu[index]["title"],
                            style: const TextStyle(
                              fontSize: 21,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                  ],
                );
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
