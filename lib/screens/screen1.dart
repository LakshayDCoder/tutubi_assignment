import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tutubi_assignment/modal/record.dart';

enum MyShape { circle, square }

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  static const routeName = "/screen-1";

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<Widget> myArray = [];
  List<RecordModal> backTrace = [];

  @override
  Widget build(BuildContext context) {
    final mySquare = Container(
      height: 100,
      width: 100,
      color: Colors.black,
    );

    final myCircle = Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(50)),
    );

    addToArray(MyShape myShape) {
      var shapeToAdd = myShape == MyShape.circle ? myCircle : mySquare;

      if (myArray.length <= 2) {
        myArray.add(shapeToAdd);
      } else {
        var addAtIndex = Random().nextInt(myArray.length);
        myArray.insert(addAtIndex, shapeToAdd);
        // print("Add index: $addAtIndex");
      }

      backTrace.add(RecordModal(myShape, myArray.length - 1));
      setState(() {});
    }

    removeFromArray() {
      // print("Removed");
      RecordModal lastRec = backTrace.last;
      backTrace.removeLast();
      myArray.removeAt(lastRec.arrIndex);

      setState(() {});
    }

    Widget addShapeBtn(MyShape myShape, Function myOnTap) => ElevatedButton(
          onPressed: () => myOnTap(),
          child: const Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            shape: myShape == MyShape.circle
                ? const CircleBorder()
                : const RoundedRectangleBorder(),
            padding: const EdgeInsets.all(25),
          ),
        );

    Widget undoButton(myOnTap) => ElevatedButton(
          onPressed: () => myOnTap(),
          child: const Icon(Icons.undo),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(5),
          ),
        );

    return Scaffold(
      appBar: AppBar(title: const Text("Screen 1")),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    children: myArray,
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 20,
                    runSpacing: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  addShapeBtn(MyShape.circle, () {
                    addToArray(MyShape.circle);
                  }),
                  addShapeBtn(MyShape.square, () {
                    addToArray(MyShape.square);
                  }),
                  if (myArray.isNotEmpty) undoButton(removeFromArray),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(
                  color: Colors.teal,
                  width: 2.0,
                ),
              ),
            ),
          ),
 */
