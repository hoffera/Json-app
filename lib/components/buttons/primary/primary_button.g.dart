// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primary_button.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: avoid_init_to_null
// ignore_for_file: deprecated_member_use

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_if_null_operators
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class PrimaryButtonBuilder extends _PrimaryButtonBuilder {
  const PrimaryButtonBuilder({required super.args});

  static const kType = 'primary_button';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static PrimaryButtonBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => PrimaryButtonBuilder(args: map);

  @override
  PrimaryButtonBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = PrimaryButtonBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  PrimaryButton buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return PrimaryButton(key: key);
  }
}

class JsonPrimaryButton extends JsonWidgetData {
  JsonPrimaryButton({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) : super(
         jsonWidgetArgs: PrimaryButtonBuilderModel.fromDynamic(
           {...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => PrimaryButtonBuilder(
           args: PrimaryButtonBuilderModel.fromDynamic(
             {...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: PrimaryButtonBuilder.kType,
       );
}

class PrimaryButtonBuilderModel extends JsonWidgetBuilderModel {
  const PrimaryButtonBuilderModel(super.args);

  static PrimaryButtonBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[PrimaryButtonBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static PrimaryButtonBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    PrimaryButtonBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is PrimaryButtonBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = PrimaryButtonBuilderModel(args);
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({...args});
  }
}

class PrimaryButtonSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/primary_button.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'PrimaryButton',
    'type': 'object',
    'additionalProperties': false,
    'properties': {},
    'required': [],
  };
}
