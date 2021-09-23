import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Movie> movies;
  final Function nextPage;

  MovieHorizontal({@required this.movies, @required this.nextPage});

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        nextPage();
      }
    });

    return Container(
      height: _screenSize.height * 0.22,
      child: PageView.builder(
          pageSnapping: false,
          controller: _pageController,
          itemCount: movies.length,
          itemBuilder: (context, index) => _card(context, movies[index])
          //children: _cards(context),
          ),
    );
  }

  Widget _card(BuildContext context, Movie movie) {
    movie.uniqueId = '${movie.id}-movieHorizontal';

    final movieCard = Container(
      margin: EdgeInsets.only(right: 5.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: movie.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(movie.getPosterImg()),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );

    return GestureDetector(
        child: movieCard,
        onTap: () {
          Navigator.pushNamed(context, 'detalle', arguments: movie);
        });
  }
}
