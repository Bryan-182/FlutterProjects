import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/providers/movies_provider.dart';

class DataSearch extends SearchDelegate {
  final movieProvider = new MoviesProvider();

  final movies = [
    'Spiderman Homecoming',
    'Harry Potter',
    'Lord of the Rings',
    'Gol',
    'Hard Kill',
  ];

  final recents = [
    'Spiderman',
    'Avengers: End Game',
    'Ant Man 2',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //Acciones de AppBar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //Icono a la izquierda del AppBar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //Resultados de la busqueda
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //sugerencias de la busqueda
    if (query.isNotEmpty) {
      return FutureBuilder(
          future: movieProvider.searchMovies(query),
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.hasData) {
              final movies = snapshot.data;

              return ListView(
                children: movies.map((movie) {
                  return ListTile(
                    leading: FadeInImage(
                      placeholder: AssetImage('assets/img/no-image.jpg'),
                      image: NetworkImage(movie.getPosterImg()),
                      fit: BoxFit.contain,
                      height: 50.0,
                    ),
                    title: Text(movie.title),
                    subtitle: Text(movie.originalTitle),
                    onTap: () {
                      close(context, null);
                      movie.uniqueId = 'search';
                      Navigator.pushNamed(context, 'detalle', arguments: movie);
                    },
                  );
                }).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          });
    } else {
      return Container();
    }
  }

  /*@override
  Widget buildSuggestions(BuildContext context) {
    //sugerencias de la busqueda
    final sugestedList = (query.isEmpty)
        ? recents
        : movies
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: sugestedList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(sugestedList[index]),
          onTap: () {},
        );
      },
    );
  }*/
}
