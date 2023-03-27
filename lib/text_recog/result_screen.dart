/* 

import 'package:flutter/material.dart';

import 'package:integrating_atlas/medicine_search_result.dart' as res;

class ResultScreen extends StatelessWidget {
  final String text;
  const ResultScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    List<String> out = text.split(' ');

    return Column(
      children: [
        for (int i = 0; i < out.length; i++)
          if (out[i].toLowerCase() == "paracetamol") res.MyApp(),
      ],
    );

    /* return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Text(out[0]),
      ),
    ); */
  }
}
 */