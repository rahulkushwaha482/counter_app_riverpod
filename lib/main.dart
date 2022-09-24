import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MaterialApp(home: ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerWidget {

  final counter = StateProvider<int>((ref) {
    return 0;
  });

   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counter);
    return MaterialApp(
      title: 'Riverpod Counter App Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpood  counter App Demo'),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(count.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref.read(counter.state).state = 0;
                  },
                  child: const Text('Reset'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counter.state).state++;
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
