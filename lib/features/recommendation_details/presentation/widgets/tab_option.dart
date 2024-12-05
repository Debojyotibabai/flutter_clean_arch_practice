import 'package:flutter/material.dart';

class TabOption extends StatelessWidget {
  const TabOption({
    super.key,
    required this.title,
    required this.selectedTab,
    required this.onTap,
  });

  final String title;
  final bool selectedTab;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: selectedTab
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.green[900]!,
                    width: 2.5,
                  ),
                ),
              )
            : null,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
