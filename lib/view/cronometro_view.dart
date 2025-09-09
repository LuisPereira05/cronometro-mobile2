import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/cronometro_viewmodel.dart';
import '../widget/controles.dart';
import '../widget/progress_bar.dart';

class CronometroView extends StatelessWidget {
  const CronometroView({super.key});

  String durationFormatter(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    final milliseconds = (duration.inMilliseconds ~/ 10)
        .remainder(100)
        .toString()
        .padLeft(2, '0');
    return '$minutes:$seconds.$milliseconds';
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CronometroViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cornometro", // hehehehehehe
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 70, 90, 116),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 47, 51),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(200, 200),
                      painter: FlatTipCircularProgressBar(
                        progress: viewModel.bottomProgress,
                        color: Colors.white,
                        strokeWidth: 15,
                      ),
                    ),

                    CustomPaint(
                      size: Size(200, 200),
                      painter: FlatTipCircularProgressBar(
                        progress: viewModel.topProgress,
                        color: Color.fromARGB(255, 39, 47, 51),
                        strokeWidth: 25,
                      ),
                    ),
                    Semantics(
                      label: 'Stopwatch display',
                      hint:
                          'Current time in minutes, seconds, and milliseconds.',
                      child: Text(
                        durationFormatter(viewModel.model.elapsed),
                        style: TextStyle(fontSize: 48, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),
            Semantics(
              label: 'Control buttons',
              child: Controles(viewModel: viewModel),
            ),

            SizedBox(height: 20),

            Container(
              height: 300,
              width: 300,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: viewModel.model.voltas.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                    title: Text(
                      durationFormatter(viewModel.model.voltas[index]) +
                          "\t\t\t\t\t" +
                          durationFormatter(viewModel.model.gvolta[index]),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Text(index.toString()),
                    leadingAndTrailingTextStyle: TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
