import "dart:typed_data";

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/data/models/connections_form_model.dart";

final formController =
    NotifierProvider<ConnectionsFormController, ConnectionsFormModel>(
        () => ConnectionsFormController());

class ConnectionsFormController extends Notifier<ConnectionsFormModel> {
  @override
  ConnectionsFormModel build() {
    return ConnectionsFormModel();
  }

  set connectionsName(String name) =>
      state = state.copyWith(connectionsName: name);

  set connectionsFrequency(String freq) =>
      state = state.copyWith(contactFrequency: freq);

  set connectionsRelation(String relation) =>
      state = state.copyWith(connectionsRelation: relation);

  set connectionsFields(List<ConnectionsFieldsTableData> fields) =>
      state = state.copyWith(fields: fields);

  set image(Uint8List? bytes) => state = state.copyWith(image: bytes);

  set connectionsId(int id) => state = state.copyWith(connectionsId: id);

  void update(ConnectionsFormModel Function(ConnectionsFormModel) form) {
    state = form(state);
  }

  void appendField(ConnectionsFieldsTableData field) {
    final List<ConnectionsFieldsTableData>? tmpFields = state.fields;
    if (tmpFields == null) {
      state = state.copyWith(fields: <ConnectionsFieldsTableData>[field]);
    } else {
      tmpFields.add(field);
      state = state.copyWith(fields: <ConnectionsFieldsTableData>[field]);
    }
  }

  void deleteField(int index) {
    final List<ConnectionsFieldsTableData>? tmpFields = state.fields;
    if (tmpFields != null) {
      tmpFields.removeAt(index);
      state = state.copyWith(fields: tmpFields);
    }
  }

  Future<void> submit() async {
    // TODO Implement
    await Future.delayed(const Duration(seconds: 2));
  }
}
