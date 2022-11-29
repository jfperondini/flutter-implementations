import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/modules/controller/collections_controller.dart';
import 'package:shared/shared/models/strings.dart';
import 'package:shared/shared/style/color.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({super.key});
  final collectionController = Modular.get<CollectionController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          color: chumboEsczClr,
          width: size.width,
          height: size.height / 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                const Text(
                  dicasRespostas,
                  style: TextStyle(
                      color: geloClr,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: collectionController.searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: laraAmzClr,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    hintText: exPesquisa,
                    hintStyle: const TextStyle(color: chumboEsczClr),
                  ),
                  style: const TextStyle(color: chumboEsczClr),
                  onTap: () {
                    if (collectionController.searchController.text.isNotEmpty) {
                      Modular.to.pushNamed('/search');
                    }
                    collectionController
                        .searchNews(collectionController.searchController.text);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
