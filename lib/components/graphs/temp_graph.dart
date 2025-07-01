import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

@jsonWidget
abstract class _TempGraphBuilder extends JsonWidgetBuilder {
  const _TempGraphBuilder({required super.args});

  @override
  TempGraph buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class TempGraph extends StatelessWidget {
  final double value;
  final double minimum;
  final double maximum;

  const TempGraph({
    super.key,
    required this.value,
    required this.minimum,
    required this.maximum,
  });

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      minimum: minimum,
      maximum: maximum,
      tickPosition: LinearElementPosition.cross,
      orientation: LinearGaugeOrientation.vertical,
      minorTicksPerInterval: 1,
      animationDuration: 3000,
      useRangeColorForAxis: true,
      animateAxis: true,
      interval: 5,
      majorTickStyle: LinearTickStyle(length: 200, color: Colors.white),
      axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.white),
      axisTrackStyle: LinearAxisTrackStyle(
        color: Colors.white,
        thickness: 2,
        edgeStyle: LinearEdgeStyle.bothFlat,
      ),
      markerPointers: [
        LinearShapePointer(
          value: value,
          color: Colors.white,
          borderColor: Colors.grey,
          borderWidth: 2,
          offset: 0,
          height: 20,
          width: 20,
          shapeType: LinearShapePointerType.invertedTriangle,
          position: LinearElementPosition.outside,
        ),
      ],
      ranges: <LinearGaugeRange>[
        LinearGaugeRange(
          startWidth: 0,
          endWidth: 100,
          position: LinearElementPosition.outside,
          shaderCallback: (bounds) => RadialGradient(
            center: Alignment.bottomRight,
            radius: 1.5,
            colors: [Colors.red, Colors.green],
          ).createShader(bounds),
        ),

        LinearGaugeRange(
          startWidth: 0,
          endWidth: 100,
          position: LinearElementPosition.inside,
          shaderCallback: (bounds) => RadialGradient(
            center: Alignment.bottomLeft,
            radius: 1.5,
            colors: [Colors.red, Colors.green],
          ).createShader(bounds),
        ),
      ],
    );
  }
}
