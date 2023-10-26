import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: _scaffoldKey,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Latihan Notification"),
          ),
          body: Center(
            child: Builder(
              builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: showToast, child: const Text("Show Toast")),
                  ElevatedButton(
                      onPressed: showSnackBar,
                      child: const Text("Show SnackBar")),
                  ElevatedButton(
                      onPressed: () {
                        showBasicAlert(context);
                      },
                      child: const Text("Show Alert Dialog"))
                ],
              ),
            ),
          ),
        ));
  }

  void showToast() {
    setState(() {
      Fluttertoast.showToast(
          msg: "This is toast Notification",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    });
  }

  void showSnackBar() {
    setState(() {
      final snackbar = SnackBar(
        content: const Text("Hey! This is a SnackBar"),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );

      _scaffoldKey.currentState?.showSnackBar(snackbar);
    });
  }

  void showBasicAlert(BuildContext context) {
    setState(() {
      Widget okButton = TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("OK"));

      Widget cancelButton = TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("CANCEL"));

      AlertDialog alertBasic = AlertDialog(
        title: const Text("Basic Alert"),
        content: const Text("This is an Alert Dialog Message!"),
        actions: [okButton, cancelButton],
      );

      showDialog(
          context: context,
          builder: (BuildContext contex) {
            return alertBasic;
          });
    });
  }
}
