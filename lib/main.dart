import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/cronometro_viewmodel.dart';
import 'view/cronometro_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CronometroViewmodel(),
      child: MaterialApp(
        title: 'Cronometro',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CronometroView(),
      ),
    );
  }
}
