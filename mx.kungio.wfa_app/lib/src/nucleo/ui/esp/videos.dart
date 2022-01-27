//  librerias internas de flutter
/* 
import 'dart:io';

import 'package:flutter/material.dart';
//  librerias importadas flutter

import 'package:video_player/video_player.dart';
import 'package:better_player/better_player.dart';

//import 'package:chewie/chewie.dart';

//  librerias  proyecto


class ReproductorVideoSimple extends StatefulWidget {
  ReproductorVideoSimple({Key key, this.titulo, this.ruta}) : super(key: key);
  String titulo;
  String ruta;
  @override
  _ReproductorVideoSimple_State createState() =>
      _ReproductorVideoSimple_State();
}

class _ReproductorVideoSimple_State extends State<ReproductorVideoSimple> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    String ruta = widget.ruta;
    //ruta='assets/videos/VID_01.mp4';
    if (ruta.contains('http'))
      _controller = VideoPlayerController.network(ruta);
    else if (ruta != null && ruta != '')
      //_controller = VideoPlayerController.asset(ruta);
      _controller = VideoPlayerController.file(File(ruta));
    else
      _controller = VideoPlayerController.asset('assets/videos/VID_01.mp4');
    //
    //ruta='assets/videos/VID_01.mp4';
    //ruta="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

    //_controller = VideoPlayerController.network('assets/videos/VID_01.mp4');
    // _controller.addListener(() {
    //     setState(() {
    //       print ("escuchar");
    //     });
    // });
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    _controller.initialize().then((_) {
      setState(() {
        print("iniciar");
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      // Container(
      //   padding: const EdgeInsets.only(top: 20.0),
      // ),
      Row(children: <Widget>[
        Text(widget.titulo == null ? "" : widget.titulo),
        IconButton(
          icon: Icon(_controller.value.isPlaying
              ? Icons.pause
              : Icons.play_circle_filled),
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying)
                _controller.pause();
              else
                _controller.play();
            });
          },
        ),
      ]),
      Container(
        padding: const EdgeInsets.all(20),
        child: AspectRatio(
          //aspectRatio: _controller.value.aspectRatio,
          aspectRatio: 16 / 9,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              VideoPlayer(_controller),
              //  // _ControlsOverlay(controller: _controller),
              VideoProgressIndicator(_controller, allowScrubbing: true),
            ],
          ),
        ),
      ),
    ]));
  }
}

class ReproductorVideoMejorado extends StatefulWidget {
  ReproductorVideoMejorado({Key key, this.titulo, this.ruta}) : super(key: key);
  String titulo;
  String ruta;
  @override
  _ReproductorVideoMejorado_State createState() =>
      _ReproductorVideoMejorado_State();
}

class _ReproductorVideoMejorado_State extends State<ReproductorVideoMejorado> {
  VideoPlayerController _controller;
  BetterPlayerController _betterPlayerController;
  BetterPlayerDataSource betterPlayerDataSource;
  BetterPlayerConfiguration config;
  String ruta;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    //_betterPlayerController.dispose();
    //_betterPlayerController=null;
  }

  @override
  Widget build(BuildContext context) {
    iniciar();
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Row(children: <Widget>[
        Text(widget.titulo == null ? "" : widget.titulo),
      ]),
      Container(
        padding: const EdgeInsets.all(20),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              BetterPlayer(controller: _betterPlayerController),
            ],
          ),
        ),
      ),
    ]));
  }

  void iniciar() {
    ruta = widget.ruta;

    //ruta='assets/videos/VID_01.mp4';
    print(ruta);
    //ruta="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

    // if (ruta != null && ruta.contains('http')) {
    //   betterPlayerDataSource =
    //       BetterPlayerDataSource(BetterPlayerDataSourceType.NETWORK, ruta);
    // } else if (ruta != null && ruta != '') {
    //   betterPlayerDataSource =
    //       BetterPlayerDataSource(BetterPlayerDataSourceType.FILE, ruta);
    // } else {
    //   ruta = 'assets/videos/VID_01.mp4';
    //   betterPlayerDataSource =
    //       BetterPlayerDataSource(BetterPlayerDataSourceType.FILE, ruta);
    //}
    config = BetterPlayerConfiguration(
      looping: false,
      autoPlay: false,
      aspectRatio: 1,
      fit: BoxFit.contain,
    );

    _betterPlayerController = BetterPlayerController(config,
        betterPlayerDataSource: betterPlayerDataSource);
  }
}

class ListaVideo extends StatefulWidget {
  ListaVideo({Key key, this.titulo, this.lista}) : super(key: key);
  String titulo;
  List<dynamic> lista;
  @override
  _ListaVideo_State createState() => _ListaVideo_State();
}

class _ListaVideo_State extends State<ListaVideo> {
  List<BetterPlayerDataSource> createDataSet() {
    List dataSourceList = List<BetterPlayerDataSource>();
/*     dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.NETWORK,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      ),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.NETWORK,
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.NETWORK,
          "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"),
    ); */
    return dataSourceList;
  }

  @override
  Widget build(BuildContext context) {
    List<BetterPlayerDataSource> dataSourceList = createDataSet();
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayerPlaylist(
          betterPlayerConfiguration: BetterPlayerConfiguration(),
          betterPlayerPlaylistConfiguration:
              BetterPlayerPlaylistConfiguration(),
          betterPlayerDataSourceList: dataSourceList),
    );
  }


} */


/* class ReproductorVideoPersonalizado extends StatefulWidget {
  ReproductorVideoPersonalizado({Key key,this.titulo,this.ruta}) : super(key: key);
  String titulo;
  String ruta;
  @override
  _ReproductorVideoPersonalizado_State createState() => _ReproductorVideoPersonalizado_State();
}

class _ReproductorVideoPersonalizado_State extends State<ReproductorVideoPersonalizado > {
  VideoPlayerController _controller;
  ChewieController _chewieController;  
   @override
  void initState() {
      super.initState();
      String ruta=widget.ruta;
      //ruta='assets/videos/VID_01.mp4';
      if (ruta.contains('http'))
          _controller = VideoPlayerController.network(ruta);
      else if  ( ruta!= null && ruta!='' )
         _controller = VideoPlayerController.asset(ruta);    
      else
         _controller = VideoPlayerController.asset('assets/videos/VID_01.mp4');     
      // _controller.setLooping(true);
      // _controller.setVolume(1.0);
      _controller.initialize().then((_) { 
            setState(() {     
                 print ("iniciar");
             });
       });
       _chewieController = ChewieController(
          videoPlayerController: _controller,
          aspectRatio: 16/9,
          autoPlay: false,
          looping: false,
        );
  } 

  @override
  void dispose() {
      _controller.dispose();
      _chewieController.dispose();
      super.dispose();
  }  
  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
                    child:  Chewie(
                   controller: _chewieController,
      ));
  }
}
*/

