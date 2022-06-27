class ClientSetupModel {
  late String catalogueVersion;
  late String entryId;
  late String reverseLists;

  ClientSetupModel({
    required this.catalogueVersion,
    required this.entryId,
    required this.reverseLists,
  });

  ClientSetupModel.fromMap(Map<String, dynamic> map) {
    catalogueVersion = map["catalogue_version"];
    entryId = map["entry_id"];
    reverseLists = map["reverse_lists"];
  }
}
