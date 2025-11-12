import 'package:flutter/material.dart';

class PhotoPicker extends StatelessWidget {
  const PhotoPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 8,
        children: [
          Container(
            height: 50,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            alignment: Alignment.center,
            child: Text('Photo'),
          ),
          Expanded(child: Text('Select photo')),
        ],
      ),
    );
  }
}
