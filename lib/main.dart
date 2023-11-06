import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CIS 3334 Tip Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _billTextField = TextEditingController();
  bool isSwitched = false;
  double _totalDouble = 0;
  double _bill = 0;
  double _tipService = 0.15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tip Calculator',
              style: TextStyle(
                  fontSize: 48,
                  color: Colors.red),
            ),
            const Text(
              'Total Amount of Bill:',
              style: TextStyle(fontSize: 28),
            ),
            TextField(
              controller: _billTextField,
            ),
            const Text(
              "Great Service?"
            ),
            Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                  if(value == false) {

                    _tipService = 0.15;
                    print("value set to false.");
                  }
                  else if (value == true) {
                    _tipService = 0.2;
                    print("value set to true.");
                  }
                },
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _bill = double.parse(_billTextField.text);
                    _totalDouble = _bill * _tipService;
                    print("calculate tip pressed.");
                  });
                },
                child: const Text('Calculate Tip'),
            ),
            const Text(
                "Total Tip:"
            ),
            Text(
                _totalDouble.toString()
            ),
          ],
        ),
      ),
    );
  }
}
