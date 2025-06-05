// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $ConnectionItemsTable extends ConnectionItems with TableInfo<$ConnectionItemsTable, ConnectionItem>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$ConnectionItemsTable(this.attachedDatabase, [this._alias]);
@override
List<GeneratedColumn> get $columns => [];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'connection_items';
@override
Set<GeneratedColumn> get $primaryKey => const {};@override ConnectionItem map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return ConnectionItem();
}
@override
$ConnectionItemsTable createAlias(String alias) {
return $ConnectionItemsTable(attachedDatabase, alias);}}class ConnectionItem extends DataClass implements Insertable<ConnectionItem> 
{
const ConnectionItem({});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};return map; 
}
ConnectionItemsCompanion toCompanion(bool nullToAbsent) {
return ConnectionItemsCompanion();
}
factory ConnectionItem.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return ConnectionItem();}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
};}ConnectionItem copyWith({}) => ConnectionItem();ConnectionItem copyWithCompanion(ConnectionItemsCompanion data) {
return ConnectionItem(
);
}
@override
String toString() {return (StringBuffer('ConnectionItem(')..write(')')).toString();}
@override
 int get hashCode => identityHashCode(this);@override
bool operator ==(Object other) => identical(this, other) || (other is ConnectionItem);
}class ConnectionItemsCompanion extends UpdateCompanion<ConnectionItem> {
final Value<int> rowid;
const ConnectionItemsCompanion({this.rowid = const Value.absent(),});
ConnectionItemsCompanion.insert({this.rowid = const Value.absent(),});
static Insertable<ConnectionItem> custom({Expression<int>? rowid, 
}) {
return RawValuesInsertable({if (rowid != null)'rowid': rowid,});
}ConnectionItemsCompanion copyWith({Value<int>? rowid}) {
return ConnectionItemsCompanion(rowid: rowid ?? this.rowid,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (rowid.present) {
map['rowid'] = Variable<int>(rowid.value);}
return map; 
}
@override
String toString() {return (StringBuffer('ConnectionItemsCompanion(')..write('rowid: $rowid')..write(')')).toString();}
}
abstract class _$AppDatabase extends GeneratedDatabase{
_$AppDatabase(QueryExecutor e): super(e);
$AppDatabaseManager get managers => $AppDatabaseManager(this);
late final $ConnectionItemsTable connectionItems = $ConnectionItemsTable(this);
@override
Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
@override
List<DatabaseSchemaEntity> get allSchemaEntities => [connectionItems];
}
typedef $$ConnectionItemsTableCreateCompanionBuilder = ConnectionItemsCompanion Function({Value<int> rowid,});
typedef $$ConnectionItemsTableUpdateCompanionBuilder = ConnectionItemsCompanion Function({Value<int> rowid,});
class $$ConnectionItemsTableFilterComposer extends Composer<
        _$AppDatabase,
        $ConnectionItemsTable> {
        $$ConnectionItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          
        }
      class $$ConnectionItemsTableOrderingComposer extends Composer<
        _$AppDatabase,
        $ConnectionItemsTable> {
        $$ConnectionItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          
        }
      class $$ConnectionItemsTableAnnotationComposer extends Composer<
        _$AppDatabase,
        $ConnectionItemsTable> {
        $$ConnectionItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          
        }
      class $$ConnectionItemsTableTableManager extends RootTableManager    <_$AppDatabase,
    $ConnectionItemsTable,
    ConnectionItem,
    $$ConnectionItemsTableFilterComposer,
    $$ConnectionItemsTableOrderingComposer,
    $$ConnectionItemsTableAnnotationComposer,
    $$ConnectionItemsTableCreateCompanionBuilder,
    $$ConnectionItemsTableUpdateCompanionBuilder,
    (ConnectionItem,BaseReferences<_$AppDatabase,$ConnectionItemsTable,ConnectionItem>),
    ConnectionItem,
    PrefetchHooks Function()
    > {
    $$ConnectionItemsTableTableManager(_$AppDatabase db, $ConnectionItemsTable table) : super(
      TableManagerState(
        db: db,
        table: table,
        createFilteringComposer: () => $$ConnectionItemsTableFilterComposer($db: db,$table:table),
        createOrderingComposer: () => $$ConnectionItemsTableOrderingComposer($db: db,$table:table),
        createComputedFieldComposer: () => $$ConnectionItemsTableAnnotationComposer($db: db,$table:table),
        updateCompanionCallback: ({Value<int> rowid = const Value.absent(),})=> ConnectionItemsCompanion(rowid: rowid,),
        createCompanionCallback: ({Value<int> rowid = const Value.absent(),})=> ConnectionItemsCompanion.insert(rowid: rowid,),
        withReferenceMapper: (p0) => p0
              .map(
                  (e) =>
                     (e.readTable(table), BaseReferences(db, table, e))
                  )
              .toList(),
        prefetchHooksCallback: null,
        ));
        }
    typedef $$ConnectionItemsTableProcessedTableManager = ProcessedTableManager    <_$AppDatabase,
    $ConnectionItemsTable,
    ConnectionItem,
    $$ConnectionItemsTableFilterComposer,
    $$ConnectionItemsTableOrderingComposer,
    $$ConnectionItemsTableAnnotationComposer,
    $$ConnectionItemsTableCreateCompanionBuilder,
    $$ConnectionItemsTableUpdateCompanionBuilder,
    (ConnectionItem,BaseReferences<_$AppDatabase,$ConnectionItemsTable,ConnectionItem>),
    ConnectionItem,
    PrefetchHooks Function()
    >;class $AppDatabaseManager {
final _$AppDatabase _db;
$AppDatabaseManager(this._db);
$$ConnectionItemsTableTableManager get connectionItems => $$ConnectionItemsTableTableManager(_db, _db.connectionItems);
}
