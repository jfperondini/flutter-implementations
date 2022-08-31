import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

MenuListTile(
        String titulo, String subtitulo, IconData icone, String rotaNome) =>
    ListTile(
        leading: Icon(icone),
        title: Text(titulo),
        subtitle: Text(subtitulo),
        onTap: () {
          Modular.to.pushNamed(rotaNome);
        });
