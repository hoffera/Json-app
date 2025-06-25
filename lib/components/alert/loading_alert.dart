import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'loading_alert.g.dart';

@jsonWidget
abstract class _LoadingAlertBuilder extends JsonWidgetBuilder {
  const _LoadingAlertBuilder({required super.args});

  @override
  LoadingAlert buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class LoadingAlert extends StatelessWidget {
  const LoadingAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: Colors.red),
          SizedBox(height: 16),
          Text("Carregando...", style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
