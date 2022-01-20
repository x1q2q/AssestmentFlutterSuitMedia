import 'package:flutter/material.dart';
import '../../core/config/styles.dart';
import '../../core/config/ui_helper.dart';
import '../../ui/screens/third_screen.dart';
import '../../ui/widgets/def_app_bar.dart';
import '../../ui/widgets/primary_btn.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, this.inputName}) : super(key: key);
  final String? inputName;

  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedName = "Selected User Name";

  @override
  void initState() {
    super.initState();
  }

  void changeSelectedName(String? into) {
    setState(() {
      selectedName = into ?? selectedName;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _navigateAndDisplaySelection(BuildContext context) async {}

    return Scaffold(
      appBar: const DefAppBar(title: "Second Screen"),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child:
                            Wrap(direction: Axis.vertical, children: <Widget>[
                      const Text('Welcome', style: Styles.smallStyle),
                      Text(widget.inputName ?? '', style: Styles.bodyStyle),
                    ])),
                    verticalSpaceLarge,
                    verticalSpaceLarge,
                    Center(child: Text(selectedName, style: Styles.headStyle)),
                    verticalSpaceLarge,
                    verticalSpaceLarge,
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryBtn(
                        title: "Choose a User",
                        type: 'elevicon',
                        icon: Icons.person_add_alt,
                        onTap: () async {
                          final res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ThirdScreen()));
                          changeSelectedName(res);
                        },
                      ),
                    )
                  ]))),
    );
  }
}


// by rafiknurf