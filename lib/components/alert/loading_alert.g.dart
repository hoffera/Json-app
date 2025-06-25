// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_alert.dart';

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

class LoadingAlertBuilder extends _LoadingAlertBuilder {
  const LoadingAlertBuilder({required super.args});

  static const kType = 'loading_alert';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static LoadingAlertBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) => LoadingAlertBuilder(args: map);

  @override
  LoadingAlertBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = LoadingAlertBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  LoadingAlert buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(childBuilder: childBuilder, data: data);

    return LoadingAlert(key: key);
  }
}

class JsonLoadingAlert extends JsonWidgetData {
  JsonLoadingAlert({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) : super(
         jsonWidgetArgs: LoadingAlertBuilderModel.fromDynamic(
           {...args},
           args: args,
           registry: registry,
         ),
         jsonWidgetBuilder: () => LoadingAlertBuilder(
           args: LoadingAlertBuilderModel.fromDynamic(
             {...args},
             args: args,
             registry: registry,
           ),
         ),
         jsonWidgetType: LoadingAlertBuilder.kType,
       );
}

class LoadingAlertBuilderModel extends JsonWidgetBuilderModel {
  const LoadingAlertBuilderModel(super.args);

  static LoadingAlertBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(map, args: args, registry: registry);

    if (result == null) {
      throw Exception(
        '[LoadingAlertBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static LoadingAlertBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    LoadingAlertBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(map, normalize: true);
      }

      if (map is LoadingAlertBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = LoadingAlertBuilderModel(args);
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({...args});
  }
}

class LoadingAlertSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_app/loading_alert.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': 'LoadingAlert',
    'type': 'object',
    'additionalProperties': false,
    'properties': {},
    'required': [],
  };
}
