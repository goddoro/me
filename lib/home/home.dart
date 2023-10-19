import 'package:flutter/material.dart';
import 'package:goddoro/detail/detail.dart';
import "package:provider/provider.dart";
import 'package:goddoro/home/homeViewModel.dart';

import '../entity/medium.dart'; // 데스크탑, 앱 등에 고루 UI를 적용할 수 있게 해주는 구글이 제공해주는 패키

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<Medium> mediumList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<HomeViewModel>(
        builder: (context, provider, child) {
          mediumList = provider.items;
          return ListView.builder(
            itemCount: mediumList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text("${mediumList[index].title}", textAlign: TextAlign.center, maxLines: 1, style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis,)
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailScreen(medium: mediumList[index])),
                        );
                      },
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(mediumList[index].imageUrl ?? "",width: 300, height: 100, fit: BoxFit.cover),
                  )
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}