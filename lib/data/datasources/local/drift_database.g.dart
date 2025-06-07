// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $ConnectionsTableTable extends ConnectionsTable
    with TableInfo<$ConnectionsTableTable, ConnectionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConnectionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _connectionsIdMeta =
      const VerificationMeta('connectionsId');
  @override
  late final GeneratedColumn<int> connectionsId = GeneratedColumn<int>(
      'connections_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _connectionsNameMeta =
      const VerificationMeta('connectionsName');
  @override
  late final GeneratedColumn<String> connectionsName = GeneratedColumn<String>(
      'connections_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactFrequencyMeta =
      const VerificationMeta('contactFrequency');
  @override
  late final GeneratedColumn<String> contactFrequency = GeneratedColumn<String>(
      'contact_frequency', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _connectionsRelationMeta =
      const VerificationMeta('connectionsRelation');
  @override
  late final GeneratedColumn<String> connectionsRelation =
      GeneratedColumn<String>('connections_relation', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<Uint8List> image = GeneratedColumn<Uint8List>(
      'image', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _streakMeta = const VerificationMeta('streak');
  @override
  late final GeneratedColumn<int> streak = GeneratedColumn<int>(
      'streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      clientDefault: () => 1);
  static const VerificationMeta _calculatedScoreMeta =
      const VerificationMeta('calculatedScore');
  @override
  late final GeneratedColumn<int> calculatedScore = GeneratedColumn<int>(
      'calculated_score', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _checkInMeta =
      const VerificationMeta('checkIn');
  @override
  late final GeneratedColumn<bool> checkIn = GeneratedColumn<bool>(
      'check_in', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("check_in" IN (0, 1))'),
      defaultValue: false as Expression<bool>);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        connectionsId,
        connectionsName,
        contactFrequency,
        connectionsRelation,
        image,
        streak,
        calculatedScore,
        checkIn,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'connections_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ConnectionsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('connections_id')) {
      context.handle(
          _connectionsIdMeta,
          connectionsId.isAcceptableOrUnknown(
              data['connections_id']!, _connectionsIdMeta));
    }
    if (data.containsKey('connections_name')) {
      context.handle(
          _connectionsNameMeta,
          connectionsName.isAcceptableOrUnknown(
              data['connections_name']!, _connectionsNameMeta));
    } else if (isInserting) {
      context.missing(_connectionsNameMeta);
    }
    if (data.containsKey('contact_frequency')) {
      context.handle(
          _contactFrequencyMeta,
          contactFrequency.isAcceptableOrUnknown(
              data['contact_frequency']!, _contactFrequencyMeta));
    } else if (isInserting) {
      context.missing(_contactFrequencyMeta);
    }
    if (data.containsKey('connections_relation')) {
      context.handle(
          _connectionsRelationMeta,
          connectionsRelation.isAcceptableOrUnknown(
              data['connections_relation']!, _connectionsRelationMeta));
    } else if (isInserting) {
      context.missing(_connectionsRelationMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('streak')) {
      context.handle(_streakMeta,
          streak.isAcceptableOrUnknown(data['streak']!, _streakMeta));
    }
    if (data.containsKey('calculated_score')) {
      context.handle(
          _calculatedScoreMeta,
          calculatedScore.isAcceptableOrUnknown(
              data['calculated_score']!, _calculatedScoreMeta));
    }
    if (data.containsKey('check_in')) {
      context.handle(_checkInMeta,
          checkIn.isAcceptableOrUnknown(data['check_in']!, _checkInMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {connectionsId};
  @override
  ConnectionsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConnectionsTableData(
      connectionsId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}connections_id'])!,
      connectionsName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}connections_name'])!,
      contactFrequency: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}contact_frequency'])!,
      connectionsRelation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}connections_relation'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image']),
      streak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}streak'])!,
      calculatedScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}calculated_score']),
      checkIn: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}check_in'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ConnectionsTableTable createAlias(String alias) {
    return $ConnectionsTableTable(attachedDatabase, alias);
  }
}

class ConnectionsTableData extends DataClass
    implements Insertable<ConnectionsTableData> {
  final int connectionsId;
  final String connectionsName;
  final String contactFrequency;
  final String connectionsRelation;
  final Uint8List? image;
  final int streak;
  final int? calculatedScore;
  final bool checkIn;
  final DateTime? deletedAt;
  const ConnectionsTableData(
      {required this.connectionsId,
      required this.connectionsName,
      required this.contactFrequency,
      required this.connectionsRelation,
      this.image,
      required this.streak,
      this.calculatedScore,
      required this.checkIn,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['connections_id'] = Variable<int>(connectionsId);
    map['connections_name'] = Variable<String>(connectionsName);
    map['contact_frequency'] = Variable<String>(contactFrequency);
    map['connections_relation'] = Variable<String>(connectionsRelation);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<Uint8List>(image);
    }
    map['streak'] = Variable<int>(streak);
    if (!nullToAbsent || calculatedScore != null) {
      map['calculated_score'] = Variable<int>(calculatedScore);
    }
    map['check_in'] = Variable<bool>(checkIn);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ConnectionsTableCompanion toCompanion(bool nullToAbsent) {
    return ConnectionsTableCompanion(
      connectionsId: Value(connectionsId),
      connectionsName: Value(connectionsName),
      contactFrequency: Value(contactFrequency),
      connectionsRelation: Value(connectionsRelation),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      streak: Value(streak),
      calculatedScore: calculatedScore == null && nullToAbsent
          ? const Value.absent()
          : Value(calculatedScore),
      checkIn: Value(checkIn),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ConnectionsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConnectionsTableData(
      connectionsId: serializer.fromJson<int>(json['connectionsId']),
      connectionsName: serializer.fromJson<String>(json['connectionsName']),
      contactFrequency: serializer.fromJson<String>(json['contactFrequency']),
      connectionsRelation:
          serializer.fromJson<String>(json['connectionsRelation']),
      image: serializer.fromJson<Uint8List?>(json['image']),
      streak: serializer.fromJson<int>(json['streak']),
      calculatedScore: serializer.fromJson<int?>(json['calculatedScore']),
      checkIn: serializer.fromJson<bool>(json['checkIn']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'connectionsId': serializer.toJson<int>(connectionsId),
      'connectionsName': serializer.toJson<String>(connectionsName),
      'contactFrequency': serializer.toJson<String>(contactFrequency),
      'connectionsRelation': serializer.toJson<String>(connectionsRelation),
      'image': serializer.toJson<Uint8List?>(image),
      'streak': serializer.toJson<int>(streak),
      'calculatedScore': serializer.toJson<int?>(calculatedScore),
      'checkIn': serializer.toJson<bool>(checkIn),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ConnectionsTableData copyWith(
          {int? connectionsId,
          String? connectionsName,
          String? contactFrequency,
          String? connectionsRelation,
          Value<Uint8List?> image = const Value.absent(),
          int? streak,
          Value<int?> calculatedScore = const Value.absent(),
          bool? checkIn,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ConnectionsTableData(
        connectionsId: connectionsId ?? this.connectionsId,
        connectionsName: connectionsName ?? this.connectionsName,
        contactFrequency: contactFrequency ?? this.contactFrequency,
        connectionsRelation: connectionsRelation ?? this.connectionsRelation,
        image: image.present ? image.value : this.image,
        streak: streak ?? this.streak,
        calculatedScore: calculatedScore.present
            ? calculatedScore.value
            : this.calculatedScore,
        checkIn: checkIn ?? this.checkIn,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  ConnectionsTableData copyWithCompanion(ConnectionsTableCompanion data) {
    return ConnectionsTableData(
      connectionsId: data.connectionsId.present
          ? data.connectionsId.value
          : this.connectionsId,
      connectionsName: data.connectionsName.present
          ? data.connectionsName.value
          : this.connectionsName,
      contactFrequency: data.contactFrequency.present
          ? data.contactFrequency.value
          : this.contactFrequency,
      connectionsRelation: data.connectionsRelation.present
          ? data.connectionsRelation.value
          : this.connectionsRelation,
      image: data.image.present ? data.image.value : this.image,
      streak: data.streak.present ? data.streak.value : this.streak,
      calculatedScore: data.calculatedScore.present
          ? data.calculatedScore.value
          : this.calculatedScore,
      checkIn: data.checkIn.present ? data.checkIn.value : this.checkIn,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionsTableData(')
          ..write('connectionsId: $connectionsId, ')
          ..write('connectionsName: $connectionsName, ')
          ..write('contactFrequency: $contactFrequency, ')
          ..write('connectionsRelation: $connectionsRelation, ')
          ..write('image: $image, ')
          ..write('streak: $streak, ')
          ..write('calculatedScore: $calculatedScore, ')
          ..write('checkIn: $checkIn, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      connectionsId,
      connectionsName,
      contactFrequency,
      connectionsRelation,
      $driftBlobEquality.hash(image),
      streak,
      calculatedScore,
      checkIn,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConnectionsTableData &&
          other.connectionsId == this.connectionsId &&
          other.connectionsName == this.connectionsName &&
          other.contactFrequency == this.contactFrequency &&
          other.connectionsRelation == this.connectionsRelation &&
          $driftBlobEquality.equals(other.image, this.image) &&
          other.streak == this.streak &&
          other.calculatedScore == this.calculatedScore &&
          other.checkIn == this.checkIn &&
          other.deletedAt == this.deletedAt);
}

class ConnectionsTableCompanion extends UpdateCompanion<ConnectionsTableData> {
  final Value<int> connectionsId;
  final Value<String> connectionsName;
  final Value<String> contactFrequency;
  final Value<String> connectionsRelation;
  final Value<Uint8List?> image;
  final Value<int> streak;
  final Value<int?> calculatedScore;
  final Value<bool> checkIn;
  final Value<DateTime?> deletedAt;
  const ConnectionsTableCompanion({
    this.connectionsId = const Value.absent(),
    this.connectionsName = const Value.absent(),
    this.contactFrequency = const Value.absent(),
    this.connectionsRelation = const Value.absent(),
    this.image = const Value.absent(),
    this.streak = const Value.absent(),
    this.calculatedScore = const Value.absent(),
    this.checkIn = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  ConnectionsTableCompanion.insert({
    this.connectionsId = const Value.absent(),
    required String connectionsName,
    required String contactFrequency,
    required String connectionsRelation,
    this.image = const Value.absent(),
    this.streak = const Value.absent(),
    this.calculatedScore = const Value.absent(),
    this.checkIn = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : connectionsName = Value(connectionsName),
        contactFrequency = Value(contactFrequency),
        connectionsRelation = Value(connectionsRelation);
  static Insertable<ConnectionsTableData> custom({
    Expression<int>? connectionsId,
    Expression<String>? connectionsName,
    Expression<String>? contactFrequency,
    Expression<String>? connectionsRelation,
    Expression<Uint8List>? image,
    Expression<int>? streak,
    Expression<int>? calculatedScore,
    Expression<bool>? checkIn,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (connectionsId != null) 'connections_id': connectionsId,
      if (connectionsName != null) 'connections_name': connectionsName,
      if (contactFrequency != null) 'contact_frequency': contactFrequency,
      if (connectionsRelation != null)
        'connections_relation': connectionsRelation,
      if (image != null) 'image': image,
      if (streak != null) 'streak': streak,
      if (calculatedScore != null) 'calculated_score': calculatedScore,
      if (checkIn != null) 'check_in': checkIn,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  ConnectionsTableCompanion copyWith(
      {Value<int>? connectionsId,
      Value<String>? connectionsName,
      Value<String>? contactFrequency,
      Value<String>? connectionsRelation,
      Value<Uint8List?>? image,
      Value<int>? streak,
      Value<int?>? calculatedScore,
      Value<bool>? checkIn,
      Value<DateTime?>? deletedAt}) {
    return ConnectionsTableCompanion(
      connectionsId: connectionsId ?? this.connectionsId,
      connectionsName: connectionsName ?? this.connectionsName,
      contactFrequency: contactFrequency ?? this.contactFrequency,
      connectionsRelation: connectionsRelation ?? this.connectionsRelation,
      image: image ?? this.image,
      streak: streak ?? this.streak,
      calculatedScore: calculatedScore ?? this.calculatedScore,
      checkIn: checkIn ?? this.checkIn,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (connectionsId.present) {
      map['connections_id'] = Variable<int>(connectionsId.value);
    }
    if (connectionsName.present) {
      map['connections_name'] = Variable<String>(connectionsName.value);
    }
    if (contactFrequency.present) {
      map['contact_frequency'] = Variable<String>(contactFrequency.value);
    }
    if (connectionsRelation.present) {
      map['connections_relation'] = Variable<String>(connectionsRelation.value);
    }
    if (image.present) {
      map['image'] = Variable<Uint8List>(image.value);
    }
    if (streak.present) {
      map['streak'] = Variable<int>(streak.value);
    }
    if (calculatedScore.present) {
      map['calculated_score'] = Variable<int>(calculatedScore.value);
    }
    if (checkIn.present) {
      map['check_in'] = Variable<bool>(checkIn.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionsTableCompanion(')
          ..write('connectionsId: $connectionsId, ')
          ..write('connectionsName: $connectionsName, ')
          ..write('contactFrequency: $contactFrequency, ')
          ..write('connectionsRelation: $connectionsRelation, ')
          ..write('image: $image, ')
          ..write('streak: $streak, ')
          ..write('calculatedScore: $calculatedScore, ')
          ..write('checkIn: $checkIn, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $DatesTableTable extends DatesTable
    with TableInfo<$DatesTableTable, DatesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DatesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(
      'uid', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _connectionsIdMeta =
      const VerificationMeta('connectionsId');
  @override
  late final GeneratedColumn<int> connectionsId = GeneratedColumn<int>(
      'connections_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES connections_table (connections_id) ON DELETE CASCADE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastModifiedMeta =
      const VerificationMeta('lastModified');
  @override
  late final GeneratedColumn<DateTime> lastModified = GeneratedColumn<DateTime>(
      'last_modified', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dtstartMeta =
      const VerificationMeta('dtstart');
  @override
  late final GeneratedColumn<DateTime> dtstart = GeneratedColumn<DateTime>(
      'dtstart', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dtendMeta = const VerificationMeta('dtend');
  @override
  late final GeneratedColumn<DateTime> dtend = GeneratedColumn<DateTime>(
      'dtend', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dtstampMeta =
      const VerificationMeta('dtstamp');
  @override
  late final GeneratedColumn<DateTime> dtstamp = GeneratedColumn<DateTime>(
      'dtstamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _rruleMeta = const VerificationMeta('rrule');
  @override
  late final GeneratedColumn<String> rrule = GeneratedColumn<String>(
      'rrule', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sequenceMeta =
      const VerificationMeta('sequence');
  @override
  late final GeneratedColumn<int> sequence = GeneratedColumn<int>(
      'sequence', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timezoneMeta =
      const VerificationMeta('timezone');
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
      'timezone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        uid,
        connectionsId,
        title,
        created,
        lastModified,
        dtstart,
        dtend,
        dtstamp,
        rrule,
        sequence,
        timezone,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dates_table';
  @override
  VerificationContext validateIntegrity(Insertable<DatesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    }
    if (data.containsKey('connections_id')) {
      context.handle(
          _connectionsIdMeta,
          connectionsId.isAcceptableOrUnknown(
              data['connections_id']!, _connectionsIdMeta));
    } else if (isInserting) {
      context.missing(_connectionsIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('last_modified')) {
      context.handle(
          _lastModifiedMeta,
          lastModified.isAcceptableOrUnknown(
              data['last_modified']!, _lastModifiedMeta));
    } else if (isInserting) {
      context.missing(_lastModifiedMeta);
    }
    if (data.containsKey('dtstart')) {
      context.handle(_dtstartMeta,
          dtstart.isAcceptableOrUnknown(data['dtstart']!, _dtstartMeta));
    } else if (isInserting) {
      context.missing(_dtstartMeta);
    }
    if (data.containsKey('dtend')) {
      context.handle(
          _dtendMeta, dtend.isAcceptableOrUnknown(data['dtend']!, _dtendMeta));
    } else if (isInserting) {
      context.missing(_dtendMeta);
    }
    if (data.containsKey('dtstamp')) {
      context.handle(_dtstampMeta,
          dtstamp.isAcceptableOrUnknown(data['dtstamp']!, _dtstampMeta));
    } else if (isInserting) {
      context.missing(_dtstampMeta);
    }
    if (data.containsKey('rrule')) {
      context.handle(
          _rruleMeta, rrule.isAcceptableOrUnknown(data['rrule']!, _rruleMeta));
    }
    if (data.containsKey('sequence')) {
      context.handle(_sequenceMeta,
          sequence.isAcceptableOrUnknown(data['sequence']!, _sequenceMeta));
    } else if (isInserting) {
      context.missing(_sequenceMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(_timezoneMeta,
          timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  DatesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DatesTableData(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}uid'])!,
      connectionsId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}connections_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      lastModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_modified'])!,
      dtstart: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dtstart'])!,
      dtend: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dtend'])!,
      dtstamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dtstamp'])!,
      rrule: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rrule']),
      sequence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sequence'])!,
      timezone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}timezone']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $DatesTableTable createAlias(String alias) {
    return $DatesTableTable(attachedDatabase, alias);
  }
}

class DatesTableData extends DataClass implements Insertable<DatesTableData> {
  final int uid;
  final int connectionsId;
  final String title;
  final DateTime created;
  final DateTime lastModified;
  final DateTime dtstart;
  final DateTime dtend;
  final DateTime dtstamp;
  final String? rrule;
  final int sequence;
  final String? timezone;
  final DateTime? deletedAt;
  const DatesTableData(
      {required this.uid,
      required this.connectionsId,
      required this.title,
      required this.created,
      required this.lastModified,
      required this.dtstart,
      required this.dtend,
      required this.dtstamp,
      this.rrule,
      required this.sequence,
      this.timezone,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<int>(uid);
    map['connections_id'] = Variable<int>(connectionsId);
    map['title'] = Variable<String>(title);
    map['created'] = Variable<DateTime>(created);
    map['last_modified'] = Variable<DateTime>(lastModified);
    map['dtstart'] = Variable<DateTime>(dtstart);
    map['dtend'] = Variable<DateTime>(dtend);
    map['dtstamp'] = Variable<DateTime>(dtstamp);
    if (!nullToAbsent || rrule != null) {
      map['rrule'] = Variable<String>(rrule);
    }
    map['sequence'] = Variable<int>(sequence);
    if (!nullToAbsent || timezone != null) {
      map['timezone'] = Variable<String>(timezone);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  DatesTableCompanion toCompanion(bool nullToAbsent) {
    return DatesTableCompanion(
      uid: Value(uid),
      connectionsId: Value(connectionsId),
      title: Value(title),
      created: Value(created),
      lastModified: Value(lastModified),
      dtstart: Value(dtstart),
      dtend: Value(dtend),
      dtstamp: Value(dtstamp),
      rrule:
          rrule == null && nullToAbsent ? const Value.absent() : Value(rrule),
      sequence: Value(sequence),
      timezone: timezone == null && nullToAbsent
          ? const Value.absent()
          : Value(timezone),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory DatesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DatesTableData(
      uid: serializer.fromJson<int>(json['uid']),
      connectionsId: serializer.fromJson<int>(json['connectionsId']),
      title: serializer.fromJson<String>(json['title']),
      created: serializer.fromJson<DateTime>(json['created']),
      lastModified: serializer.fromJson<DateTime>(json['lastModified']),
      dtstart: serializer.fromJson<DateTime>(json['dtstart']),
      dtend: serializer.fromJson<DateTime>(json['dtend']),
      dtstamp: serializer.fromJson<DateTime>(json['dtstamp']),
      rrule: serializer.fromJson<String?>(json['rrule']),
      sequence: serializer.fromJson<int>(json['sequence']),
      timezone: serializer.fromJson<String?>(json['timezone']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<int>(uid),
      'connectionsId': serializer.toJson<int>(connectionsId),
      'title': serializer.toJson<String>(title),
      'created': serializer.toJson<DateTime>(created),
      'lastModified': serializer.toJson<DateTime>(lastModified),
      'dtstart': serializer.toJson<DateTime>(dtstart),
      'dtend': serializer.toJson<DateTime>(dtend),
      'dtstamp': serializer.toJson<DateTime>(dtstamp),
      'rrule': serializer.toJson<String?>(rrule),
      'sequence': serializer.toJson<int>(sequence),
      'timezone': serializer.toJson<String?>(timezone),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  DatesTableData copyWith(
          {int? uid,
          int? connectionsId,
          String? title,
          DateTime? created,
          DateTime? lastModified,
          DateTime? dtstart,
          DateTime? dtend,
          DateTime? dtstamp,
          Value<String?> rrule = const Value.absent(),
          int? sequence,
          Value<String?> timezone = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      DatesTableData(
        uid: uid ?? this.uid,
        connectionsId: connectionsId ?? this.connectionsId,
        title: title ?? this.title,
        created: created ?? this.created,
        lastModified: lastModified ?? this.lastModified,
        dtstart: dtstart ?? this.dtstart,
        dtend: dtend ?? this.dtend,
        dtstamp: dtstamp ?? this.dtstamp,
        rrule: rrule.present ? rrule.value : this.rrule,
        sequence: sequence ?? this.sequence,
        timezone: timezone.present ? timezone.value : this.timezone,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  DatesTableData copyWithCompanion(DatesTableCompanion data) {
    return DatesTableData(
      uid: data.uid.present ? data.uid.value : this.uid,
      connectionsId: data.connectionsId.present
          ? data.connectionsId.value
          : this.connectionsId,
      title: data.title.present ? data.title.value : this.title,
      created: data.created.present ? data.created.value : this.created,
      lastModified: data.lastModified.present
          ? data.lastModified.value
          : this.lastModified,
      dtstart: data.dtstart.present ? data.dtstart.value : this.dtstart,
      dtend: data.dtend.present ? data.dtend.value : this.dtend,
      dtstamp: data.dtstamp.present ? data.dtstamp.value : this.dtstamp,
      rrule: data.rrule.present ? data.rrule.value : this.rrule,
      sequence: data.sequence.present ? data.sequence.value : this.sequence,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DatesTableData(')
          ..write('uid: $uid, ')
          ..write('connectionsId: $connectionsId, ')
          ..write('title: $title, ')
          ..write('created: $created, ')
          ..write('lastModified: $lastModified, ')
          ..write('dtstart: $dtstart, ')
          ..write('dtend: $dtend, ')
          ..write('dtstamp: $dtstamp, ')
          ..write('rrule: $rrule, ')
          ..write('sequence: $sequence, ')
          ..write('timezone: $timezone, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uid,
      connectionsId,
      title,
      created,
      lastModified,
      dtstart,
      dtend,
      dtstamp,
      rrule,
      sequence,
      timezone,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DatesTableData &&
          other.uid == this.uid &&
          other.connectionsId == this.connectionsId &&
          other.title == this.title &&
          other.created == this.created &&
          other.lastModified == this.lastModified &&
          other.dtstart == this.dtstart &&
          other.dtend == this.dtend &&
          other.dtstamp == this.dtstamp &&
          other.rrule == this.rrule &&
          other.sequence == this.sequence &&
          other.timezone == this.timezone &&
          other.deletedAt == this.deletedAt);
}

class DatesTableCompanion extends UpdateCompanion<DatesTableData> {
  final Value<int> uid;
  final Value<int> connectionsId;
  final Value<String> title;
  final Value<DateTime> created;
  final Value<DateTime> lastModified;
  final Value<DateTime> dtstart;
  final Value<DateTime> dtend;
  final Value<DateTime> dtstamp;
  final Value<String?> rrule;
  final Value<int> sequence;
  final Value<String?> timezone;
  final Value<DateTime?> deletedAt;
  const DatesTableCompanion({
    this.uid = const Value.absent(),
    this.connectionsId = const Value.absent(),
    this.title = const Value.absent(),
    this.created = const Value.absent(),
    this.lastModified = const Value.absent(),
    this.dtstart = const Value.absent(),
    this.dtend = const Value.absent(),
    this.dtstamp = const Value.absent(),
    this.rrule = const Value.absent(),
    this.sequence = const Value.absent(),
    this.timezone = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  DatesTableCompanion.insert({
    this.uid = const Value.absent(),
    required int connectionsId,
    required String title,
    required DateTime created,
    required DateTime lastModified,
    required DateTime dtstart,
    required DateTime dtend,
    required DateTime dtstamp,
    this.rrule = const Value.absent(),
    required int sequence,
    this.timezone = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : connectionsId = Value(connectionsId),
        title = Value(title),
        created = Value(created),
        lastModified = Value(lastModified),
        dtstart = Value(dtstart),
        dtend = Value(dtend),
        dtstamp = Value(dtstamp),
        sequence = Value(sequence);
  static Insertable<DatesTableData> custom({
    Expression<int>? uid,
    Expression<int>? connectionsId,
    Expression<String>? title,
    Expression<DateTime>? created,
    Expression<DateTime>? lastModified,
    Expression<DateTime>? dtstart,
    Expression<DateTime>? dtend,
    Expression<DateTime>? dtstamp,
    Expression<String>? rrule,
    Expression<int>? sequence,
    Expression<String>? timezone,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (connectionsId != null) 'connections_id': connectionsId,
      if (title != null) 'title': title,
      if (created != null) 'created': created,
      if (lastModified != null) 'last_modified': lastModified,
      if (dtstart != null) 'dtstart': dtstart,
      if (dtend != null) 'dtend': dtend,
      if (dtstamp != null) 'dtstamp': dtstamp,
      if (rrule != null) 'rrule': rrule,
      if (sequence != null) 'sequence': sequence,
      if (timezone != null) 'timezone': timezone,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  DatesTableCompanion copyWith(
      {Value<int>? uid,
      Value<int>? connectionsId,
      Value<String>? title,
      Value<DateTime>? created,
      Value<DateTime>? lastModified,
      Value<DateTime>? dtstart,
      Value<DateTime>? dtend,
      Value<DateTime>? dtstamp,
      Value<String?>? rrule,
      Value<int>? sequence,
      Value<String?>? timezone,
      Value<DateTime?>? deletedAt}) {
    return DatesTableCompanion(
      uid: uid ?? this.uid,
      connectionsId: connectionsId ?? this.connectionsId,
      title: title ?? this.title,
      created: created ?? this.created,
      lastModified: lastModified ?? this.lastModified,
      dtstart: dtstart ?? this.dtstart,
      dtend: dtend ?? this.dtend,
      dtstamp: dtstamp ?? this.dtstamp,
      rrule: rrule ?? this.rrule,
      sequence: sequence ?? this.sequence,
      timezone: timezone ?? this.timezone,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<int>(uid.value);
    }
    if (connectionsId.present) {
      map['connections_id'] = Variable<int>(connectionsId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (lastModified.present) {
      map['last_modified'] = Variable<DateTime>(lastModified.value);
    }
    if (dtstart.present) {
      map['dtstart'] = Variable<DateTime>(dtstart.value);
    }
    if (dtend.present) {
      map['dtend'] = Variable<DateTime>(dtend.value);
    }
    if (dtstamp.present) {
      map['dtstamp'] = Variable<DateTime>(dtstamp.value);
    }
    if (rrule.present) {
      map['rrule'] = Variable<String>(rrule.value);
    }
    if (sequence.present) {
      map['sequence'] = Variable<int>(sequence.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DatesTableCompanion(')
          ..write('uid: $uid, ')
          ..write('connectionsId: $connectionsId, ')
          ..write('title: $title, ')
          ..write('created: $created, ')
          ..write('lastModified: $lastModified, ')
          ..write('dtstart: $dtstart, ')
          ..write('dtend: $dtend, ')
          ..write('dtstamp: $dtstamp, ')
          ..write('rrule: $rrule, ')
          ..write('sequence: $sequence, ')
          ..write('timezone: $timezone, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $ConnectionsFieldsTableTable extends ConnectionsFieldsTable
    with TableInfo<$ConnectionsFieldsTableTable, ConnectionsFieldsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConnectionsFieldsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _fieldIdMeta =
      const VerificationMeta('fieldId');
  @override
  late final GeneratedColumn<int> fieldId = GeneratedColumn<int>(
      'field_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _connectionsIdMeta =
      const VerificationMeta('connectionsId');
  @override
  late final GeneratedColumn<int> connectionsId = GeneratedColumn<int>(
      'connections_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fieldTypeMeta =
      const VerificationMeta('fieldType');
  @override
  late final GeneratedColumn<String> fieldType = GeneratedColumn<String>(
      'field_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fieldValueMeta =
      const VerificationMeta('fieldValue');
  @override
  late final GeneratedColumn<String> fieldValue = GeneratedColumn<String>(
      'field_value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _fieldOrderMeta =
      const VerificationMeta('fieldOrder');
  @override
  late final GeneratedColumn<int> fieldOrder = GeneratedColumn<int>(
      'field_order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [fieldId, connectionsId, fieldType, fieldValue, deletedAt, fieldOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'connections_fields_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ConnectionsFieldsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('field_id')) {
      context.handle(_fieldIdMeta,
          fieldId.isAcceptableOrUnknown(data['field_id']!, _fieldIdMeta));
    }
    if (data.containsKey('connections_id')) {
      context.handle(
          _connectionsIdMeta,
          connectionsId.isAcceptableOrUnknown(
              data['connections_id']!, _connectionsIdMeta));
    } else if (isInserting) {
      context.missing(_connectionsIdMeta);
    }
    if (data.containsKey('field_type')) {
      context.handle(_fieldTypeMeta,
          fieldType.isAcceptableOrUnknown(data['field_type']!, _fieldTypeMeta));
    } else if (isInserting) {
      context.missing(_fieldTypeMeta);
    }
    if (data.containsKey('field_value')) {
      context.handle(
          _fieldValueMeta,
          fieldValue.isAcceptableOrUnknown(
              data['field_value']!, _fieldValueMeta));
    } else if (isInserting) {
      context.missing(_fieldValueMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('field_order')) {
      context.handle(
          _fieldOrderMeta,
          fieldOrder.isAcceptableOrUnknown(
              data['field_order']!, _fieldOrderMeta));
    } else if (isInserting) {
      context.missing(_fieldOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {fieldId};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {connectionsId, fieldOrder},
      ];
  @override
  ConnectionsFieldsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConnectionsFieldsTableData(
      fieldId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}field_id'])!,
      connectionsId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}connections_id'])!,
      fieldType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}field_type'])!,
      fieldValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}field_value'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      fieldOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}field_order'])!,
    );
  }

  @override
  $ConnectionsFieldsTableTable createAlias(String alias) {
    return $ConnectionsFieldsTableTable(attachedDatabase, alias);
  }
}

class ConnectionsFieldsTableData extends DataClass
    implements Insertable<ConnectionsFieldsTableData> {
  final int fieldId;
  final int connectionsId;
  final String fieldType;
  final String fieldValue;
  final DateTime? deletedAt;
  final int fieldOrder;
  const ConnectionsFieldsTableData(
      {required this.fieldId,
      required this.connectionsId,
      required this.fieldType,
      required this.fieldValue,
      this.deletedAt,
      required this.fieldOrder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['field_id'] = Variable<int>(fieldId);
    map['connections_id'] = Variable<int>(connectionsId);
    map['field_type'] = Variable<String>(fieldType);
    map['field_value'] = Variable<String>(fieldValue);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['field_order'] = Variable<int>(fieldOrder);
    return map;
  }

  ConnectionsFieldsTableCompanion toCompanion(bool nullToAbsent) {
    return ConnectionsFieldsTableCompanion(
      fieldId: Value(fieldId),
      connectionsId: Value(connectionsId),
      fieldType: Value(fieldType),
      fieldValue: Value(fieldValue),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      fieldOrder: Value(fieldOrder),
    );
  }

  factory ConnectionsFieldsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConnectionsFieldsTableData(
      fieldId: serializer.fromJson<int>(json['fieldId']),
      connectionsId: serializer.fromJson<int>(json['connectionsId']),
      fieldType: serializer.fromJson<String>(json['fieldType']),
      fieldValue: serializer.fromJson<String>(json['fieldValue']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      fieldOrder: serializer.fromJson<int>(json['fieldOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'fieldId': serializer.toJson<int>(fieldId),
      'connectionsId': serializer.toJson<int>(connectionsId),
      'fieldType': serializer.toJson<String>(fieldType),
      'fieldValue': serializer.toJson<String>(fieldValue),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'fieldOrder': serializer.toJson<int>(fieldOrder),
    };
  }

  ConnectionsFieldsTableData copyWith(
          {int? fieldId,
          int? connectionsId,
          String? fieldType,
          String? fieldValue,
          Value<DateTime?> deletedAt = const Value.absent(),
          int? fieldOrder}) =>
      ConnectionsFieldsTableData(
        fieldId: fieldId ?? this.fieldId,
        connectionsId: connectionsId ?? this.connectionsId,
        fieldType: fieldType ?? this.fieldType,
        fieldValue: fieldValue ?? this.fieldValue,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        fieldOrder: fieldOrder ?? this.fieldOrder,
      );
  ConnectionsFieldsTableData copyWithCompanion(
      ConnectionsFieldsTableCompanion data) {
    return ConnectionsFieldsTableData(
      fieldId: data.fieldId.present ? data.fieldId.value : this.fieldId,
      connectionsId: data.connectionsId.present
          ? data.connectionsId.value
          : this.connectionsId,
      fieldType: data.fieldType.present ? data.fieldType.value : this.fieldType,
      fieldValue:
          data.fieldValue.present ? data.fieldValue.value : this.fieldValue,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      fieldOrder:
          data.fieldOrder.present ? data.fieldOrder.value : this.fieldOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionsFieldsTableData(')
          ..write('fieldId: $fieldId, ')
          ..write('connectionsId: $connectionsId, ')
          ..write('fieldType: $fieldType, ')
          ..write('fieldValue: $fieldValue, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('fieldOrder: $fieldOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      fieldId, connectionsId, fieldType, fieldValue, deletedAt, fieldOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConnectionsFieldsTableData &&
          other.fieldId == this.fieldId &&
          other.connectionsId == this.connectionsId &&
          other.fieldType == this.fieldType &&
          other.fieldValue == this.fieldValue &&
          other.deletedAt == this.deletedAt &&
          other.fieldOrder == this.fieldOrder);
}

class ConnectionsFieldsTableCompanion
    extends UpdateCompanion<ConnectionsFieldsTableData> {
  final Value<int> fieldId;
  final Value<int> connectionsId;
  final Value<String> fieldType;
  final Value<String> fieldValue;
  final Value<DateTime?> deletedAt;
  final Value<int> fieldOrder;
  const ConnectionsFieldsTableCompanion({
    this.fieldId = const Value.absent(),
    this.connectionsId = const Value.absent(),
    this.fieldType = const Value.absent(),
    this.fieldValue = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.fieldOrder = const Value.absent(),
  });
  ConnectionsFieldsTableCompanion.insert({
    this.fieldId = const Value.absent(),
    required int connectionsId,
    required String fieldType,
    required String fieldValue,
    this.deletedAt = const Value.absent(),
    required int fieldOrder,
  })  : connectionsId = Value(connectionsId),
        fieldType = Value(fieldType),
        fieldValue = Value(fieldValue),
        fieldOrder = Value(fieldOrder);
  static Insertable<ConnectionsFieldsTableData> custom({
    Expression<int>? fieldId,
    Expression<int>? connectionsId,
    Expression<String>? fieldType,
    Expression<String>? fieldValue,
    Expression<DateTime>? deletedAt,
    Expression<int>? fieldOrder,
  }) {
    return RawValuesInsertable({
      if (fieldId != null) 'field_id': fieldId,
      if (connectionsId != null) 'connections_id': connectionsId,
      if (fieldType != null) 'field_type': fieldType,
      if (fieldValue != null) 'field_value': fieldValue,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (fieldOrder != null) 'field_order': fieldOrder,
    });
  }

  ConnectionsFieldsTableCompanion copyWith(
      {Value<int>? fieldId,
      Value<int>? connectionsId,
      Value<String>? fieldType,
      Value<String>? fieldValue,
      Value<DateTime?>? deletedAt,
      Value<int>? fieldOrder}) {
    return ConnectionsFieldsTableCompanion(
      fieldId: fieldId ?? this.fieldId,
      connectionsId: connectionsId ?? this.connectionsId,
      fieldType: fieldType ?? this.fieldType,
      fieldValue: fieldValue ?? this.fieldValue,
      deletedAt: deletedAt ?? this.deletedAt,
      fieldOrder: fieldOrder ?? this.fieldOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (fieldId.present) {
      map['field_id'] = Variable<int>(fieldId.value);
    }
    if (connectionsId.present) {
      map['connections_id'] = Variable<int>(connectionsId.value);
    }
    if (fieldType.present) {
      map['field_type'] = Variable<String>(fieldType.value);
    }
    if (fieldValue.present) {
      map['field_value'] = Variable<String>(fieldValue.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (fieldOrder.present) {
      map['field_order'] = Variable<int>(fieldOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionsFieldsTableCompanion(')
          ..write('fieldId: $fieldId, ')
          ..write('connectionsId: $connectionsId, ')
          ..write('fieldType: $fieldType, ')
          ..write('fieldValue: $fieldValue, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('fieldOrder: $fieldOrder')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ConnectionsTableTable connectionsTable =
      $ConnectionsTableTable(this);
  late final $DatesTableTable datesTable = $DatesTableTable(this);
  late final $ConnectionsFieldsTableTable connectionsFieldsTable =
      $ConnectionsFieldsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [connectionsTable, datesTable, connectionsFieldsTable];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('connections_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('dates_table', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$ConnectionsTableTableCreateCompanionBuilder
    = ConnectionsTableCompanion Function({
  Value<int> connectionsId,
  required String connectionsName,
  required String contactFrequency,
  required String connectionsRelation,
  Value<Uint8List?> image,
  Value<int> streak,
  Value<int?> calculatedScore,
  Value<bool> checkIn,
  Value<DateTime?> deletedAt,
});
typedef $$ConnectionsTableTableUpdateCompanionBuilder
    = ConnectionsTableCompanion Function({
  Value<int> connectionsId,
  Value<String> connectionsName,
  Value<String> contactFrequency,
  Value<String> connectionsRelation,
  Value<Uint8List?> image,
  Value<int> streak,
  Value<int?> calculatedScore,
  Value<bool> checkIn,
  Value<DateTime?> deletedAt,
});

final class $$ConnectionsTableTableReferences extends BaseReferences<
    _$AppDatabase, $ConnectionsTableTable, ConnectionsTableData> {
  $$ConnectionsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DatesTableTable, List<DatesTableData>>
      _datesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.datesTable,
          aliasName: $_aliasNameGenerator(
              db.connectionsTable.connectionsId, db.datesTable.connectionsId));

  $$DatesTableTableProcessedTableManager get datesTableRefs {
    final manager = $$DatesTableTableTableManager($_db, $_db.datesTable)
        .filter((f) => f.connectionsId.connectionsId($_item.connectionsId));

    final cache = $_typedResult.readTableOrNull(_datesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ConnectionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ConnectionsTableTable> {
  $$ConnectionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get connectionsId => $composableBuilder(
      column: $table.connectionsId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get connectionsName => $composableBuilder(
      column: $table.connectionsName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contactFrequency => $composableBuilder(
      column: $table.contactFrequency,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get connectionsRelation => $composableBuilder(
      column: $table.connectionsRelation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get streak => $composableBuilder(
      column: $table.streak, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get calculatedScore => $composableBuilder(
      column: $table.calculatedScore,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get checkIn => $composableBuilder(
      column: $table.checkIn, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> datesTableRefs(
      Expression<bool> Function($$DatesTableTableFilterComposer f) f) {
    final $$DatesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.connectionsId,
        referencedTable: $db.datesTable,
        getReferencedColumn: (t) => t.connectionsId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DatesTableTableFilterComposer(
              $db: $db,
              $table: $db.datesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ConnectionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ConnectionsTableTable> {
  $$ConnectionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get connectionsId => $composableBuilder(
      column: $table.connectionsId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get connectionsName => $composableBuilder(
      column: $table.connectionsName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactFrequency => $composableBuilder(
      column: $table.contactFrequency,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get connectionsRelation => $composableBuilder(
      column: $table.connectionsRelation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get streak => $composableBuilder(
      column: $table.streak, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get calculatedScore => $composableBuilder(
      column: $table.calculatedScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get checkIn => $composableBuilder(
      column: $table.checkIn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$ConnectionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConnectionsTableTable> {
  $$ConnectionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get connectionsId => $composableBuilder(
      column: $table.connectionsId, builder: (column) => column);

  GeneratedColumn<String> get connectionsName => $composableBuilder(
      column: $table.connectionsName, builder: (column) => column);

  GeneratedColumn<String> get contactFrequency => $composableBuilder(
      column: $table.contactFrequency, builder: (column) => column);

  GeneratedColumn<String> get connectionsRelation => $composableBuilder(
      column: $table.connectionsRelation, builder: (column) => column);

  GeneratedColumn<Uint8List> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<int> get streak =>
      $composableBuilder(column: $table.streak, builder: (column) => column);

  GeneratedColumn<int> get calculatedScore => $composableBuilder(
      column: $table.calculatedScore, builder: (column) => column);

  GeneratedColumn<bool> get checkIn =>
      $composableBuilder(column: $table.checkIn, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> datesTableRefs<T extends Object>(
      Expression<T> Function($$DatesTableTableAnnotationComposer a) f) {
    final $$DatesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.connectionsId,
        referencedTable: $db.datesTable,
        getReferencedColumn: (t) => t.connectionsId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DatesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.datesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ConnectionsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ConnectionsTableTable,
    ConnectionsTableData,
    $$ConnectionsTableTableFilterComposer,
    $$ConnectionsTableTableOrderingComposer,
    $$ConnectionsTableTableAnnotationComposer,
    $$ConnectionsTableTableCreateCompanionBuilder,
    $$ConnectionsTableTableUpdateCompanionBuilder,
    (ConnectionsTableData, $$ConnectionsTableTableReferences),
    ConnectionsTableData,
    PrefetchHooks Function({bool datesTableRefs})> {
  $$ConnectionsTableTableTableManager(
      _$AppDatabase db, $ConnectionsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConnectionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConnectionsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConnectionsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> connectionsId = const Value.absent(),
            Value<String> connectionsName = const Value.absent(),
            Value<String> contactFrequency = const Value.absent(),
            Value<String> connectionsRelation = const Value.absent(),
            Value<Uint8List?> image = const Value.absent(),
            Value<int> streak = const Value.absent(),
            Value<int?> calculatedScore = const Value.absent(),
            Value<bool> checkIn = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              ConnectionsTableCompanion(
            connectionsId: connectionsId,
            connectionsName: connectionsName,
            contactFrequency: contactFrequency,
            connectionsRelation: connectionsRelation,
            image: image,
            streak: streak,
            calculatedScore: calculatedScore,
            checkIn: checkIn,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> connectionsId = const Value.absent(),
            required String connectionsName,
            required String contactFrequency,
            required String connectionsRelation,
            Value<Uint8List?> image = const Value.absent(),
            Value<int> streak = const Value.absent(),
            Value<int?> calculatedScore = const Value.absent(),
            Value<bool> checkIn = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              ConnectionsTableCompanion.insert(
            connectionsId: connectionsId,
            connectionsName: connectionsName,
            contactFrequency: contactFrequency,
            connectionsRelation: connectionsRelation,
            image: image,
            streak: streak,
            calculatedScore: calculatedScore,
            checkIn: checkIn,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ConnectionsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({datesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (datesTableRefs) db.datesTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (datesTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ConnectionsTableTableReferences
                            ._datesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ConnectionsTableTableReferences(db, table, p0)
                                .datesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.connectionsId == item.connectionsId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ConnectionsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ConnectionsTableTable,
    ConnectionsTableData,
    $$ConnectionsTableTableFilterComposer,
    $$ConnectionsTableTableOrderingComposer,
    $$ConnectionsTableTableAnnotationComposer,
    $$ConnectionsTableTableCreateCompanionBuilder,
    $$ConnectionsTableTableUpdateCompanionBuilder,
    (ConnectionsTableData, $$ConnectionsTableTableReferences),
    ConnectionsTableData,
    PrefetchHooks Function({bool datesTableRefs})>;
typedef $$DatesTableTableCreateCompanionBuilder = DatesTableCompanion Function({
  Value<int> uid,
  required int connectionsId,
  required String title,
  required DateTime created,
  required DateTime lastModified,
  required DateTime dtstart,
  required DateTime dtend,
  required DateTime dtstamp,
  Value<String?> rrule,
  required int sequence,
  Value<String?> timezone,
  Value<DateTime?> deletedAt,
});
typedef $$DatesTableTableUpdateCompanionBuilder = DatesTableCompanion Function({
  Value<int> uid,
  Value<int> connectionsId,
  Value<String> title,
  Value<DateTime> created,
  Value<DateTime> lastModified,
  Value<DateTime> dtstart,
  Value<DateTime> dtend,
  Value<DateTime> dtstamp,
  Value<String?> rrule,
  Value<int> sequence,
  Value<String?> timezone,
  Value<DateTime?> deletedAt,
});

final class $$DatesTableTableReferences
    extends BaseReferences<_$AppDatabase, $DatesTableTable, DatesTableData> {
  $$DatesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ConnectionsTableTable _connectionsIdTable(_$AppDatabase db) =>
      db.connectionsTable.createAlias($_aliasNameGenerator(
          db.datesTable.connectionsId, db.connectionsTable.connectionsId));

  $$ConnectionsTableTableProcessedTableManager get connectionsId {
    final manager =
        $$ConnectionsTableTableTableManager($_db, $_db.connectionsTable)
            .filter((f) => f.connectionsId($_item.connectionsId));
    final item = $_typedResult.readTableOrNull(_connectionsIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DatesTableTableFilterComposer
    extends Composer<_$AppDatabase, $DatesTableTable> {
  $$DatesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get created => $composableBuilder(
      column: $table.created, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dtstart => $composableBuilder(
      column: $table.dtstart, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dtend => $composableBuilder(
      column: $table.dtend, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dtstamp => $composableBuilder(
      column: $table.dtstamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rrule => $composableBuilder(
      column: $table.rrule, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sequence => $composableBuilder(
      column: $table.sequence, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get timezone => $composableBuilder(
      column: $table.timezone, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$ConnectionsTableTableFilterComposer get connectionsId {
    final $$ConnectionsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.connectionsId,
        referencedTable: $db.connectionsTable,
        getReferencedColumn: (t) => t.connectionsId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ConnectionsTableTableFilterComposer(
              $db: $db,
              $table: $db.connectionsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DatesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DatesTableTable> {
  $$DatesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get created => $composableBuilder(
      column: $table.created, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dtstart => $composableBuilder(
      column: $table.dtstart, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dtend => $composableBuilder(
      column: $table.dtend, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dtstamp => $composableBuilder(
      column: $table.dtstamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rrule => $composableBuilder(
      column: $table.rrule, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sequence => $composableBuilder(
      column: $table.sequence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get timezone => $composableBuilder(
      column: $table.timezone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$ConnectionsTableTableOrderingComposer get connectionsId {
    final $$ConnectionsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.connectionsId,
        referencedTable: $db.connectionsTable,
        getReferencedColumn: (t) => t.connectionsId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ConnectionsTableTableOrderingComposer(
              $db: $db,
              $table: $db.connectionsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DatesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DatesTableTable> {
  $$DatesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get created =>
      $composableBuilder(column: $table.created, builder: (column) => column);

  GeneratedColumn<DateTime> get lastModified => $composableBuilder(
      column: $table.lastModified, builder: (column) => column);

  GeneratedColumn<DateTime> get dtstart =>
      $composableBuilder(column: $table.dtstart, builder: (column) => column);

  GeneratedColumn<DateTime> get dtend =>
      $composableBuilder(column: $table.dtend, builder: (column) => column);

  GeneratedColumn<DateTime> get dtstamp =>
      $composableBuilder(column: $table.dtstamp, builder: (column) => column);

  GeneratedColumn<String> get rrule =>
      $composableBuilder(column: $table.rrule, builder: (column) => column);

  GeneratedColumn<int> get sequence =>
      $composableBuilder(column: $table.sequence, builder: (column) => column);

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$ConnectionsTableTableAnnotationComposer get connectionsId {
    final $$ConnectionsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.connectionsId,
        referencedTable: $db.connectionsTable,
        getReferencedColumn: (t) => t.connectionsId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ConnectionsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.connectionsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DatesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DatesTableTable,
    DatesTableData,
    $$DatesTableTableFilterComposer,
    $$DatesTableTableOrderingComposer,
    $$DatesTableTableAnnotationComposer,
    $$DatesTableTableCreateCompanionBuilder,
    $$DatesTableTableUpdateCompanionBuilder,
    (DatesTableData, $$DatesTableTableReferences),
    DatesTableData,
    PrefetchHooks Function({bool connectionsId})> {
  $$DatesTableTableTableManager(_$AppDatabase db, $DatesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DatesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DatesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DatesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> uid = const Value.absent(),
            Value<int> connectionsId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
            Value<DateTime> lastModified = const Value.absent(),
            Value<DateTime> dtstart = const Value.absent(),
            Value<DateTime> dtend = const Value.absent(),
            Value<DateTime> dtstamp = const Value.absent(),
            Value<String?> rrule = const Value.absent(),
            Value<int> sequence = const Value.absent(),
            Value<String?> timezone = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              DatesTableCompanion(
            uid: uid,
            connectionsId: connectionsId,
            title: title,
            created: created,
            lastModified: lastModified,
            dtstart: dtstart,
            dtend: dtend,
            dtstamp: dtstamp,
            rrule: rrule,
            sequence: sequence,
            timezone: timezone,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> uid = const Value.absent(),
            required int connectionsId,
            required String title,
            required DateTime created,
            required DateTime lastModified,
            required DateTime dtstart,
            required DateTime dtend,
            required DateTime dtstamp,
            Value<String?> rrule = const Value.absent(),
            required int sequence,
            Value<String?> timezone = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              DatesTableCompanion.insert(
            uid: uid,
            connectionsId: connectionsId,
            title: title,
            created: created,
            lastModified: lastModified,
            dtstart: dtstart,
            dtend: dtend,
            dtstamp: dtstamp,
            rrule: rrule,
            sequence: sequence,
            timezone: timezone,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DatesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({connectionsId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (connectionsId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.connectionsId,
                    referencedTable:
                        $$DatesTableTableReferences._connectionsIdTable(db),
                    referencedColumn: $$DatesTableTableReferences
                        ._connectionsIdTable(db)
                        .connectionsId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DatesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DatesTableTable,
    DatesTableData,
    $$DatesTableTableFilterComposer,
    $$DatesTableTableOrderingComposer,
    $$DatesTableTableAnnotationComposer,
    $$DatesTableTableCreateCompanionBuilder,
    $$DatesTableTableUpdateCompanionBuilder,
    (DatesTableData, $$DatesTableTableReferences),
    DatesTableData,
    PrefetchHooks Function({bool connectionsId})>;
typedef $$ConnectionsFieldsTableTableCreateCompanionBuilder
    = ConnectionsFieldsTableCompanion Function({
  Value<int> fieldId,
  required int connectionsId,
  required String fieldType,
  required String fieldValue,
  Value<DateTime?> deletedAt,
  required int fieldOrder,
});
typedef $$ConnectionsFieldsTableTableUpdateCompanionBuilder
    = ConnectionsFieldsTableCompanion Function({
  Value<int> fieldId,
  Value<int> connectionsId,
  Value<String> fieldType,
  Value<String> fieldValue,
  Value<DateTime?> deletedAt,
  Value<int> fieldOrder,
});

class $$ConnectionsFieldsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ConnectionsFieldsTableTable> {
  $$ConnectionsFieldsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get fieldId => $composableBuilder(
      column: $table.fieldId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get connectionsId => $composableBuilder(
      column: $table.connectionsId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fieldType => $composableBuilder(
      column: $table.fieldType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fieldValue => $composableBuilder(
      column: $table.fieldValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fieldOrder => $composableBuilder(
      column: $table.fieldOrder, builder: (column) => ColumnFilters(column));
}

class $$ConnectionsFieldsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ConnectionsFieldsTableTable> {
  $$ConnectionsFieldsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get fieldId => $composableBuilder(
      column: $table.fieldId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get connectionsId => $composableBuilder(
      column: $table.connectionsId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fieldType => $composableBuilder(
      column: $table.fieldType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fieldValue => $composableBuilder(
      column: $table.fieldValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fieldOrder => $composableBuilder(
      column: $table.fieldOrder, builder: (column) => ColumnOrderings(column));
}

class $$ConnectionsFieldsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConnectionsFieldsTableTable> {
  $$ConnectionsFieldsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get fieldId =>
      $composableBuilder(column: $table.fieldId, builder: (column) => column);

  GeneratedColumn<int> get connectionsId => $composableBuilder(
      column: $table.connectionsId, builder: (column) => column);

  GeneratedColumn<String> get fieldType =>
      $composableBuilder(column: $table.fieldType, builder: (column) => column);

  GeneratedColumn<String> get fieldValue => $composableBuilder(
      column: $table.fieldValue, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<int> get fieldOrder => $composableBuilder(
      column: $table.fieldOrder, builder: (column) => column);
}

class $$ConnectionsFieldsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ConnectionsFieldsTableTable,
    ConnectionsFieldsTableData,
    $$ConnectionsFieldsTableTableFilterComposer,
    $$ConnectionsFieldsTableTableOrderingComposer,
    $$ConnectionsFieldsTableTableAnnotationComposer,
    $$ConnectionsFieldsTableTableCreateCompanionBuilder,
    $$ConnectionsFieldsTableTableUpdateCompanionBuilder,
    (
      ConnectionsFieldsTableData,
      BaseReferences<_$AppDatabase, $ConnectionsFieldsTableTable,
          ConnectionsFieldsTableData>
    ),
    ConnectionsFieldsTableData,
    PrefetchHooks Function()> {
  $$ConnectionsFieldsTableTableTableManager(
      _$AppDatabase db, $ConnectionsFieldsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConnectionsFieldsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ConnectionsFieldsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConnectionsFieldsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> fieldId = const Value.absent(),
            Value<int> connectionsId = const Value.absent(),
            Value<String> fieldType = const Value.absent(),
            Value<String> fieldValue = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> fieldOrder = const Value.absent(),
          }) =>
              ConnectionsFieldsTableCompanion(
            fieldId: fieldId,
            connectionsId: connectionsId,
            fieldType: fieldType,
            fieldValue: fieldValue,
            deletedAt: deletedAt,
            fieldOrder: fieldOrder,
          ),
          createCompanionCallback: ({
            Value<int> fieldId = const Value.absent(),
            required int connectionsId,
            required String fieldType,
            required String fieldValue,
            Value<DateTime?> deletedAt = const Value.absent(),
            required int fieldOrder,
          }) =>
              ConnectionsFieldsTableCompanion.insert(
            fieldId: fieldId,
            connectionsId: connectionsId,
            fieldType: fieldType,
            fieldValue: fieldValue,
            deletedAt: deletedAt,
            fieldOrder: fieldOrder,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ConnectionsFieldsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ConnectionsFieldsTableTable,
        ConnectionsFieldsTableData,
        $$ConnectionsFieldsTableTableFilterComposer,
        $$ConnectionsFieldsTableTableOrderingComposer,
        $$ConnectionsFieldsTableTableAnnotationComposer,
        $$ConnectionsFieldsTableTableCreateCompanionBuilder,
        $$ConnectionsFieldsTableTableUpdateCompanionBuilder,
        (
          ConnectionsFieldsTableData,
          BaseReferences<_$AppDatabase, $ConnectionsFieldsTableTable,
              ConnectionsFieldsTableData>
        ),
        ConnectionsFieldsTableData,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ConnectionsTableTableTableManager get connectionsTable =>
      $$ConnectionsTableTableTableManager(_db, _db.connectionsTable);
  $$DatesTableTableTableManager get datesTable =>
      $$DatesTableTableTableManager(_db, _db.datesTable);
  $$ConnectionsFieldsTableTableTableManager get connectionsFieldsTable =>
      $$ConnectionsFieldsTableTableTableManager(
          _db, _db.connectionsFieldsTable);
}
