import 'package:flutter/material.dart';
import 'package:pojok_iot/core/theme/app_color.dart';
import 'package:pojok_iot/feature/home/model/iot_component_model.dart';
import 'package:pojok_iot/feature/home/presentation/component_detail_screen.dart';
import 'package:pojok_iot/feature/home/presentation/all_components_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<IoTComponent> filteredComponents = [];
  List<IoTComponent> filteredMainComponents = [];
  List<IoTComponent> filteredSensorComponents = [];
  List<IoTComponent> allComponents = [];
  List<IoTComponent> mainComponents = [];
  List<IoTComponent> sensorComponents = [];

  @override
  void initState() {
    super.initState();
    allComponents = [
      // Komponen Utama
      IoTComponent(
        name: 'ESP8266',
        description:
            'Mikrokontroller yang menyediakan konektivitas Wi-Fi untuk perangkat IoT. ESP8266 dikenal karena ukurannya yang kecil, harga terjangkau, dan kompatibilitas dengan banyak platform pengembangan.',
        image: 'assets/esp8266.jpeg',
        isMain: true,
      ),
      IoTComponent(
        name: 'ESP32',
        description:
            'Mikrokontroler dengan konektivitas Wi-Fi dan Bluetooth bawaan. ESP32 sering digunakan sebagai otak perangkat IoT karena kemampuannya yang canggih, konsumsi daya rendah, dan fleksibilitas dalam aplikasi jaringan.',
        image: 'assets/esp32.jpeg',
        isMain: true,
      ),
      IoTComponent(
        name: 'Relay',
        description:
            'Saklar elektrik yang dikendalikan secara elektronik. Relay memungkinkan kontrol perangkat berdaya tinggi, seperti lampu atau motor, dengan menggunakan sinyal elektronik berdaya rendah.',
        image: 'assets/relay.jpeg',
        isMain: true,
      ),
      IoTComponent(
        name: 'Power Supply Module',
        description:
            'Modul yang menyediakan tegangan dan arus yang stabil untuk komponen IoT. Modul ini penting untuk memastikan perangkat bekerja tanpa gangguan akibat pasokan daya yang tidak stabil.',
        image: 'assets/power_supply.jpeg',
        isMain: true,
      ),
      IoTComponent(
        name: 'Breadboard',
        description:
            'Papan prototipe yang memungkinkan perakitan rangkaian elektronik tanpa memerlukan solder. Breadboard sangat berguna untuk eksperimen dan pengembangan cepat.',
        image: 'assets/bread.jpg',
        isMain: true,
      ),
      IoTComponent(
        name: 'OLED Display',
        description:
            'Layar kecil yang hemat daya untuk menampilkan informasi dari perangkat IoT. OLED display cocok digunakan untuk menampilkan teks, grafik, atau data sensor.',
        image: 'assets/oled.jpg',
        isMain: true,
      ),
      IoTComponent(
        name: 'RTC Module',
        description:
            'Real-Time Clock (RTC) adalah modul yang menyediakan informasi waktu yang akurat, bahkan saat perangkat mati. Modul ini penting untuk aplikasi IoT yang memerlukan penjadwalan.',
        image: 'assets/rtc_module.jpeg',
        isMain: true,
      ),
      IoTComponent(
        name: 'MicroSD Card Module',
        description:
            'Modul yang memungkinkan penyimpanan data dalam jumlah besar pada kartu SD. Cocok untuk aplikasi IoT yang memerlukan logging data, seperti data sensor atau log aktivitas.',
        image: 'assets/microsd_module.jpeg',
        isMain: true,
      ),
      // Sensor
      IoTComponent(
        name: 'DHT11',
        description:
            'Sensor untuk mengukur suhu dan kelembaban udara. DHT11 lebih ekonomis, sedangkan DHT22 memiliki akurasi dan jangkauan pengukuran yang lebih baik.',
        image: 'assets/dht11.jpg',
        isMain: false,
      ),
      IoTComponent(
        name: 'HC-SR04',
        description:
            'Sensor ultrasonik untuk mengukur jarak. Sensor ini bekerja dengan memancarkan gelombang suara ultrasonik dan mengukur waktu yang dibutuhkan untuk pantulan kembali.',
        image: 'assets/hc-sr04.jpg',
        isMain: false,
      ),
      IoTComponent(
        name: 'Soil Moisture Sensor',
        description:
            'Sensor untuk mengukur kelembaban tanah. Sangat cocok untuk aplikasi pertanian atau sistem irigasi otomatis.',
        image: 'assets/soil_moisture_sensor.jpeg',
        isMain: false,
      ),
      IoTComponent(
        name: 'Rain Sensor',
        description:
            'Sensor untuk mendeteksi keberadaan air. Rain sensor digunakan untuk aplikasi cuaca atau sistem yang memerlukan deteksi hujan.',
        image: 'assets/rain_sensor.jpeg',
        isMain: false,
      ),
      IoTComponent(
        name: 'Flame Sensor',
        description:
            'Sensor api yang digunakan untuk mendeteksi keberadaan api atau cahaya inframerah dari api. Sangat penting untuk aplikasi keamanan kebakaran.',
        image: 'assets/flame_sensor.jpeg',
        isMain: false,
      ),
      IoTComponent(
        name: 'BMP180/BMP280',
        description:
            'Sensor tekanan udara dan suhu. BMP180 dan BMP280 sering digunakan dalam aplikasi cuaca atau altimeter untuk mengukur ketinggian berdasarkan tekanan udara.',
        image: 'assets/bmp180.jpeg',
        isMain: false,
      ),
      IoTComponent(
        name: 'MQ-2',
        description:
            'Sensor gas yang dapat mendeteksi gas LPG, asap, metana, dan gas lainnya. Sensor ini sering digunakan untuk aplikasi keamanan atau deteksi kebocoran gas.',
        image: 'assets/mq2.jpeg',
        isMain: false,
      ),
      IoTComponent(
        name: 'PIR Sensor',
        description:
            'Sensor inframerah pasif yang digunakan untuk mendeteksi gerakan. PIR sensor sangat berguna untuk aplikasi keamanan atau otomatisasi rumah.',
        image: 'assets/pir.jpeg',
        isMain: false,
      ),
      IoTComponent(
        name: 'LDR',
        description:
            'Light Dependent Resistor (LDR) adalah sensor cahaya yang mendeteksi intensitas cahaya. Sensor ini cocok untuk aplikasi pencahayaan otomatis.',
        image: 'assets/ldr.jpeg',
        isMain: false,
      ),
    ];

    mainComponents =
        allComponents.where((component) => component.isMain).toList();
    sensorComponents =
        allComponents.where((component) => !component.isMain).toList();

    // Set daftar filter awal
    filteredComponents = List.from(allComponents);
    filteredMainComponents = List.from(mainComponents);
    filteredSensorComponents = List.from(sensorComponents);
  }

  void _filterComponents(String query) {
    final results = allComponents
        .where((component) =>
            component.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    final mainResults = results.where((component) => component.isMain).toList();
    final sensorResults =
        results.where((component) => !component.isMain).toList();

    setState(() {
      filteredComponents = results;
      filteredMainComponents = mainResults;
      filteredSensorComponents = sensorResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 24,
          bottom: MediaQuery.of(context).padding.bottom + 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Halo, Selamat Datang!",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColor.primaryColor),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Jelajahi komponen IoT untuk memulai inovasi Anda.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            // Search Bar
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.backgroundGray,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: _filterComponents,
                      decoration: const InputDecoration(
                        hintText: 'Cari Komponen',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Komponen Utama
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Komponen Utama",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllComponentsScreen(components: mainComponents),
                        ),
                      );
                    },
                    child: const Text("Lihat Semua"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 280,
              child: ListView.separated(
                itemCount: filteredMainComponents.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final component = filteredMainComponents[index];
                  return _buildCardComponent(context, component);
                },
              ),
            ),
            const SizedBox(height: 16),
            // Sensor
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sensor",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllComponentsScreen(components: sensorComponents),
                        ),
                      );
                    },
                    child: const Text("Lihat Semua"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 280,
              child: ListView.separated(
                itemCount: filteredSensorComponents.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final component = filteredSensorComponents[index];
                  return _buildCardComponent(context, component);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardComponent(BuildContext context, IoTComponent component) {
    return SizedBox(
      width: 200,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComponentDetailScreen(component: component),
            ),
          );
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        component.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  component.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
