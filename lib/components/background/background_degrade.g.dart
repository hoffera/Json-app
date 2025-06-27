// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_degrade.dart';

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

class BackgroundDegradeBuilder extends _BackgroundDegradeBuilder {
  const BackgroundDegradeBuilder({required super.args});

  static const kType = 'background_degrade';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static BackgroundDegradeBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => BackgroundDegradeBuilder(args: map);

  @override
  BackgroundDegradeBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = BackgroundDegradeBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  BackgroundDegrade buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return BackgroundDegrade(
      key: key,
      child: model.child?.build(childBuilder: childBuilder, context: context),
    );
  }
}

class JsonBackgroundDegrade extends JsonWidgetData {
  JsonBackgroundDegrade({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    this.child,
  }) : super(
         jsonWidgetArgs: BackgroundDegradeBuilderModel.fromDynamic(
           {'child': child, ...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => BackgroundDegradeBuilder(
           args: BackgroundDegradeBuilderModel.fromDynamic(
             {'child': child, ...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: BackgroundDegradeBuilder.kType,
       );

  final JsonWidgetData? child;
}

class BackgroundDegradeBuilderModel extends JsonWidgetBuilderModel {
  const BackgroundDegradeBuilderModel(super.args, {this.child});

  final JsonWidgetData? child;

  static BackgroundDegradeBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[BackgroundDegradeBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static BackgroundDegradeBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    BackgroundDegradeBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is BackgroundDegradeBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = BackgroundDegradeBuilderModel(
          args,
          child: () {
            dynamic parsed = JsonWidgetData.maybeFromDynamic(
              map['child'],
              registry: registry,
            );

            return parsed;
          }(),
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({'child': child?.toJson(), ...args});
  }
}

class BackgroundDegradeSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/background_degrade.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'BackgroundDegrade',
    'type': 'object',
    'additionalProperties': false,
    'properties': {'child': SchemaHelper.objectSchema(JsonWidgetDataSchema.id)},
    'required': [],
  };
}
