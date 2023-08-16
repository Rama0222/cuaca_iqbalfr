import 'package:flutter/material.dart';

import 'cuaca.dart';

class DetailCuaca extends StatelessWidget {
  final cuaca1 cuaca2;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  const DetailCuaca({
    super.key,
    required this.cuaca2,
  });

  @override
  Widget build(BuildContext context) {
    String path;

    if (cuaca2.cuaca != null) {
      path = imgPath + cuaca2.cuaca!;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Pontianak"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(
                  path,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Text(cuaca2.kodeCuaca!),
              )
            ],
          ),
        ),
      ),
    );
  }
}
