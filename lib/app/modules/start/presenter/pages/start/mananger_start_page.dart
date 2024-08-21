import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'manager_start_store.dart';

class ManagerStartPage extends StatefulWidget {
  final ManagerStartStore controller;
  const ManagerStartPage({super.key, required this.controller});

  @override
  State<ManagerStartPage> createState() => _ManagerStartPageState();
}

class _ManagerStartPageState extends State<ManagerStartPage>
    with AutomaticKeepAliveClientMixin {
  late ManagerStartStore controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
  }

  @override
  void dispose() {
    controller.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var pageKey = GlobalKey();

    return Scaffold(
      body: Observer(builder: (_) {
        return Column(
          children: [
            Expanded(
              child: PageView(
                key: pageKey,
                controller: controller.pageController,
                onPageChanged: (index) {
                  EasyDebounce.debounce(
                      "onPageChanged", const Duration(milliseconds: 150), () {
                    controller.setCurrentPage(index);
                  });
                },
                children: [
                  // HomeModule(),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
