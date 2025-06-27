import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:json_app/app/enum/enum.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

part 'background_degrade.g.dart';

@jsonWidget
abstract class _BackgroundDegradeBuilder extends JsonWidgetBuilder {
  const _BackgroundDegradeBuilder({required super.args});

  @override
  BackgroundDegrade buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class BackgroundDegrade extends StatelessWidget {
  final Widget? child;

  const BackgroundDegrade({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(1.5, -0.3),
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-1.5, -0.3),
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -1.2),
            child: Container(
              height: 300,
              width: 600,
              decoration: const BoxDecoration(color: AppColors.background),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
            ),
          ),

          if (child != null) child!,
        ],
      ),
    );
  }
}
