import 'dart:io';

import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:lucide_icons/lucide_icons.dart' show LucideIcons;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ExportExamplePage extends StatefulWidget {
  const ExportExamplePage({super.key});

  @override
  State createState() => _ExportExamplePageState();
}

class _ExportExamplePageState extends State<ExportExamplePage> {
  final GlobalKey<JsonWidgetExporterData> _exportKey =
      GlobalKey<JsonWidgetExporterData>();

  int _count = 1;

  @override
  Widget build(BuildContext context) {
    final registry = JsonWidgetRegistry();

    registry.setValue('count', _count);
    registry.setValue(
      'increment',
      () =>
          () => setState(() => _count++),
    );

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.copy, color: Colors.white),
            onPressed: () async {
              final data = _exportKey.currentState!.export(
                indent: '  ',
                mode: ReverseEncodingMode.json,
              );

              final directory = await getApplicationDocumentsDirectory();
              final file = File('${directory.path}/exported_widget.json');
              await file.writeAsString(data);

              // Compartilhar o arquivo
              await Share.shareXFiles([
                XFile(file.path),
              ], text: 'Widget exportado!');
            },
          ),
        ],
        backgroundColor: Colors.black,
        title: const Text('Exporter', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: JsonWidgetExporter(
          key: _exportKey,
          child: JsonExportable(
            child: JsonContainer(
              foregroundDecoration: null,
              height: 180,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFf0faff),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(color: Color(0xFFdbeafe), width: 2),
              ),
              child: JsonColumn(
                children: [
                  JsonRow(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      JsonIcon(
                        IconData(0xe174, fontFamily: 'MaterialIcons'),
                        size: 64,
                        color: Colors.black,
                      ),
                      JsonColumn(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          JsonText(
                            "17°C",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          JsonText(
                            "Sensação térmica: 18°C",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      JsonColumn(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          JsonText(
                            "Paranaguá",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          JsonText(
                            "Portos do Paraná",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  JsonSizedBox(height: 20),
                  secondLine(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  JsonRow secondLine() {
    return JsonRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        card(
          "3.0 nós",
          "SSW",
          const Color(0xFFecfeff),
          LucideIcons.wind,
          const Color(0xFF22bfd9),
        ),
        card(
          "79%",
          "Umidade",
          const Color(0xFFeff6ff),
          LucideIcons.droplets,
          const Color(0xFF4387f6),
        ),
        card(
          "1018",
          "Pressão",
          const Color(0xFFfffbeb),
          LucideIcons.thermometer,
          const Color(0xFFf6ab2b),
        ),
      ],
    );
  }

  JsonContainer card(
    String title,
    String subtitle,
    Color backgroundColor,
    IconData icon,
    Color iconColor,
  ) {
    return JsonContainer(
      foregroundDecoration: null,
      height: 60,
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: JsonRow(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          JsonIcon(icon, size: 20, weight: 20, color: iconColor),
          JsonSizedBox(width: 10),
          JsonColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JsonText(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              JsonText(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
