class IoTComponent {
  final String name;
  final String description;
  final String image;
  final bool isMain;

  IoTComponent({
    required this.name,
    required this.description,
    required this.image,
    this.isMain = false,
  });
}
