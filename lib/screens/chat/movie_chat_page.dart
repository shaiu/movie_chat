import 'package:flutter/material.dart';
import 'package:movie_chat/models/movie_chat_model.dart';
import 'package:movie_chat/repo/movie_chat_repo.dart';
import 'package:movie_chat/screens/chat/movie_chat_view_model.dart';
import 'package:movie_chat/widgets/conversation_list.dart';

class MovieChatPage extends StatelessWidget {
  final viewModel = MovieChatViewModel(MovieChatRepo());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MovieChat>>(
      stream: viewModel.getMovieChats(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            "Movies",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 2,
                              bottom: 2,
                            ),
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.pink[50],
                            ),
                            child: Row(
                              children: const <Widget>[
                                Icon(
                                  Icons.add,
                                  color: Colors.pink,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Add New",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: snapshot.data?.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return MovieChatList(
                        name: snapshot.data![index].name,
                        description: snapshot.data![index].description,
                        imageUrl: snapshot.data![index].imagePath,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Text("Waiting...");
        }
      },
    );
  }
}
