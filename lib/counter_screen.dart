import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:counter/myredux/actions_redux.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Redux"),
      ),
      body: Center(
        child: StoreConnector<int, String>(
          converter: (store) => store.state.toString(),
          builder: (context, count) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  count,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  'Click${int.parse(count) <= 1 ? '' : 's'}',
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StoreConnector<int, VoidCallback>(builder: (context, callback) {
            return FloatingActionButton(
                onPressed: callback, child: const Icon(Icons.refresh));
          }, converter: (store) {
            return () => store.dispatch(ActionCounter.reset);
          }),
          const SizedBox(
            height: 10,
          ),
          StoreConnector<int, VoidCallback>(builder: (context, callback) {
            return FloatingActionButton(
                onPressed: callback, child: const Icon(Icons.add));
          }, converter: (store) {
            return () => store.dispatch(ActionCounter.increment);
          }),
          const SizedBox(
            height: 10,
          ),
          StoreConnector<int, VoidCallback>(builder: (context, callback) {
            return FloatingActionButton(
              onPressed: callback,
              child: const Icon(Icons.remove),
            );
          }, converter: (store) {
            if (store.state == 0) {
              return () => store;
            }
            return () => store.dispatch(ActionCounter.decrement);
          })
        ],
      ),
    );
  }
}
