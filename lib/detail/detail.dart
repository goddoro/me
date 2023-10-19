import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../entity/medium.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.medium});

  final Medium medium;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${medium.title}",
          maxLines: 1,
          style: const TextStyle(fontSize: 16),
          overflow: TextOverflow.ellipsis,),
      ),
      body: Center(
        child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                      medium.imageUrl ?? "", width: 300,
                      height: 200,
                      fit: BoxFit.cover),
                )

              ],
            )
        ),
    );
  }
}