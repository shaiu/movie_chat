import 'package:movie_chat/models/movie_chat_model.dart';
import 'package:movie_chat/repo/movie_chat_repo.dart';

class MovieChatViewModel {
  final MovieChatRepo _movieChatRepo;

  MovieChatViewModel(this._movieChatRepo);

  Stream<List<MovieChat>> getMovieChats() {
    return _movieChatRepo.getMovieChats();
  }
}
