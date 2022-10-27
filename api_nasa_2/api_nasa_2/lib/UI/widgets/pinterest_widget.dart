import 'package:flutter/material.dart';

class PinterestItem extends StatelessWidget {
  final String photo;
  PinterestItem(this.photo);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Image.network(photo, fit: BoxFit.cover),
    );
  }
}
