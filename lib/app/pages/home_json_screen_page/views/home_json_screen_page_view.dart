import 'dart:convert';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class JsonScreenPage extends StatelessWidget {
  final String jsonPath;

  const JsonScreenPage({super.key, required this.jsonPath});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: rootBundle.loadString(jsonPath),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final dynamic data = json.decode(snapshot.data!);
        final registry = JsonWidgetRegistry.instance;

        final widgetData = JsonWidgetData.fromDynamic(data, registry: registry);

        return widgetData.build(context: context);
      },
    );
  }
}
