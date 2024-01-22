import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as view;

import 'bloc.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Bloc? _bloc;

  @override
  void dispose() {
    _bloc?.close().then((b) => b.dispose());
    _bloc = null;
    super.dispose();
  }
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter != 0) counter--;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _bloc ?? (_bloc = Bloc(context)),
      builder: (context, _) {
        return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(context.strings!.examAppbarTitle),
            ),
             body: Column(
               children: <Widget>[
                 const SizedBox(
                   height: 150,
                 ),
                Image.asset(
              'assets/images/count.jpg',
              width: 390.0,
              height: 155.0,
              fit: BoxFit.cover,
            ),
            Padding(
               padding: const EdgeInsets.only
               (left:15, bottom: 20, right: 20, top:10),
            child: Text(
                       context.strings!.examDescription,
                       textAlign: TextAlign.center,
                       style: const TextStyle(
                        fontWeight: FontWeight.w300,
                         fontSize: 14.0,
                       ),
                     ),
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                      FloatingActionButton(
                       onPressed: decrementCounter,
                       backgroundColor: Colors.white,
                       tooltip: "Decrement",
                       child: const Icon(
                         Icons.remove,
                         color: Colors.black,
                       ),
                     ),
                     Text(
                       '$counter',
                       style: const TextStyle(
                         fontSize: 60.0,
                       ),
                     ),
                       FloatingActionButton(
                       onPressed: incrementCounter,
                       backgroundColor: Colors.white,
                       tooltip: "Increment",
                       child: const Icon(
                         Icons.add,
                         color: Colors.black,
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     FloatingActionButton(
                       onPressed: resetCounter,
                       backgroundColor: Colors.white,
                       tooltip: "Reset",
                       child: const Icon(
                         Icons.restore,
                         color: Colors.black,
                       ),
                     )
                   ],
                 )
               ],
             ),
        )
        );
      },
    );
  }
}
