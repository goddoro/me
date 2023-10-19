
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0); //Page 컨트롤을 위한 PageController 선언 시작 페이지 0
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView example'),
      ),
      body: PageView(
        controller: controller, // 페이지 관리를 위한 controller
        children: [
          Container( // 첫 번째 페이지 구성, 시작페이지
            color: Colors.yellow,
            child: const Center(
              child: Text('First Page'),
            ),
          ),
          Container( // 두 번째 페이지 구성
            color: Colors.green,
            child: const Center(
              child: Text('Second Page'),
            ),
          ),
          Container( // 세 번째 페이지 구성
            color: Colors.blue,
            child: const Center(
              child: Text('Third Page'),
            ),),
        ],
      )
      ,
    );
  }
}