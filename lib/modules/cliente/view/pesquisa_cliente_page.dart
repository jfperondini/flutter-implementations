import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PesquisaClientePage extends SearchDelegate<dynamic> {
  @override
  String get searchFieldLabel => 'ex: cnpj';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (() {
        close(context, '');
      }),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: resultadoCliente(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(snapshot.data!['nomefantasia']),
                          Text(snapshot.data!['cnpjCpf']),
                        ],
                      ),
                    ],
                  )),
            ],
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Erro ao pegar Cliente'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder<List>(
        future: sugestoescliente(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(snapshot.data![index]['id_cliente']),
                    title: Text(snapshot.data![index]['nomefantasia']),
                    subtitle: Text(snapshot.data![index]['cnpj_cpf']),
                    onTap: () {
                      query = snapshot.data![index]['cnpj_cpf'].toString();
                      showResults(context);
                    },
                  );
                });
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao pesquisar Cliente!'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<List> sugestoescliente() async {
    var url = Uri.parse(
        'http://18.228.152.45:213/datasnap/rest/TSMCliente/Cliente/$query');
    // Map<String, String> headers = {
    //   'Authorization': 'Token',
    // };
    var response = await http.get(url); //, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body).map((cliente) => cliente).toList();
    }
    throw Exception('Erro ao solicitar o cliente pesquisado');
  }

  Future<Map<String, dynamic>> resultadoCliente(String cnpjCpf) async {
    var url = Uri.parse(
        'http://18.228.152.45:213/datasnap/rest/TSMCliente/Cliente/$cnpjCpf');
    // Map<String, String> headers = {
    //   'Authorization': 'Token',
    // };
    var response = await http.get(url); //, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Erro ao solicitar o cliente pesquisado');
  }
}
