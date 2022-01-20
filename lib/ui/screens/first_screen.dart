import 'package:flutter/material.dart';
import 'package:suitmedia_test/ui/widgets/base_alert.dart';
import '../../core/config/ui_helper.dart';
import '../screens/second_screen.dart';
import '../widgets/input_field.dart';
import '../widgets/primary_btn.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final nameController = TextEditingController();
  final polindromeController = TextEditingController();
  bool? isPolindrom = false;

  @override
  Widget build(BuildContext context) {
    _checkPolindrom(BuildContext ctx) async {
      String polindromChar = polindromeController.text;
      if (polindromChar.isNotEmpty) {
        polindromChar = polindromChar.replaceAll(' ', '');
        isPolindrom = (String.fromCharCodes(polindromChar.codeUnits.reversed) ==
            polindromChar);
      }

      await showDialog(
          context: ctx,
          builder: (BuildContext context) {
            // lighGreen / pinkAccent
            Color bgColor =
                (isPolindrom == true) ? Colors.lightGreen : Colors.pinkAccent;
            String hasil =
                (isPolindrom == true) ? "Is Palindrome!" : "Not Palindrome.";
            return BaseAlert(
              bgColor: bgColor,
              title: "Check Hasil",
              msg: hasil,
              onTap: () => Navigator.pop(ctx),
            );
          });
    }

    _checkNama(BuildContext ctx) async {
      await showDialog(
          context: ctx,
          builder: (BuildContext context) {
            return BaseAlert(
              bgColor: Colors.yellow,
              title: "Warning",
              msg: "Input nama masih kosong!",
              onTap: () => Navigator.pop(context),
            );
          });
    }

    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.png'))),
      ),
      SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                          image:
                              AssetImage('assets/images/btn_add_photo.png')))),
              verticalSpaceLarge,
              InputField(placeholder: 'Name', controller: nameController),
              verticalSpaceSmall,
              InputField(
                  placeholder: 'Polindrome', controller: polindromeController),
              verticalSpaceLarge,
              SizedBox(
                  width: double.infinity,
                  child: PrimaryBtn(
                      title: 'Check',
                      type: 'elev',
                      onTap: () => _checkPolindrom(context))),
              verticalSpaceSmall,
              SizedBox(
                  width: double.infinity,
                  child: PrimaryBtn(
                      title: 'Next',
                      type: 'elevicon',
                      icon: Icons.navigate_next,
                      onTap: () {
                        if (nameController.text.isNotEmpty) {
                          String name = nameController.text;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SecondScreen(inputName: name)));
                        } else {
                          _checkNama(context);
                        }
                      }))
            ]),
      ))
    ]));
  }
}

// by rafiknurf