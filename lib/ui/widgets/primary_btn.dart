import 'package:flutter/material.dart';
import 'package:suitmedia_test/core/config/ui_helper.dart';
import '../../core/config/styles.dart';

class PrimaryBtn extends StatelessWidget {
  final String title;
  final String type;
  final void Function()? onTap;
  final IconData? icon;

  const PrimaryBtn({
    Key? key,
    required this.title,
    required this.type,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget btn = (type == 'elevicon')
        ? ElevatedButton.icon(
            icon: Icon(icon, color: lightColor),
            onPressed: onTap,
            style: Styles.elevBtnStyle,
            label: Text(title))
        : (type == 'outline')
            ? OutlinedButton(
                onPressed: onTap,
                style: Styles.outlineBtnStyle,
                child: Text(title))
            : (type == 'outlineicon')
                ? OutlinedButton.icon(
                    icon: Icon(icon, color: primaryColor),
                    onPressed: onTap,
                    style: Styles.outlineBtnStyle,
                    label: Text(title))
                : ElevatedButton(
                    style: Styles.elevBtnStyle,
                    onPressed: onTap,
                    child: Text(title));
    return btn;
  }
}

// by rafiknurf