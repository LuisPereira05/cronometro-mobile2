import 'package:flutter/material.dart';
import '../viewmodel/cronometro_viewmodel.dart';

class Controles extends StatelessWidget {
  final CronometroViewmodel viewModel;

  Controles({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed:
              viewModel.model.isRunning ? viewModel.stop : viewModel.start,
          child: Text(viewModel.model.isRunning ? 'Parar' : 'Começar'),
        ),

        SizedBox(width: 20),
        ElevatedButton(onPressed: viewModel.reset, child: Text('Reset')),
        SizedBox(width: 20),
        ElevatedButton(onPressed: viewModel.volta, child: Text('Volta')),
      ],
    );
  }
}
