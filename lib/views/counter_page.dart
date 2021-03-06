import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertestcountapp/Models/counter_model.dart';
import 'package:fluttertestcountapp/ViewModels/counter_state_notifier.dart';
import 'package:fluttertestcountapp/common/common_text_style.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final count =
    context.select<CounterState, int>((CounterState state) => state.count);
    return Scaffold(
      appBar: AppBar(
        title: const Text('sample couter app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              'You have pushed the button this many times:',
              style: CommonTextStyles.captionBlack,
              minFontSize: 10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              count.toString(),
              style: CommonTextStyles.headlineBlue,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterStateNotifier>().tapPlusBtn(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}