import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicine_info/animation_wrapper/medicine_item_wrapper.dart';
import 'package:medicine_info/data/medicine_data.dart';
// import 'package:medicine_info/utils/animation_wrapper.dart';
import 'package:medicine_info/widgets/medicine_list_item.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({Key? key}) : super(key: key);

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  final ValueNotifier<ScrollDirection> scrollDirectionNotifier =
      ValueNotifier<ScrollDirection>(ScrollDirection.forward);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine Info"),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward ||
              notification.direction == ScrollDirection.reverse) {
            log("scrollDirectionNotifier.value: ${scrollDirectionNotifier.value}");
            scrollDirectionNotifier.value = notification.direction;
          }
          return true;
        },
        child: GridView.builder(
          padding: EdgeInsets.only(
            left: 3.5,
            right: 3.5,
            top: 10,
            bottom: MediaQuery.of(context).padding.bottom + 20,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1.7,
          ),
          cacheExtent: 0,
          itemCount: MedicinesData.medicineMenu.length,
          itemBuilder: (ctx, index) {
            return ValueListenableBuilder(
              valueListenable: scrollDirectionNotifier,
              builder: (BuildContext context, ScrollDirection scrollDirection,
                  Widget? child) {
                return MedicineItemWrapper(
                  scrollDirection: scrollDirection,
                  keepAlive: false,
                  child: MedicineListItem(
                    medicine: MedicinesData.medicineMenu[index],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
