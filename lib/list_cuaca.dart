import 'package:flutter/material.dart';
import 'package:cuaca_iqbalfr/http_cuaca.dart';

import 'detail_cuaca.dart';

class ListCuaca extends StatefulWidget {
  const ListCuaca({super.key});

  @override
  State<ListCuaca> createState() => ListCuacaState();
}

class ListCuacaState extends State<ListCuaca> {
  late HttpHelper helper;
  late int CuacaCount;
  late List CUACA1;

  final String iconBase = 'https://ibnux.github.io/BMKG-importer/icon/5.png';

  final String defaultImage = '';

  Icon visibleIcon = const Icon(Icons.search);
  Widget searchBar = const Text('Perkiraan Cuaca IFR');

  bool isLoading = true;

  Future intiliaze() async {
    setState(() {
      isLoading = true;
    });
    helper.getUpcoming().then((response) {
      setState(() {
        CuacaCount = response.length;
        CUACA1 = response;
        isLoading = false;
      });
    });
  }

  Future search(String title) async {
    setState(() {
      isLoading = true;
    });
    helper.findMovies(title).then((response) {
      setState(() {
        CuacaCount = response.length;
        CUACA1 = response;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    helper = HttpHelper();
    CuacaCount = 0;
    CUACA1 = [];
    intiliaze();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NetworkImage image;

    return Scaffold(
      appBar: AppBar(
        title: searchBar,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return intiliaze();
        },
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: CuacaCount,
                itemBuilder: (BuildContext context, int position) {
                  if (CUACA1[position].cuaca != null) {
                    image = NetworkImage(iconBase + CUACA1[position].kota);
                  } else {
                    image = NetworkImage(defaultImage);
                  }

                  return Card(
                    color: Color.fromARGB(255, 62, 197, 255),
                    elevation: 2.0,
                    child: ListTile(
                      onTap: () {
                        MaterialPageRoute route = MaterialPageRoute(
                            builder: (_) =>
                                DetailCuaca(cuaca2: CUACA1[position]));
                        Navigator.push(context, route);
                      },
                      title: Text(
                        'Temperatur: ${CUACA1[position].tempC} Celcius - Waktu: ${CUACA1[position].jamCuaca} ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Pontianak'),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
