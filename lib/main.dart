import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final snackBar = SnackBar(
    content: Text('Saved'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );

  String del = 'No choice';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (() {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
              child: Text('Save'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: (() {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        TextButton(
                          child: Text('NO'),
                          onPressed: (() {
                            setState(() {
                              del = 'You chose No';
                            });
                            Navigator.pop(context);
                          }),
                        ),
                        TextButton(
                          child: Text(
                            'YES',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: (() {
                            setState(() {
                              del = 'You chose Yes';
                            });
                            Navigator.pop(context);
                          }),
                        ),
                      ],
                      title: Text('Delete?'),
                      content: Text('Are you sure?'),
                    );
                  },
                );
              }),
              child: Text('Delete'),
            ),
            Text('$del'),
          ],
        ),
      ),
    );
  }
}
