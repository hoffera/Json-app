// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_widget_registrar.dart';

// **************************************************************************
// Generator: JsonWidgetRegistrarBuilder
// **************************************************************************

class CustomWidgetRegistrar extends _CustomWidgetRegistrar {
  final Map<String, JsonWidgetBuilderContainer> _builders =
      <String, JsonWidgetBuilderContainer>{};

  final Map<String, Map<String, Object>> _schemas =
      <String, Map<String, Object>>{};

  static CustomWidgetRegistrar registerDefaults({
    JsonWidgetRegistry? registry,
  }) {
    registry ??= JsonWidgetRegistry.instance;
    return CustomWidgetRegistrar()
      ..withLinearGraph()
      ..withLoadingAlert()
      ..withPrimaryButton()
      ..withSvg()
      ..register(registry);
  }

  Map<String, Map<String, Object>> get schemas =>
      Map<String, Map<String, Object>>.from(_schemas);

  void register(JsonWidgetRegistry registry) {
    for (var b in _builders.entries) {
      registry.registerCustomBuilder(b.key, b.value);
    }

    final schemaCache = SchemaCache();
    for (var s in _schemas.entries) {
      schemaCache.addSchema(s.key, s.value);
    }
  }

  void withLinearGraph() {
    _builders[LinearGraphBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: LinearGraphBuilder.fromDynamic,
      schemaId: LinearGraphSchema.id,
    );
    _schemas[LinearGraphSchema.id] = LinearGraphSchema.schema;
  }

  void withLoadingAlert() {
    _builders[LoadingAlertBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: LoadingAlertBuilder.fromDynamic,
      schemaId: LoadingAlertSchema.id,
    );
    _schemas[LoadingAlertSchema.id] = LoadingAlertSchema.schema;
  }

  void withPrimaryButton() {
    _builders[PrimaryButtonBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: PrimaryButtonBuilder.fromDynamic,
      schemaId: PrimaryButtonSchema.id,
    );
    _schemas[PrimaryButtonSchema.id] = PrimaryButtonSchema.schema;
  }

  void withSvg() {
    _builders[SvgBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: SvgBuilder.fromDynamic,
      schemaId: SvgSchema.id,
    );
    _schemas[SvgSchema.id] = SvgSchema.schema;
  }
}
