import 'package:flutter/material.dart';
import 'package:movie_screen/data/network/api_constant.dart';
import 'package:movie_screen/util/util.dart';

import '../../../../domain/model/info_movie_model/info_movie_model.dart';

class MovieItem extends StatefulWidget {
  const MovieItem({
    Key? key,
    required this.infoMovieModel,
  }) : super(key: key);

  final InfoMovieModel infoMovieModel;

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 10),
              color: Colors.black38,
              blurRadius: 10,
              blurStyle: BlurStyle.normal),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Image.network(ApiConstants.imageBaseUrl +
              '${widget.infoMovieModel.posterPath}'),
          Positioned(
            top: 5,
            right: 5,
            child: rate(widget.infoMovieModel.voteAverage.toString()),
          ),
          Positioned(
            bottom: 3,
            child: Container(
              child: title(widget.infoMovieModel.title ?? '',
                  '${Util.parseStringToDateTime(widget.infoMovieModel.releaseDate ?? '').year}'),
            ),
          ),
        ],
      ),
    );
  }
}

Widget title(String title, String year) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          year,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white54,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}

Widget rate(String rate) {
  return Container(
    padding: const EdgeInsets.all(7),
    decoration: const BoxDecoration(
      color: Colors.orange,
      shape: BoxShape.circle,
    ),
    child: Text(
      rate,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
