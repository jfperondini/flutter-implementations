import 'package:flutter/material.dart';

buildCard(String title, subtitle, color) => SizedBox(
      width: 150,
      height: 150,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
            ),
          ],
        ),
        elevation: 2,
        shadowColor: color,
        margin: const EdgeInsets.all(20),
      ),
    );
