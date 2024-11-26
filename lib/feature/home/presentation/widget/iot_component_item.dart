import 'package:flutter/material.dart';
import 'package:pojok_iot/feature/home/model/iot_component_model.dart';

class IoTComponentItem extends StatelessWidget {
  final IoTComponent component;
  final VoidCallback? onTap;

  const IoTComponentItem({
    Key? key,
    required this.component,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          leading: Image.asset(component.image, width: 50, fit: BoxFit.cover),
          title: Text(component.name),
          subtitle: Text(component.description),
        ),
      ),
    );
  }
}
