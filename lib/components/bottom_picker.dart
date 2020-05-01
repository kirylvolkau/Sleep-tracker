import 'package:flutter/cupertino.dart';

class BottomPicker extends StatelessWidget
{
  final Widget picker;
  BottomPicker(this.picker);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 216.0,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: this.picker,
          ),
        ),
      ),
    );
  }
}