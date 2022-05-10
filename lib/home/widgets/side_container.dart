import 'package:flutter/material.dart';

class SideContainer extends StatefulWidget {
  const SideContainer({Key? key}) : super(key: key);

  @override
  State<SideContainer> createState() => _SideContainerState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SideContainerState extends State<SideContainer> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 350,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: selected ? 200.0 : 10,
            height: 50.0,
            top: 50.0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                color: Colors.blue,
                child: const Center(child: Text('Tap me')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
