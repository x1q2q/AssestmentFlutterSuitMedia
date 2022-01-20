import 'package:flutter/material.dart';
import 'package:suitmedia_test/core/config/ui_helper.dart';
import '../../core/config/styles.dart';

class DefAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget>? actBtn;
  const DefAppBar({Key? key, required this.title, this.actBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: primaryColor, //change your color here
      ),
      backgroundColor: Colors.white,
      elevation: 0.3,
      title: Text(title, style: Styles.titleBarStyle),
      centerTitle: true,
      actions: actBtn,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


// by rafiknurf