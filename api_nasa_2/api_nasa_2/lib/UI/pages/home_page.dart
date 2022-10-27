import 'package:api_nasa_2/UI/widgets/pinterest_widget.dart';
import 'package:api_nasa_2/cris_data/api_nasa.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    ScrollController _controller = new ScrollController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("IMÁGENES DE LA NASA "),
        ),
        body: Center(
          child: Container(
            height: 1000,
            width: 600,
            child: FutureBuilder(
              future: Nasa().useApi(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  final list = snapshot.data;
                  return GridView.builder(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.6,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: list!.length,
                    itemBuilder: (context, i) {
                      return PinterestItem(list[i].imgSrc);
                    },
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ));
  }
}
