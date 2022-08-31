import 'package:auto_complete/models/produto_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExemploAutoComplete(),
    );
  }
}

class ExemploAutoComplete extends StatefulWidget {
  const ExemploAutoComplete({Key? key}) : super(key: key);

  @override
  State<ExemploAutoComplete> createState() => _ExemploAutoCompleteState();
}

class _ExemploAutoCompleteState extends State<ExemploAutoComplete> {
  List<ProdutoModel> listUserModels = [];

  @override
  void initState() {
    super.initState();
    //listUserModels = fetchAllProduto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoComplemento'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Autocomplete<ProdutoModel>(
            displayStringForOption: ((produtoModel) => produtoModel.nome),
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return listUserModels;
              }
              return listUserModels.where((ProdutoModel produtoModel) {
                return produtoModel.nome
                    .contains(textEditingValue.text.toLowerCase());
              });
            },
            fieldViewBuilder: (BuildContext context,
                    TextEditingController controller,
                    FocusNode node,
                    Function onSumibt) =>
                const TextField(
              decoration: InputDecoration(hintText: 'Type here'),
            ),
            onSelected: (ProdutoModel produtoModel) {},
          ),
        ),
      ),
    );
  }
}
