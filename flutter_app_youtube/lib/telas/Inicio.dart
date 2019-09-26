import 'package:flutter/material.dart';
import 'package:flutter_app_youtube/model/Video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

import '../Api.dart';

class Inicio extends StatefulWidget {

  String _searchWord;

  Inicio( this._searchWord );

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _getVideos(String searchWord) {
    Api api = Api();
    return api.searchYoutube(searchWord);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _getVideos(widget._searchWord),
      builder: (contex, snapshot) {
        switch (snapshot.connectionState) {

          case ConnectionState.none :
          case ConnectionState.waiting :
            return Center(
              child: CircularProgressIndicator(),
            );
            break;

          case ConnectionState.active :
          case ConnectionState.done :
            if (snapshot.data.length > 0) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    List<Video> videos = snapshot.data;
                    Video video = videos[ index ];

                    return GestureDetector(
                      onTap: () {
                        FlutterYoutube.playYoutubeVideoById(
                            apiKey: CHAVE_YOUTUBE_API,
                            videoId: video.id,
                            autoPlay: true,
                            fullScreen: true
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(video.imagem),
                                )
                            ),
                          ),
                          ListTile(
                            title: Text(video.titulo),
                            subtitle: Text(video.canal),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data.length
              );
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
            break;

          default:
            return Center(
              child: Text("Nenhum dado a ser exibido!"),
            );
        }
      },
    );
  }
}