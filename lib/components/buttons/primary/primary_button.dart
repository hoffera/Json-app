import 'package:json_dynamic_widget/json_dynamic_widget.dart';
part 'primary_button.g.dart';

@jsonWidget
abstract class _PrimaryButtonBuilder extends JsonWidgetBuilder {
  const _PrimaryButtonBuilder({required super.args});

  @override
  PrimaryButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      onPressed: () {
        print("botao pressionado");
      },
      child: Text('TextButton'),
    );
  }
}
