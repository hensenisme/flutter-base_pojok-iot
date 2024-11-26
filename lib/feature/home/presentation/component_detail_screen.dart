import 'package:flutter/material.dart';
import 'package:pojok_iot/feature/home/model/iot_component_model.dart';

class ComponentDetailScreen extends StatelessWidget {
  final IoTComponent component;

  const ComponentDetailScreen({super.key, required this.component});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(component.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Komponen
            Image.asset(
              component.image,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            // Nama Komponen
            Text(
              component.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            // Deskripsi Komponen
            Text(
              component.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
