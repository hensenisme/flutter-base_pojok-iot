import 'package:flutter/material.dart';
import 'package:pojok_iot/feature/home/model/iot_component_model.dart';
import 'package:pojok_iot/feature/home/presentation/component_detail_screen.dart';
import 'package:pojok_iot/feature/home/presentation/widget/iot_component_item.dart';

class AllComponentsScreen extends StatelessWidget {
  final List<IoTComponent> components;

  const AllComponentsScreen({super.key, required this.components});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Semua Komponen"),
      ),
      body: ListView.builder(
        itemCount: components.length,
        itemBuilder: (context, index) {
          final component = components[index];
          return IoTComponentItem(
            component: component,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ComponentDetailScreen(component: component),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
