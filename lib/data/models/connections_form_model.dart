import "dart:typed_data";

import "package:propinquity/data/datasources/local/drift_database.dart";

const _noValue = Object();

class ConnectionsFormModel {
  ConnectionsFormModel(
      {this.connectionsId,
      this.image,
      this.connectionsName,
      this.contactFrequency,
      this.connectionsRelation,
      this.fields});

  final int? connectionsId;
  late final Uint8List? image;
  final String? connectionsName;
  final String? contactFrequency;
  final String? connectionsRelation;
  late final List<ConnectionsFieldsTableData>? fields;

  ConnectionsFormModel copyWith({
    int? connectionsId,
    Object? image = _noValue,
    String? connectionsName,
    String? contactFrequency,
    String? connectionsRelation,
    List<ConnectionsFieldsTableData>? fields,
  }) {
    return ConnectionsFormModel(
      connectionsId: connectionsId ?? this.connectionsId,
      image: identical(image, _noValue) ? this.image : image as Uint8List?,
      connectionsName: connectionsName ?? this.connectionsName,
      contactFrequency: contactFrequency ?? this.contactFrequency,
      connectionsRelation: connectionsRelation ?? this.connectionsRelation,
      fields: fields ?? this.fields,
    );
  }
}
