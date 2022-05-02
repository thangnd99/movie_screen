import 'package:flutter/material.dart';

class MovieItem extends StatefulWidget {
  const MovieItem({Key? key}) : super(key: key);

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(offset: Offset(1,0)),
          BoxShadow(offset: Offset(2,0)),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(

      ),
    );
  }
}
