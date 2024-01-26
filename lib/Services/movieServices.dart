import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/Services/httpServices.dart';

import '../Models/Movie.dart';

class movieServices {
  final GetIt _getIt = GetIt.instance;

  httpServices? _httpServices;

  movieServices() {
    _httpServices = _getIt.get<httpServices>();
  }
  Future<List<Movie>?> getPopularMovies({int? page}) async {
    Response? _response = await _httpServices!.get('/movie/popular', query: {
      'page': page,
    });
    if (_response!.statusCode == 200) {
      Map _data = _response.data;
      List<Movie>? _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
      return _movies;
    } else {
      throw Exception('Couldn\'t load popular movies.');
    }
  }

  Future<List<Movie>?> getUpcomingMovies({int? page}) async {
    Response? _response = await _httpServices!.get('/movie/upcoming', query: {
      'page': page,
    });
    if (_response!.statusCode == 200) {
      Map _data = _response.data;
      List<Movie>? _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
      return _movies;
    } else {
      throw Exception('Couldn\'t load upcoming movies.');
    }
  }

  Future<List<Movie>?> searchMovies(String? _seachTerm, {int? page}) async {
    Response? _response = await _httpServices!.getSearch('/search/movie', query: {
      'query': _seachTerm,
      'page': 1,
       
    });
    if (_response!.statusCode == 200) {
      Map _data = _response.data;
      List<Movie>? _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
      print("${_seachTerm} dd");
      print(_movies);
      return _movies;
    } else {
      throw Exception('Couldn\'t perform movies search.');
    }
  }
}
