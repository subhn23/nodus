// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $NotebooksTableTable extends NotebooksTable
    with TableInfo<$NotebooksTableTable, NotebooksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotebooksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<double> sortOrder = GeneratedColumn<double>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _createdAtHlcMeta = const VerificationMeta(
    'createdAtHlc',
  );
  @override
  late final GeneratedColumn<String> createdAtHlc = GeneratedColumn<String>(
    'created_at_hlc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtHlcMeta = const VerificationMeta(
    'updatedAtHlc',
  );
  @override
  late final GeneratedColumn<String> updatedAtHlc = GeneratedColumn<String>(
    'updated_at_hlc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtHlcMeta = const VerificationMeta(
    'deletedAtHlc',
  );
  @override
  late final GeneratedColumn<String> deletedAtHlc = GeneratedColumn<String>(
    'deleted_at_hlc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    color,
    icon,
    sortOrder,
    createdAtHlc,
    updatedAtHlc,
    deletedAtHlc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notebooks';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotebooksTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at_hlc')) {
      context.handle(
        _createdAtHlcMeta,
        createdAtHlc.isAcceptableOrUnknown(
          data['created_at_hlc']!,
          _createdAtHlcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtHlcMeta);
    }
    if (data.containsKey('updated_at_hlc')) {
      context.handle(
        _updatedAtHlcMeta,
        updatedAtHlc.isAcceptableOrUnknown(
          data['updated_at_hlc']!,
          _updatedAtHlcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtHlcMeta);
    }
    if (data.containsKey('deleted_at_hlc')) {
      context.handle(
        _deletedAtHlcMeta,
        deletedAtHlc.isAcceptableOrUnknown(
          data['deleted_at_hlc']!,
          _deletedAtHlcMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotebooksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotebooksTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      ),
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at_hlc'],
      )!,
      updatedAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at_hlc'],
      )!,
      deletedAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deleted_at_hlc'],
      ),
    );
  }

  @override
  $NotebooksTableTable createAlias(String alias) {
    return $NotebooksTableTable(attachedDatabase, alias);
  }
}

class NotebooksTableData extends DataClass
    implements Insertable<NotebooksTableData> {
  final String id;
  final String name;
  final String? color;
  final String? icon;
  final double sortOrder;
  final String createdAtHlc;
  final String updatedAtHlc;
  final String? deletedAtHlc;
  const NotebooksTableData({
    required this.id,
    required this.name,
    this.color,
    this.icon,
    required this.sortOrder,
    required this.createdAtHlc,
    required this.updatedAtHlc,
    this.deletedAtHlc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    map['sort_order'] = Variable<double>(sortOrder);
    map['created_at_hlc'] = Variable<String>(createdAtHlc);
    map['updated_at_hlc'] = Variable<String>(updatedAtHlc);
    if (!nullToAbsent || deletedAtHlc != null) {
      map['deleted_at_hlc'] = Variable<String>(deletedAtHlc);
    }
    return map;
  }

  NotebooksTableCompanion toCompanion(bool nullToAbsent) {
    return NotebooksTableCompanion(
      id: Value(id),
      name: Value(name),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      sortOrder: Value(sortOrder),
      createdAtHlc: Value(createdAtHlc),
      updatedAtHlc: Value(updatedAtHlc),
      deletedAtHlc: deletedAtHlc == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAtHlc),
    );
  }

  factory NotebooksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotebooksTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
      icon: serializer.fromJson<String?>(json['icon']),
      sortOrder: serializer.fromJson<double>(json['sortOrder']),
      createdAtHlc: serializer.fromJson<String>(json['createdAtHlc']),
      updatedAtHlc: serializer.fromJson<String>(json['updatedAtHlc']),
      deletedAtHlc: serializer.fromJson<String?>(json['deletedAtHlc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String?>(color),
      'icon': serializer.toJson<String?>(icon),
      'sortOrder': serializer.toJson<double>(sortOrder),
      'createdAtHlc': serializer.toJson<String>(createdAtHlc),
      'updatedAtHlc': serializer.toJson<String>(updatedAtHlc),
      'deletedAtHlc': serializer.toJson<String?>(deletedAtHlc),
    };
  }

  NotebooksTableData copyWith({
    String? id,
    String? name,
    Value<String?> color = const Value.absent(),
    Value<String?> icon = const Value.absent(),
    double? sortOrder,
    String? createdAtHlc,
    String? updatedAtHlc,
    Value<String?> deletedAtHlc = const Value.absent(),
  }) => NotebooksTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    color: color.present ? color.value : this.color,
    icon: icon.present ? icon.value : this.icon,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAtHlc: createdAtHlc ?? this.createdAtHlc,
    updatedAtHlc: updatedAtHlc ?? this.updatedAtHlc,
    deletedAtHlc: deletedAtHlc.present ? deletedAtHlc.value : this.deletedAtHlc,
  );
  NotebooksTableData copyWithCompanion(NotebooksTableCompanion data) {
    return NotebooksTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      icon: data.icon.present ? data.icon.value : this.icon,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAtHlc: data.createdAtHlc.present
          ? data.createdAtHlc.value
          : this.createdAtHlc,
      updatedAtHlc: data.updatedAtHlc.present
          ? data.updatedAtHlc.value
          : this.updatedAtHlc,
      deletedAtHlc: data.deletedAtHlc.present
          ? data.deletedAtHlc.value
          : this.deletedAtHlc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotebooksTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('icon: $icon, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAtHlc: $createdAtHlc, ')
          ..write('updatedAtHlc: $updatedAtHlc, ')
          ..write('deletedAtHlc: $deletedAtHlc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    color,
    icon,
    sortOrder,
    createdAtHlc,
    updatedAtHlc,
    deletedAtHlc,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotebooksTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.icon == this.icon &&
          other.sortOrder == this.sortOrder &&
          other.createdAtHlc == this.createdAtHlc &&
          other.updatedAtHlc == this.updatedAtHlc &&
          other.deletedAtHlc == this.deletedAtHlc);
}

class NotebooksTableCompanion extends UpdateCompanion<NotebooksTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> color;
  final Value<String?> icon;
  final Value<double> sortOrder;
  final Value<String> createdAtHlc;
  final Value<String> updatedAtHlc;
  final Value<String?> deletedAtHlc;
  final Value<int> rowid;
  const NotebooksTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAtHlc = const Value.absent(),
    this.updatedAtHlc = const Value.absent(),
    this.deletedAtHlc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotebooksTableCompanion.insert({
    required String id,
    required String name,
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required String createdAtHlc,
    required String updatedAtHlc,
    this.deletedAtHlc = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAtHlc = Value(createdAtHlc),
       updatedAtHlc = Value(updatedAtHlc);
  static Insertable<NotebooksTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? icon,
    Expression<double>? sortOrder,
    Expression<String>? createdAtHlc,
    Expression<String>? updatedAtHlc,
    Expression<String>? deletedAtHlc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (icon != null) 'icon': icon,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAtHlc != null) 'created_at_hlc': createdAtHlc,
      if (updatedAtHlc != null) 'updated_at_hlc': updatedAtHlc,
      if (deletedAtHlc != null) 'deleted_at_hlc': deletedAtHlc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotebooksTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? color,
    Value<String?>? icon,
    Value<double>? sortOrder,
    Value<String>? createdAtHlc,
    Value<String>? updatedAtHlc,
    Value<String?>? deletedAtHlc,
    Value<int>? rowid,
  }) {
    return NotebooksTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAtHlc: createdAtHlc ?? this.createdAtHlc,
      updatedAtHlc: updatedAtHlc ?? this.updatedAtHlc,
      deletedAtHlc: deletedAtHlc ?? this.deletedAtHlc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<double>(sortOrder.value);
    }
    if (createdAtHlc.present) {
      map['created_at_hlc'] = Variable<String>(createdAtHlc.value);
    }
    if (updatedAtHlc.present) {
      map['updated_at_hlc'] = Variable<String>(updatedAtHlc.value);
    }
    if (deletedAtHlc.present) {
      map['deleted_at_hlc'] = Variable<String>(deletedAtHlc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotebooksTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('icon: $icon, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAtHlc: $createdAtHlc, ')
          ..write('updatedAtHlc: $updatedAtHlc, ')
          ..write('deletedAtHlc: $deletedAtHlc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SectionsTableTable extends SectionsTable
    with TableInfo<$SectionsTableTable, SectionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SectionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notebookIdMeta = const VerificationMeta(
    'notebookId',
  );
  @override
  late final GeneratedColumn<String> notebookId = GeneratedColumn<String>(
    'notebook_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<double> sortOrder = GeneratedColumn<double>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _createdAtHlcMeta = const VerificationMeta(
    'createdAtHlc',
  );
  @override
  late final GeneratedColumn<String> createdAtHlc = GeneratedColumn<String>(
    'created_at_hlc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtHlcMeta = const VerificationMeta(
    'updatedAtHlc',
  );
  @override
  late final GeneratedColumn<String> updatedAtHlc = GeneratedColumn<String>(
    'updated_at_hlc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtHlcMeta = const VerificationMeta(
    'deletedAtHlc',
  );
  @override
  late final GeneratedColumn<String> deletedAtHlc = GeneratedColumn<String>(
    'deleted_at_hlc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    notebookId,
    name,
    color,
    sortOrder,
    createdAtHlc,
    updatedAtHlc,
    deletedAtHlc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sections';
  @override
  VerificationContext validateIntegrity(
    Insertable<SectionsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('notebook_id')) {
      context.handle(
        _notebookIdMeta,
        notebookId.isAcceptableOrUnknown(data['notebook_id']!, _notebookIdMeta),
      );
    } else if (isInserting) {
      context.missing(_notebookIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at_hlc')) {
      context.handle(
        _createdAtHlcMeta,
        createdAtHlc.isAcceptableOrUnknown(
          data['created_at_hlc']!,
          _createdAtHlcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtHlcMeta);
    }
    if (data.containsKey('updated_at_hlc')) {
      context.handle(
        _updatedAtHlcMeta,
        updatedAtHlc.isAcceptableOrUnknown(
          data['updated_at_hlc']!,
          _updatedAtHlcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtHlcMeta);
    }
    if (data.containsKey('deleted_at_hlc')) {
      context.handle(
        _deletedAtHlcMeta,
        deletedAtHlc.isAcceptableOrUnknown(
          data['deleted_at_hlc']!,
          _deletedAtHlcMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SectionsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SectionsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      notebookId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notebook_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at_hlc'],
      )!,
      updatedAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at_hlc'],
      )!,
      deletedAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deleted_at_hlc'],
      ),
    );
  }

  @override
  $SectionsTableTable createAlias(String alias) {
    return $SectionsTableTable(attachedDatabase, alias);
  }
}

class SectionsTableData extends DataClass
    implements Insertable<SectionsTableData> {
  final String id;
  final String notebookId;
  final String name;
  final String? color;
  final double sortOrder;
  final String createdAtHlc;
  final String updatedAtHlc;
  final String? deletedAtHlc;
  const SectionsTableData({
    required this.id,
    required this.notebookId,
    required this.name,
    this.color,
    required this.sortOrder,
    required this.createdAtHlc,
    required this.updatedAtHlc,
    this.deletedAtHlc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['notebook_id'] = Variable<String>(notebookId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    map['sort_order'] = Variable<double>(sortOrder);
    map['created_at_hlc'] = Variable<String>(createdAtHlc);
    map['updated_at_hlc'] = Variable<String>(updatedAtHlc);
    if (!nullToAbsent || deletedAtHlc != null) {
      map['deleted_at_hlc'] = Variable<String>(deletedAtHlc);
    }
    return map;
  }

  SectionsTableCompanion toCompanion(bool nullToAbsent) {
    return SectionsTableCompanion(
      id: Value(id),
      notebookId: Value(notebookId),
      name: Value(name),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
      sortOrder: Value(sortOrder),
      createdAtHlc: Value(createdAtHlc),
      updatedAtHlc: Value(updatedAtHlc),
      deletedAtHlc: deletedAtHlc == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAtHlc),
    );
  }

  factory SectionsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SectionsTableData(
      id: serializer.fromJson<String>(json['id']),
      notebookId: serializer.fromJson<String>(json['notebookId']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
      sortOrder: serializer.fromJson<double>(json['sortOrder']),
      createdAtHlc: serializer.fromJson<String>(json['createdAtHlc']),
      updatedAtHlc: serializer.fromJson<String>(json['updatedAtHlc']),
      deletedAtHlc: serializer.fromJson<String?>(json['deletedAtHlc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'notebookId': serializer.toJson<String>(notebookId),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String?>(color),
      'sortOrder': serializer.toJson<double>(sortOrder),
      'createdAtHlc': serializer.toJson<String>(createdAtHlc),
      'updatedAtHlc': serializer.toJson<String>(updatedAtHlc),
      'deletedAtHlc': serializer.toJson<String?>(deletedAtHlc),
    };
  }

  SectionsTableData copyWith({
    String? id,
    String? notebookId,
    String? name,
    Value<String?> color = const Value.absent(),
    double? sortOrder,
    String? createdAtHlc,
    String? updatedAtHlc,
    Value<String?> deletedAtHlc = const Value.absent(),
  }) => SectionsTableData(
    id: id ?? this.id,
    notebookId: notebookId ?? this.notebookId,
    name: name ?? this.name,
    color: color.present ? color.value : this.color,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAtHlc: createdAtHlc ?? this.createdAtHlc,
    updatedAtHlc: updatedAtHlc ?? this.updatedAtHlc,
    deletedAtHlc: deletedAtHlc.present ? deletedAtHlc.value : this.deletedAtHlc,
  );
  SectionsTableData copyWithCompanion(SectionsTableCompanion data) {
    return SectionsTableData(
      id: data.id.present ? data.id.value : this.id,
      notebookId: data.notebookId.present
          ? data.notebookId.value
          : this.notebookId,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAtHlc: data.createdAtHlc.present
          ? data.createdAtHlc.value
          : this.createdAtHlc,
      updatedAtHlc: data.updatedAtHlc.present
          ? data.updatedAtHlc.value
          : this.updatedAtHlc,
      deletedAtHlc: data.deletedAtHlc.present
          ? data.deletedAtHlc.value
          : this.deletedAtHlc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SectionsTableData(')
          ..write('id: $id, ')
          ..write('notebookId: $notebookId, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAtHlc: $createdAtHlc, ')
          ..write('updatedAtHlc: $updatedAtHlc, ')
          ..write('deletedAtHlc: $deletedAtHlc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    notebookId,
    name,
    color,
    sortOrder,
    createdAtHlc,
    updatedAtHlc,
    deletedAtHlc,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SectionsTableData &&
          other.id == this.id &&
          other.notebookId == this.notebookId &&
          other.name == this.name &&
          other.color == this.color &&
          other.sortOrder == this.sortOrder &&
          other.createdAtHlc == this.createdAtHlc &&
          other.updatedAtHlc == this.updatedAtHlc &&
          other.deletedAtHlc == this.deletedAtHlc);
}

class SectionsTableCompanion extends UpdateCompanion<SectionsTableData> {
  final Value<String> id;
  final Value<String> notebookId;
  final Value<String> name;
  final Value<String?> color;
  final Value<double> sortOrder;
  final Value<String> createdAtHlc;
  final Value<String> updatedAtHlc;
  final Value<String?> deletedAtHlc;
  final Value<int> rowid;
  const SectionsTableCompanion({
    this.id = const Value.absent(),
    this.notebookId = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAtHlc = const Value.absent(),
    this.updatedAtHlc = const Value.absent(),
    this.deletedAtHlc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SectionsTableCompanion.insert({
    required String id,
    required String notebookId,
    required String name,
    this.color = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required String createdAtHlc,
    required String updatedAtHlc,
    this.deletedAtHlc = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       notebookId = Value(notebookId),
       name = Value(name),
       createdAtHlc = Value(createdAtHlc),
       updatedAtHlc = Value(updatedAtHlc);
  static Insertable<SectionsTableData> custom({
    Expression<String>? id,
    Expression<String>? notebookId,
    Expression<String>? name,
    Expression<String>? color,
    Expression<double>? sortOrder,
    Expression<String>? createdAtHlc,
    Expression<String>? updatedAtHlc,
    Expression<String>? deletedAtHlc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (notebookId != null) 'notebook_id': notebookId,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAtHlc != null) 'created_at_hlc': createdAtHlc,
      if (updatedAtHlc != null) 'updated_at_hlc': updatedAtHlc,
      if (deletedAtHlc != null) 'deleted_at_hlc': deletedAtHlc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SectionsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? notebookId,
    Value<String>? name,
    Value<String?>? color,
    Value<double>? sortOrder,
    Value<String>? createdAtHlc,
    Value<String>? updatedAtHlc,
    Value<String?>? deletedAtHlc,
    Value<int>? rowid,
  }) {
    return SectionsTableCompanion(
      id: id ?? this.id,
      notebookId: notebookId ?? this.notebookId,
      name: name ?? this.name,
      color: color ?? this.color,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAtHlc: createdAtHlc ?? this.createdAtHlc,
      updatedAtHlc: updatedAtHlc ?? this.updatedAtHlc,
      deletedAtHlc: deletedAtHlc ?? this.deletedAtHlc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (notebookId.present) {
      map['notebook_id'] = Variable<String>(notebookId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<double>(sortOrder.value);
    }
    if (createdAtHlc.present) {
      map['created_at_hlc'] = Variable<String>(createdAtHlc.value);
    }
    if (updatedAtHlc.present) {
      map['updated_at_hlc'] = Variable<String>(updatedAtHlc.value);
    }
    if (deletedAtHlc.present) {
      map['deleted_at_hlc'] = Variable<String>(deletedAtHlc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SectionsTableCompanion(')
          ..write('id: $id, ')
          ..write('notebookId: $notebookId, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAtHlc: $createdAtHlc, ')
          ..write('updatedAtHlc: $updatedAtHlc, ')
          ..write('deletedAtHlc: $deletedAtHlc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PagesTableTable extends PagesTable
    with TableInfo<$PagesTableTable, PagesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PagesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sectionIdMeta = const VerificationMeta(
    'sectionId',
  );
  @override
  late final GeneratedColumn<String> sectionId = GeneratedColumn<String>(
    'section_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 500,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isPinnedMeta = const VerificationMeta(
    'isPinned',
  );
  @override
  late final GeneratedColumn<bool> isPinned = GeneratedColumn<bool>(
    'is_pinned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pinned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<double> sortOrder = GeneratedColumn<double>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _createdAtHlcMeta = const VerificationMeta(
    'createdAtHlc',
  );
  @override
  late final GeneratedColumn<String> createdAtHlc = GeneratedColumn<String>(
    'created_at_hlc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtHlcMeta = const VerificationMeta(
    'updatedAtHlc',
  );
  @override
  late final GeneratedColumn<String> updatedAtHlc = GeneratedColumn<String>(
    'updated_at_hlc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtHlcMeta = const VerificationMeta(
    'deletedAtHlc',
  );
  @override
  late final GeneratedColumn<String> deletedAtHlc = GeneratedColumn<String>(
    'deleted_at_hlc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sectionId,
    title,
    isPinned,
    sortOrder,
    createdAtHlc,
    updatedAtHlc,
    deletedAtHlc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pages';
  @override
  VerificationContext validateIntegrity(
    Insertable<PagesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('section_id')) {
      context.handle(
        _sectionIdMeta,
        sectionId.isAcceptableOrUnknown(data['section_id']!, _sectionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sectionIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_pinned')) {
      context.handle(
        _isPinnedMeta,
        isPinned.isAcceptableOrUnknown(data['is_pinned']!, _isPinnedMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at_hlc')) {
      context.handle(
        _createdAtHlcMeta,
        createdAtHlc.isAcceptableOrUnknown(
          data['created_at_hlc']!,
          _createdAtHlcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtHlcMeta);
    }
    if (data.containsKey('updated_at_hlc')) {
      context.handle(
        _updatedAtHlcMeta,
        updatedAtHlc.isAcceptableOrUnknown(
          data['updated_at_hlc']!,
          _updatedAtHlcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtHlcMeta);
    }
    if (data.containsKey('deleted_at_hlc')) {
      context.handle(
        _deletedAtHlcMeta,
        deletedAtHlc.isAcceptableOrUnknown(
          data['deleted_at_hlc']!,
          _deletedAtHlcMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PagesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PagesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}section_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      isPinned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pinned'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at_hlc'],
      )!,
      updatedAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at_hlc'],
      )!,
      deletedAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deleted_at_hlc'],
      ),
    );
  }

  @override
  $PagesTableTable createAlias(String alias) {
    return $PagesTableTable(attachedDatabase, alias);
  }
}

class PagesTableData extends DataClass implements Insertable<PagesTableData> {
  final String id;
  final String sectionId;
  final String title;
  final bool isPinned;
  final double sortOrder;
  final String createdAtHlc;
  final String updatedAtHlc;
  final String? deletedAtHlc;
  const PagesTableData({
    required this.id,
    required this.sectionId,
    required this.title,
    required this.isPinned,
    required this.sortOrder,
    required this.createdAtHlc,
    required this.updatedAtHlc,
    this.deletedAtHlc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['section_id'] = Variable<String>(sectionId);
    map['title'] = Variable<String>(title);
    map['is_pinned'] = Variable<bool>(isPinned);
    map['sort_order'] = Variable<double>(sortOrder);
    map['created_at_hlc'] = Variable<String>(createdAtHlc);
    map['updated_at_hlc'] = Variable<String>(updatedAtHlc);
    if (!nullToAbsent || deletedAtHlc != null) {
      map['deleted_at_hlc'] = Variable<String>(deletedAtHlc);
    }
    return map;
  }

  PagesTableCompanion toCompanion(bool nullToAbsent) {
    return PagesTableCompanion(
      id: Value(id),
      sectionId: Value(sectionId),
      title: Value(title),
      isPinned: Value(isPinned),
      sortOrder: Value(sortOrder),
      createdAtHlc: Value(createdAtHlc),
      updatedAtHlc: Value(updatedAtHlc),
      deletedAtHlc: deletedAtHlc == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAtHlc),
    );
  }

  factory PagesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PagesTableData(
      id: serializer.fromJson<String>(json['id']),
      sectionId: serializer.fromJson<String>(json['sectionId']),
      title: serializer.fromJson<String>(json['title']),
      isPinned: serializer.fromJson<bool>(json['isPinned']),
      sortOrder: serializer.fromJson<double>(json['sortOrder']),
      createdAtHlc: serializer.fromJson<String>(json['createdAtHlc']),
      updatedAtHlc: serializer.fromJson<String>(json['updatedAtHlc']),
      deletedAtHlc: serializer.fromJson<String?>(json['deletedAtHlc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sectionId': serializer.toJson<String>(sectionId),
      'title': serializer.toJson<String>(title),
      'isPinned': serializer.toJson<bool>(isPinned),
      'sortOrder': serializer.toJson<double>(sortOrder),
      'createdAtHlc': serializer.toJson<String>(createdAtHlc),
      'updatedAtHlc': serializer.toJson<String>(updatedAtHlc),
      'deletedAtHlc': serializer.toJson<String?>(deletedAtHlc),
    };
  }

  PagesTableData copyWith({
    String? id,
    String? sectionId,
    String? title,
    bool? isPinned,
    double? sortOrder,
    String? createdAtHlc,
    String? updatedAtHlc,
    Value<String?> deletedAtHlc = const Value.absent(),
  }) => PagesTableData(
    id: id ?? this.id,
    sectionId: sectionId ?? this.sectionId,
    title: title ?? this.title,
    isPinned: isPinned ?? this.isPinned,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAtHlc: createdAtHlc ?? this.createdAtHlc,
    updatedAtHlc: updatedAtHlc ?? this.updatedAtHlc,
    deletedAtHlc: deletedAtHlc.present ? deletedAtHlc.value : this.deletedAtHlc,
  );
  PagesTableData copyWithCompanion(PagesTableCompanion data) {
    return PagesTableData(
      id: data.id.present ? data.id.value : this.id,
      sectionId: data.sectionId.present ? data.sectionId.value : this.sectionId,
      title: data.title.present ? data.title.value : this.title,
      isPinned: data.isPinned.present ? data.isPinned.value : this.isPinned,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAtHlc: data.createdAtHlc.present
          ? data.createdAtHlc.value
          : this.createdAtHlc,
      updatedAtHlc: data.updatedAtHlc.present
          ? data.updatedAtHlc.value
          : this.updatedAtHlc,
      deletedAtHlc: data.deletedAtHlc.present
          ? data.deletedAtHlc.value
          : this.deletedAtHlc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PagesTableData(')
          ..write('id: $id, ')
          ..write('sectionId: $sectionId, ')
          ..write('title: $title, ')
          ..write('isPinned: $isPinned, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAtHlc: $createdAtHlc, ')
          ..write('updatedAtHlc: $updatedAtHlc, ')
          ..write('deletedAtHlc: $deletedAtHlc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sectionId,
    title,
    isPinned,
    sortOrder,
    createdAtHlc,
    updatedAtHlc,
    deletedAtHlc,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PagesTableData &&
          other.id == this.id &&
          other.sectionId == this.sectionId &&
          other.title == this.title &&
          other.isPinned == this.isPinned &&
          other.sortOrder == this.sortOrder &&
          other.createdAtHlc == this.createdAtHlc &&
          other.updatedAtHlc == this.updatedAtHlc &&
          other.deletedAtHlc == this.deletedAtHlc);
}

class PagesTableCompanion extends UpdateCompanion<PagesTableData> {
  final Value<String> id;
  final Value<String> sectionId;
  final Value<String> title;
  final Value<bool> isPinned;
  final Value<double> sortOrder;
  final Value<String> createdAtHlc;
  final Value<String> updatedAtHlc;
  final Value<String?> deletedAtHlc;
  final Value<int> rowid;
  const PagesTableCompanion({
    this.id = const Value.absent(),
    this.sectionId = const Value.absent(),
    this.title = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAtHlc = const Value.absent(),
    this.updatedAtHlc = const Value.absent(),
    this.deletedAtHlc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PagesTableCompanion.insert({
    required String id,
    required String sectionId,
    required String title,
    this.isPinned = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required String createdAtHlc,
    required String updatedAtHlc,
    this.deletedAtHlc = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sectionId = Value(sectionId),
       title = Value(title),
       createdAtHlc = Value(createdAtHlc),
       updatedAtHlc = Value(updatedAtHlc);
  static Insertable<PagesTableData> custom({
    Expression<String>? id,
    Expression<String>? sectionId,
    Expression<String>? title,
    Expression<bool>? isPinned,
    Expression<double>? sortOrder,
    Expression<String>? createdAtHlc,
    Expression<String>? updatedAtHlc,
    Expression<String>? deletedAtHlc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sectionId != null) 'section_id': sectionId,
      if (title != null) 'title': title,
      if (isPinned != null) 'is_pinned': isPinned,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAtHlc != null) 'created_at_hlc': createdAtHlc,
      if (updatedAtHlc != null) 'updated_at_hlc': updatedAtHlc,
      if (deletedAtHlc != null) 'deleted_at_hlc': deletedAtHlc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PagesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? sectionId,
    Value<String>? title,
    Value<bool>? isPinned,
    Value<double>? sortOrder,
    Value<String>? createdAtHlc,
    Value<String>? updatedAtHlc,
    Value<String?>? deletedAtHlc,
    Value<int>? rowid,
  }) {
    return PagesTableCompanion(
      id: id ?? this.id,
      sectionId: sectionId ?? this.sectionId,
      title: title ?? this.title,
      isPinned: isPinned ?? this.isPinned,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAtHlc: createdAtHlc ?? this.createdAtHlc,
      updatedAtHlc: updatedAtHlc ?? this.updatedAtHlc,
      deletedAtHlc: deletedAtHlc ?? this.deletedAtHlc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sectionId.present) {
      map['section_id'] = Variable<String>(sectionId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<bool>(isPinned.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<double>(sortOrder.value);
    }
    if (createdAtHlc.present) {
      map['created_at_hlc'] = Variable<String>(createdAtHlc.value);
    }
    if (updatedAtHlc.present) {
      map['updated_at_hlc'] = Variable<String>(updatedAtHlc.value);
    }
    if (deletedAtHlc.present) {
      map['deleted_at_hlc'] = Variable<String>(deletedAtHlc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PagesTableCompanion(')
          ..write('id: $id, ')
          ..write('sectionId: $sectionId, ')
          ..write('title: $title, ')
          ..write('isPinned: $isPinned, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAtHlc: $createdAtHlc, ')
          ..write('updatedAtHlc: $updatedAtHlc, ')
          ..write('deletedAtHlc: $deletedAtHlc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NoteBlocksTableTable extends NoteBlocksTable
    with TableInfo<$NoteBlocksTableTable, NoteBlocksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteBlocksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageIdMeta = const VerificationMeta('pageId');
  @override
  late final GeneratedColumn<String> pageId = GeneratedColumn<String>(
    'page_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _blockTypeMeta = const VerificationMeta(
    'blockType',
  );
  @override
  late final GeneratedColumn<String> blockType = GeneratedColumn<String>(
    'block_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<double> sortOrder = GeneratedColumn<double>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _crdtStateMeta = const VerificationMeta(
    'crdtState',
  );
  @override
  late final GeneratedColumn<Uint8List> crdtState = GeneratedColumn<Uint8List>(
    'crdt_state',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtHlcMeta = const VerificationMeta(
    'createdAtHlc',
  );
  @override
  late final GeneratedColumn<String> createdAtHlc = GeneratedColumn<String>(
    'created_at_hlc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtHlcMeta = const VerificationMeta(
    'updatedAtHlc',
  );
  @override
  late final GeneratedColumn<String> updatedAtHlc = GeneratedColumn<String>(
    'updated_at_hlc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtHlcMeta = const VerificationMeta(
    'deletedAtHlc',
  );
  @override
  late final GeneratedColumn<String> deletedAtHlc = GeneratedColumn<String>(
    'deleted_at_hlc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pageId,
    blockType,
    sortOrder,
    content,
    crdtState,
    createdAtHlc,
    updatedAtHlc,
    deletedAtHlc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note_blocks';
  @override
  VerificationContext validateIntegrity(
    Insertable<NoteBlocksTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('page_id')) {
      context.handle(
        _pageIdMeta,
        pageId.isAcceptableOrUnknown(data['page_id']!, _pageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pageIdMeta);
    }
    if (data.containsKey('block_type')) {
      context.handle(
        _blockTypeMeta,
        blockType.isAcceptableOrUnknown(data['block_type']!, _blockTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_blockTypeMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('crdt_state')) {
      context.handle(
        _crdtStateMeta,
        crdtState.isAcceptableOrUnknown(data['crdt_state']!, _crdtStateMeta),
      );
    }
    if (data.containsKey('created_at_hlc')) {
      context.handle(
        _createdAtHlcMeta,
        createdAtHlc.isAcceptableOrUnknown(
          data['created_at_hlc']!,
          _createdAtHlcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtHlcMeta);
    }
    if (data.containsKey('updated_at_hlc')) {
      context.handle(
        _updatedAtHlcMeta,
        updatedAtHlc.isAcceptableOrUnknown(
          data['updated_at_hlc']!,
          _updatedAtHlcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtHlcMeta);
    }
    if (data.containsKey('deleted_at_hlc')) {
      context.handle(
        _deletedAtHlcMeta,
        deletedAtHlc.isAcceptableOrUnknown(
          data['deleted_at_hlc']!,
          _deletedAtHlcMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteBlocksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteBlocksTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}page_id'],
      )!,
      blockType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}block_type'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sort_order'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      crdtState: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}crdt_state'],
      ),
      createdAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at_hlc'],
      )!,
      updatedAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at_hlc'],
      )!,
      deletedAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deleted_at_hlc'],
      ),
    );
  }

  @override
  $NoteBlocksTableTable createAlias(String alias) {
    return $NoteBlocksTableTable(attachedDatabase, alias);
  }
}

class NoteBlocksTableData extends DataClass
    implements Insertable<NoteBlocksTableData> {
  final String id;
  final String pageId;
  final String blockType;
  final double sortOrder;
  final String content;
  final Uint8List? crdtState;
  final String createdAtHlc;
  final String updatedAtHlc;
  final String? deletedAtHlc;
  const NoteBlocksTableData({
    required this.id,
    required this.pageId,
    required this.blockType,
    required this.sortOrder,
    required this.content,
    this.crdtState,
    required this.createdAtHlc,
    required this.updatedAtHlc,
    this.deletedAtHlc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['page_id'] = Variable<String>(pageId);
    map['block_type'] = Variable<String>(blockType);
    map['sort_order'] = Variable<double>(sortOrder);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || crdtState != null) {
      map['crdt_state'] = Variable<Uint8List>(crdtState);
    }
    map['created_at_hlc'] = Variable<String>(createdAtHlc);
    map['updated_at_hlc'] = Variable<String>(updatedAtHlc);
    if (!nullToAbsent || deletedAtHlc != null) {
      map['deleted_at_hlc'] = Variable<String>(deletedAtHlc);
    }
    return map;
  }

  NoteBlocksTableCompanion toCompanion(bool nullToAbsent) {
    return NoteBlocksTableCompanion(
      id: Value(id),
      pageId: Value(pageId),
      blockType: Value(blockType),
      sortOrder: Value(sortOrder),
      content: Value(content),
      crdtState: crdtState == null && nullToAbsent
          ? const Value.absent()
          : Value(crdtState),
      createdAtHlc: Value(createdAtHlc),
      updatedAtHlc: Value(updatedAtHlc),
      deletedAtHlc: deletedAtHlc == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAtHlc),
    );
  }

  factory NoteBlocksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteBlocksTableData(
      id: serializer.fromJson<String>(json['id']),
      pageId: serializer.fromJson<String>(json['pageId']),
      blockType: serializer.fromJson<String>(json['blockType']),
      sortOrder: serializer.fromJson<double>(json['sortOrder']),
      content: serializer.fromJson<String>(json['content']),
      crdtState: serializer.fromJson<Uint8List?>(json['crdtState']),
      createdAtHlc: serializer.fromJson<String>(json['createdAtHlc']),
      updatedAtHlc: serializer.fromJson<String>(json['updatedAtHlc']),
      deletedAtHlc: serializer.fromJson<String?>(json['deletedAtHlc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pageId': serializer.toJson<String>(pageId),
      'blockType': serializer.toJson<String>(blockType),
      'sortOrder': serializer.toJson<double>(sortOrder),
      'content': serializer.toJson<String>(content),
      'crdtState': serializer.toJson<Uint8List?>(crdtState),
      'createdAtHlc': serializer.toJson<String>(createdAtHlc),
      'updatedAtHlc': serializer.toJson<String>(updatedAtHlc),
      'deletedAtHlc': serializer.toJson<String?>(deletedAtHlc),
    };
  }

  NoteBlocksTableData copyWith({
    String? id,
    String? pageId,
    String? blockType,
    double? sortOrder,
    String? content,
    Value<Uint8List?> crdtState = const Value.absent(),
    String? createdAtHlc,
    String? updatedAtHlc,
    Value<String?> deletedAtHlc = const Value.absent(),
  }) => NoteBlocksTableData(
    id: id ?? this.id,
    pageId: pageId ?? this.pageId,
    blockType: blockType ?? this.blockType,
    sortOrder: sortOrder ?? this.sortOrder,
    content: content ?? this.content,
    crdtState: crdtState.present ? crdtState.value : this.crdtState,
    createdAtHlc: createdAtHlc ?? this.createdAtHlc,
    updatedAtHlc: updatedAtHlc ?? this.updatedAtHlc,
    deletedAtHlc: deletedAtHlc.present ? deletedAtHlc.value : this.deletedAtHlc,
  );
  NoteBlocksTableData copyWithCompanion(NoteBlocksTableCompanion data) {
    return NoteBlocksTableData(
      id: data.id.present ? data.id.value : this.id,
      pageId: data.pageId.present ? data.pageId.value : this.pageId,
      blockType: data.blockType.present ? data.blockType.value : this.blockType,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      content: data.content.present ? data.content.value : this.content,
      crdtState: data.crdtState.present ? data.crdtState.value : this.crdtState,
      createdAtHlc: data.createdAtHlc.present
          ? data.createdAtHlc.value
          : this.createdAtHlc,
      updatedAtHlc: data.updatedAtHlc.present
          ? data.updatedAtHlc.value
          : this.updatedAtHlc,
      deletedAtHlc: data.deletedAtHlc.present
          ? data.deletedAtHlc.value
          : this.deletedAtHlc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteBlocksTableData(')
          ..write('id: $id, ')
          ..write('pageId: $pageId, ')
          ..write('blockType: $blockType, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('content: $content, ')
          ..write('crdtState: $crdtState, ')
          ..write('createdAtHlc: $createdAtHlc, ')
          ..write('updatedAtHlc: $updatedAtHlc, ')
          ..write('deletedAtHlc: $deletedAtHlc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pageId,
    blockType,
    sortOrder,
    content,
    $driftBlobEquality.hash(crdtState),
    createdAtHlc,
    updatedAtHlc,
    deletedAtHlc,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteBlocksTableData &&
          other.id == this.id &&
          other.pageId == this.pageId &&
          other.blockType == this.blockType &&
          other.sortOrder == this.sortOrder &&
          other.content == this.content &&
          $driftBlobEquality.equals(other.crdtState, this.crdtState) &&
          other.createdAtHlc == this.createdAtHlc &&
          other.updatedAtHlc == this.updatedAtHlc &&
          other.deletedAtHlc == this.deletedAtHlc);
}

class NoteBlocksTableCompanion extends UpdateCompanion<NoteBlocksTableData> {
  final Value<String> id;
  final Value<String> pageId;
  final Value<String> blockType;
  final Value<double> sortOrder;
  final Value<String> content;
  final Value<Uint8List?> crdtState;
  final Value<String> createdAtHlc;
  final Value<String> updatedAtHlc;
  final Value<String?> deletedAtHlc;
  final Value<int> rowid;
  const NoteBlocksTableCompanion({
    this.id = const Value.absent(),
    this.pageId = const Value.absent(),
    this.blockType = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.content = const Value.absent(),
    this.crdtState = const Value.absent(),
    this.createdAtHlc = const Value.absent(),
    this.updatedAtHlc = const Value.absent(),
    this.deletedAtHlc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NoteBlocksTableCompanion.insert({
    required String id,
    required String pageId,
    required String blockType,
    this.sortOrder = const Value.absent(),
    required String content,
    this.crdtState = const Value.absent(),
    required String createdAtHlc,
    required String updatedAtHlc,
    this.deletedAtHlc = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       pageId = Value(pageId),
       blockType = Value(blockType),
       content = Value(content),
       createdAtHlc = Value(createdAtHlc),
       updatedAtHlc = Value(updatedAtHlc);
  static Insertable<NoteBlocksTableData> custom({
    Expression<String>? id,
    Expression<String>? pageId,
    Expression<String>? blockType,
    Expression<double>? sortOrder,
    Expression<String>? content,
    Expression<Uint8List>? crdtState,
    Expression<String>? createdAtHlc,
    Expression<String>? updatedAtHlc,
    Expression<String>? deletedAtHlc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pageId != null) 'page_id': pageId,
      if (blockType != null) 'block_type': blockType,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (content != null) 'content': content,
      if (crdtState != null) 'crdt_state': crdtState,
      if (createdAtHlc != null) 'created_at_hlc': createdAtHlc,
      if (updatedAtHlc != null) 'updated_at_hlc': updatedAtHlc,
      if (deletedAtHlc != null) 'deleted_at_hlc': deletedAtHlc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NoteBlocksTableCompanion copyWith({
    Value<String>? id,
    Value<String>? pageId,
    Value<String>? blockType,
    Value<double>? sortOrder,
    Value<String>? content,
    Value<Uint8List?>? crdtState,
    Value<String>? createdAtHlc,
    Value<String>? updatedAtHlc,
    Value<String?>? deletedAtHlc,
    Value<int>? rowid,
  }) {
    return NoteBlocksTableCompanion(
      id: id ?? this.id,
      pageId: pageId ?? this.pageId,
      blockType: blockType ?? this.blockType,
      sortOrder: sortOrder ?? this.sortOrder,
      content: content ?? this.content,
      crdtState: crdtState ?? this.crdtState,
      createdAtHlc: createdAtHlc ?? this.createdAtHlc,
      updatedAtHlc: updatedAtHlc ?? this.updatedAtHlc,
      deletedAtHlc: deletedAtHlc ?? this.deletedAtHlc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pageId.present) {
      map['page_id'] = Variable<String>(pageId.value);
    }
    if (blockType.present) {
      map['block_type'] = Variable<String>(blockType.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<double>(sortOrder.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (crdtState.present) {
      map['crdt_state'] = Variable<Uint8List>(crdtState.value);
    }
    if (createdAtHlc.present) {
      map['created_at_hlc'] = Variable<String>(createdAtHlc.value);
    }
    if (updatedAtHlc.present) {
      map['updated_at_hlc'] = Variable<String>(updatedAtHlc.value);
    }
    if (deletedAtHlc.present) {
      map['deleted_at_hlc'] = Variable<String>(deletedAtHlc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteBlocksTableCompanion(')
          ..write('id: $id, ')
          ..write('pageId: $pageId, ')
          ..write('blockType: $blockType, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('content: $content, ')
          ..write('crdtState: $crdtState, ')
          ..write('createdAtHlc: $createdAtHlc, ')
          ..write('updatedAtHlc: $updatedAtHlc, ')
          ..write('deletedAtHlc: $deletedAtHlc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TasksTableTable extends TasksTable
    with TableInfo<$TasksTableTable, TasksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _blockIdMeta = const VerificationMeta(
    'blockId',
  );
  @override
  late final GeneratedColumn<String> blockId = GeneratedColumn<String>(
    'block_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageIdMeta = const VerificationMeta('pageId');
  @override
  late final GeneratedColumn<String> pageId = GeneratedColumn<String>(
    'page_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('medium'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('todo'),
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _estimateMeta = const VerificationMeta(
    'estimate',
  );
  @override
  late final GeneratedColumn<String> estimate = GeneratedColumn<String>(
    'estimate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rruleMeta = const VerificationMeta('rrule');
  @override
  late final GeneratedColumn<String> rrule = GeneratedColumn<String>(
    'rrule',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtHlcMeta = const VerificationMeta(
    'createdAtHlc',
  );
  @override
  late final GeneratedColumn<String> createdAtHlc = GeneratedColumn<String>(
    'created_at_hlc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtHlcMeta = const VerificationMeta(
    'updatedAtHlc',
  );
  @override
  late final GeneratedColumn<String> updatedAtHlc = GeneratedColumn<String>(
    'updated_at_hlc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    blockId,
    pageId,
    title,
    isCompleted,
    priority,
    status,
    dueDate,
    startDate,
    estimate,
    rrule,
    tags,
    createdAtHlc,
    updatedAtHlc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<TasksTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('block_id')) {
      context.handle(
        _blockIdMeta,
        blockId.isAcceptableOrUnknown(data['block_id']!, _blockIdMeta),
      );
    } else if (isInserting) {
      context.missing(_blockIdMeta);
    }
    if (data.containsKey('page_id')) {
      context.handle(
        _pageIdMeta,
        pageId.isAcceptableOrUnknown(data['page_id']!, _pageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pageIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('estimate')) {
      context.handle(
        _estimateMeta,
        estimate.isAcceptableOrUnknown(data['estimate']!, _estimateMeta),
      );
    }
    if (data.containsKey('rrule')) {
      context.handle(
        _rruleMeta,
        rrule.isAcceptableOrUnknown(data['rrule']!, _rruleMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('created_at_hlc')) {
      context.handle(
        _createdAtHlcMeta,
        createdAtHlc.isAcceptableOrUnknown(
          data['created_at_hlc']!,
          _createdAtHlcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtHlcMeta);
    }
    if (data.containsKey('updated_at_hlc')) {
      context.handle(
        _updatedAtHlcMeta,
        updatedAtHlc.isAcceptableOrUnknown(
          data['updated_at_hlc']!,
          _updatedAtHlcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtHlcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TasksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TasksTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      blockId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}block_id'],
      )!,
      pageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}page_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      estimate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estimate'],
      ),
      rrule: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rrule'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      createdAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at_hlc'],
      )!,
      updatedAtHlc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at_hlc'],
      )!,
    );
  }

  @override
  $TasksTableTable createAlias(String alias) {
    return $TasksTableTable(attachedDatabase, alias);
  }
}

class TasksTableData extends DataClass implements Insertable<TasksTableData> {
  final String id;
  final String blockId;
  final String pageId;
  final String title;
  final bool isCompleted;
  final String priority;
  final String status;
  final DateTime? dueDate;
  final DateTime? startDate;
  final String? estimate;
  final String? rrule;
  final String? tags;
  final String createdAtHlc;
  final String updatedAtHlc;
  const TasksTableData({
    required this.id,
    required this.blockId,
    required this.pageId,
    required this.title,
    required this.isCompleted,
    required this.priority,
    required this.status,
    this.dueDate,
    this.startDate,
    this.estimate,
    this.rrule,
    this.tags,
    required this.createdAtHlc,
    required this.updatedAtHlc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['block_id'] = Variable<String>(blockId);
    map['page_id'] = Variable<String>(pageId);
    map['title'] = Variable<String>(title);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['priority'] = Variable<String>(priority);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || estimate != null) {
      map['estimate'] = Variable<String>(estimate);
    }
    if (!nullToAbsent || rrule != null) {
      map['rrule'] = Variable<String>(rrule);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    map['created_at_hlc'] = Variable<String>(createdAtHlc);
    map['updated_at_hlc'] = Variable<String>(updatedAtHlc);
    return map;
  }

  TasksTableCompanion toCompanion(bool nullToAbsent) {
    return TasksTableCompanion(
      id: Value(id),
      blockId: Value(blockId),
      pageId: Value(pageId),
      title: Value(title),
      isCompleted: Value(isCompleted),
      priority: Value(priority),
      status: Value(status),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      estimate: estimate == null && nullToAbsent
          ? const Value.absent()
          : Value(estimate),
      rrule: rrule == null && nullToAbsent
          ? const Value.absent()
          : Value(rrule),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      createdAtHlc: Value(createdAtHlc),
      updatedAtHlc: Value(updatedAtHlc),
    );
  }

  factory TasksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TasksTableData(
      id: serializer.fromJson<String>(json['id']),
      blockId: serializer.fromJson<String>(json['blockId']),
      pageId: serializer.fromJson<String>(json['pageId']),
      title: serializer.fromJson<String>(json['title']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      priority: serializer.fromJson<String>(json['priority']),
      status: serializer.fromJson<String>(json['status']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      estimate: serializer.fromJson<String?>(json['estimate']),
      rrule: serializer.fromJson<String?>(json['rrule']),
      tags: serializer.fromJson<String?>(json['tags']),
      createdAtHlc: serializer.fromJson<String>(json['createdAtHlc']),
      updatedAtHlc: serializer.fromJson<String>(json['updatedAtHlc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'blockId': serializer.toJson<String>(blockId),
      'pageId': serializer.toJson<String>(pageId),
      'title': serializer.toJson<String>(title),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'priority': serializer.toJson<String>(priority),
      'status': serializer.toJson<String>(status),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'estimate': serializer.toJson<String?>(estimate),
      'rrule': serializer.toJson<String?>(rrule),
      'tags': serializer.toJson<String?>(tags),
      'createdAtHlc': serializer.toJson<String>(createdAtHlc),
      'updatedAtHlc': serializer.toJson<String>(updatedAtHlc),
    };
  }

  TasksTableData copyWith({
    String? id,
    String? blockId,
    String? pageId,
    String? title,
    bool? isCompleted,
    String? priority,
    String? status,
    Value<DateTime?> dueDate = const Value.absent(),
    Value<DateTime?> startDate = const Value.absent(),
    Value<String?> estimate = const Value.absent(),
    Value<String?> rrule = const Value.absent(),
    Value<String?> tags = const Value.absent(),
    String? createdAtHlc,
    String? updatedAtHlc,
  }) => TasksTableData(
    id: id ?? this.id,
    blockId: blockId ?? this.blockId,
    pageId: pageId ?? this.pageId,
    title: title ?? this.title,
    isCompleted: isCompleted ?? this.isCompleted,
    priority: priority ?? this.priority,
    status: status ?? this.status,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    startDate: startDate.present ? startDate.value : this.startDate,
    estimate: estimate.present ? estimate.value : this.estimate,
    rrule: rrule.present ? rrule.value : this.rrule,
    tags: tags.present ? tags.value : this.tags,
    createdAtHlc: createdAtHlc ?? this.createdAtHlc,
    updatedAtHlc: updatedAtHlc ?? this.updatedAtHlc,
  );
  TasksTableData copyWithCompanion(TasksTableCompanion data) {
    return TasksTableData(
      id: data.id.present ? data.id.value : this.id,
      blockId: data.blockId.present ? data.blockId.value : this.blockId,
      pageId: data.pageId.present ? data.pageId.value : this.pageId,
      title: data.title.present ? data.title.value : this.title,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      priority: data.priority.present ? data.priority.value : this.priority,
      status: data.status.present ? data.status.value : this.status,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      estimate: data.estimate.present ? data.estimate.value : this.estimate,
      rrule: data.rrule.present ? data.rrule.value : this.rrule,
      tags: data.tags.present ? data.tags.value : this.tags,
      createdAtHlc: data.createdAtHlc.present
          ? data.createdAtHlc.value
          : this.createdAtHlc,
      updatedAtHlc: data.updatedAtHlc.present
          ? data.updatedAtHlc.value
          : this.updatedAtHlc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TasksTableData(')
          ..write('id: $id, ')
          ..write('blockId: $blockId, ')
          ..write('pageId: $pageId, ')
          ..write('title: $title, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('startDate: $startDate, ')
          ..write('estimate: $estimate, ')
          ..write('rrule: $rrule, ')
          ..write('tags: $tags, ')
          ..write('createdAtHlc: $createdAtHlc, ')
          ..write('updatedAtHlc: $updatedAtHlc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    blockId,
    pageId,
    title,
    isCompleted,
    priority,
    status,
    dueDate,
    startDate,
    estimate,
    rrule,
    tags,
    createdAtHlc,
    updatedAtHlc,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TasksTableData &&
          other.id == this.id &&
          other.blockId == this.blockId &&
          other.pageId == this.pageId &&
          other.title == this.title &&
          other.isCompleted == this.isCompleted &&
          other.priority == this.priority &&
          other.status == this.status &&
          other.dueDate == this.dueDate &&
          other.startDate == this.startDate &&
          other.estimate == this.estimate &&
          other.rrule == this.rrule &&
          other.tags == this.tags &&
          other.createdAtHlc == this.createdAtHlc &&
          other.updatedAtHlc == this.updatedAtHlc);
}

class TasksTableCompanion extends UpdateCompanion<TasksTableData> {
  final Value<String> id;
  final Value<String> blockId;
  final Value<String> pageId;
  final Value<String> title;
  final Value<bool> isCompleted;
  final Value<String> priority;
  final Value<String> status;
  final Value<DateTime?> dueDate;
  final Value<DateTime?> startDate;
  final Value<String?> estimate;
  final Value<String?> rrule;
  final Value<String?> tags;
  final Value<String> createdAtHlc;
  final Value<String> updatedAtHlc;
  final Value<int> rowid;
  const TasksTableCompanion({
    this.id = const Value.absent(),
    this.blockId = const Value.absent(),
    this.pageId = const Value.absent(),
    this.title = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.startDate = const Value.absent(),
    this.estimate = const Value.absent(),
    this.rrule = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAtHlc = const Value.absent(),
    this.updatedAtHlc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksTableCompanion.insert({
    required String id,
    required String blockId,
    required String pageId,
    required String title,
    this.isCompleted = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.startDate = const Value.absent(),
    this.estimate = const Value.absent(),
    this.rrule = const Value.absent(),
    this.tags = const Value.absent(),
    required String createdAtHlc,
    required String updatedAtHlc,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       blockId = Value(blockId),
       pageId = Value(pageId),
       title = Value(title),
       createdAtHlc = Value(createdAtHlc),
       updatedAtHlc = Value(updatedAtHlc);
  static Insertable<TasksTableData> custom({
    Expression<String>? id,
    Expression<String>? blockId,
    Expression<String>? pageId,
    Expression<String>? title,
    Expression<bool>? isCompleted,
    Expression<String>? priority,
    Expression<String>? status,
    Expression<DateTime>? dueDate,
    Expression<DateTime>? startDate,
    Expression<String>? estimate,
    Expression<String>? rrule,
    Expression<String>? tags,
    Expression<String>? createdAtHlc,
    Expression<String>? updatedAtHlc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (blockId != null) 'block_id': blockId,
      if (pageId != null) 'page_id': pageId,
      if (title != null) 'title': title,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (priority != null) 'priority': priority,
      if (status != null) 'status': status,
      if (dueDate != null) 'due_date': dueDate,
      if (startDate != null) 'start_date': startDate,
      if (estimate != null) 'estimate': estimate,
      if (rrule != null) 'rrule': rrule,
      if (tags != null) 'tags': tags,
      if (createdAtHlc != null) 'created_at_hlc': createdAtHlc,
      if (updatedAtHlc != null) 'updated_at_hlc': updatedAtHlc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksTableCompanion copyWith({
    Value<String>? id,
    Value<String>? blockId,
    Value<String>? pageId,
    Value<String>? title,
    Value<bool>? isCompleted,
    Value<String>? priority,
    Value<String>? status,
    Value<DateTime?>? dueDate,
    Value<DateTime?>? startDate,
    Value<String?>? estimate,
    Value<String?>? rrule,
    Value<String?>? tags,
    Value<String>? createdAtHlc,
    Value<String>? updatedAtHlc,
    Value<int>? rowid,
  }) {
    return TasksTableCompanion(
      id: id ?? this.id,
      blockId: blockId ?? this.blockId,
      pageId: pageId ?? this.pageId,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      startDate: startDate ?? this.startDate,
      estimate: estimate ?? this.estimate,
      rrule: rrule ?? this.rrule,
      tags: tags ?? this.tags,
      createdAtHlc: createdAtHlc ?? this.createdAtHlc,
      updatedAtHlc: updatedAtHlc ?? this.updatedAtHlc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (blockId.present) {
      map['block_id'] = Variable<String>(blockId.value);
    }
    if (pageId.present) {
      map['page_id'] = Variable<String>(pageId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (estimate.present) {
      map['estimate'] = Variable<String>(estimate.value);
    }
    if (rrule.present) {
      map['rrule'] = Variable<String>(rrule.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (createdAtHlc.present) {
      map['created_at_hlc'] = Variable<String>(createdAtHlc.value);
    }
    if (updatedAtHlc.present) {
      map['updated_at_hlc'] = Variable<String>(updatedAtHlc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksTableCompanion(')
          ..write('id: $id, ')
          ..write('blockId: $blockId, ')
          ..write('pageId: $pageId, ')
          ..write('title: $title, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('startDate: $startDate, ')
          ..write('estimate: $estimate, ')
          ..write('rrule: $rrule, ')
          ..write('tags: $tags, ')
          ..write('createdAtHlc: $createdAtHlc, ')
          ..write('updatedAtHlc: $updatedAtHlc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BlobsTableTable extends BlobsTable
    with TableInfo<$BlobsTableTable, BlobsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BlobsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _hashMeta = const VerificationMeta('hash');
  @override
  late final GeneratedColumn<String> hash = GeneratedColumn<String>(
    'hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _byteSizeMeta = const VerificationMeta(
    'byteSize',
  );
  @override
  late final GeneratedColumn<int> byteSize = GeneratedColumn<int>(
    'byte_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originalNameMeta = const VerificationMeta(
    'originalName',
  );
  @override
  late final GeneratedColumn<String> originalName = GeneratedColumn<String>(
    'original_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _referenceCountMeta = const VerificationMeta(
    'referenceCount',
  );
  @override
  late final GeneratedColumn<int> referenceCount = GeneratedColumn<int>(
    'reference_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    hash,
    byteSize,
    mimeType,
    originalName,
    referenceCount,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blobs';
  @override
  VerificationContext validateIntegrity(
    Insertable<BlobsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('hash')) {
      context.handle(
        _hashMeta,
        hash.isAcceptableOrUnknown(data['hash']!, _hashMeta),
      );
    } else if (isInserting) {
      context.missing(_hashMeta);
    }
    if (data.containsKey('byte_size')) {
      context.handle(
        _byteSizeMeta,
        byteSize.isAcceptableOrUnknown(data['byte_size']!, _byteSizeMeta),
      );
    } else if (isInserting) {
      context.missing(_byteSizeMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    }
    if (data.containsKey('original_name')) {
      context.handle(
        _originalNameMeta,
        originalName.isAcceptableOrUnknown(
          data['original_name']!,
          _originalNameMeta,
        ),
      );
    }
    if (data.containsKey('reference_count')) {
      context.handle(
        _referenceCountMeta,
        referenceCount.isAcceptableOrUnknown(
          data['reference_count']!,
          _referenceCountMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {hash};
  @override
  BlobsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BlobsTableData(
      hash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hash'],
      )!,
      byteSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}byte_size'],
      )!,
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      ),
      originalName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_name'],
      ),
      referenceCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reference_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BlobsTableTable createAlias(String alias) {
    return $BlobsTableTable(attachedDatabase, alias);
  }
}

class BlobsTableData extends DataClass implements Insertable<BlobsTableData> {
  final String hash;
  final int byteSize;
  final String? mimeType;
  final String? originalName;
  final int referenceCount;
  final DateTime createdAt;
  const BlobsTableData({
    required this.hash,
    required this.byteSize,
    this.mimeType,
    this.originalName,
    required this.referenceCount,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['hash'] = Variable<String>(hash);
    map['byte_size'] = Variable<int>(byteSize);
    if (!nullToAbsent || mimeType != null) {
      map['mime_type'] = Variable<String>(mimeType);
    }
    if (!nullToAbsent || originalName != null) {
      map['original_name'] = Variable<String>(originalName);
    }
    map['reference_count'] = Variable<int>(referenceCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BlobsTableCompanion toCompanion(bool nullToAbsent) {
    return BlobsTableCompanion(
      hash: Value(hash),
      byteSize: Value(byteSize),
      mimeType: mimeType == null && nullToAbsent
          ? const Value.absent()
          : Value(mimeType),
      originalName: originalName == null && nullToAbsent
          ? const Value.absent()
          : Value(originalName),
      referenceCount: Value(referenceCount),
      createdAt: Value(createdAt),
    );
  }

  factory BlobsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BlobsTableData(
      hash: serializer.fromJson<String>(json['hash']),
      byteSize: serializer.fromJson<int>(json['byteSize']),
      mimeType: serializer.fromJson<String?>(json['mimeType']),
      originalName: serializer.fromJson<String?>(json['originalName']),
      referenceCount: serializer.fromJson<int>(json['referenceCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'hash': serializer.toJson<String>(hash),
      'byteSize': serializer.toJson<int>(byteSize),
      'mimeType': serializer.toJson<String?>(mimeType),
      'originalName': serializer.toJson<String?>(originalName),
      'referenceCount': serializer.toJson<int>(referenceCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BlobsTableData copyWith({
    String? hash,
    int? byteSize,
    Value<String?> mimeType = const Value.absent(),
    Value<String?> originalName = const Value.absent(),
    int? referenceCount,
    DateTime? createdAt,
  }) => BlobsTableData(
    hash: hash ?? this.hash,
    byteSize: byteSize ?? this.byteSize,
    mimeType: mimeType.present ? mimeType.value : this.mimeType,
    originalName: originalName.present ? originalName.value : this.originalName,
    referenceCount: referenceCount ?? this.referenceCount,
    createdAt: createdAt ?? this.createdAt,
  );
  BlobsTableData copyWithCompanion(BlobsTableCompanion data) {
    return BlobsTableData(
      hash: data.hash.present ? data.hash.value : this.hash,
      byteSize: data.byteSize.present ? data.byteSize.value : this.byteSize,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      originalName: data.originalName.present
          ? data.originalName.value
          : this.originalName,
      referenceCount: data.referenceCount.present
          ? data.referenceCount.value
          : this.referenceCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BlobsTableData(')
          ..write('hash: $hash, ')
          ..write('byteSize: $byteSize, ')
          ..write('mimeType: $mimeType, ')
          ..write('originalName: $originalName, ')
          ..write('referenceCount: $referenceCount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    hash,
    byteSize,
    mimeType,
    originalName,
    referenceCount,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BlobsTableData &&
          other.hash == this.hash &&
          other.byteSize == this.byteSize &&
          other.mimeType == this.mimeType &&
          other.originalName == this.originalName &&
          other.referenceCount == this.referenceCount &&
          other.createdAt == this.createdAt);
}

class BlobsTableCompanion extends UpdateCompanion<BlobsTableData> {
  final Value<String> hash;
  final Value<int> byteSize;
  final Value<String?> mimeType;
  final Value<String?> originalName;
  final Value<int> referenceCount;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const BlobsTableCompanion({
    this.hash = const Value.absent(),
    this.byteSize = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.originalName = const Value.absent(),
    this.referenceCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BlobsTableCompanion.insert({
    required String hash,
    required int byteSize,
    this.mimeType = const Value.absent(),
    this.originalName = const Value.absent(),
    this.referenceCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : hash = Value(hash),
       byteSize = Value(byteSize);
  static Insertable<BlobsTableData> custom({
    Expression<String>? hash,
    Expression<int>? byteSize,
    Expression<String>? mimeType,
    Expression<String>? originalName,
    Expression<int>? referenceCount,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (hash != null) 'hash': hash,
      if (byteSize != null) 'byte_size': byteSize,
      if (mimeType != null) 'mime_type': mimeType,
      if (originalName != null) 'original_name': originalName,
      if (referenceCount != null) 'reference_count': referenceCount,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BlobsTableCompanion copyWith({
    Value<String>? hash,
    Value<int>? byteSize,
    Value<String?>? mimeType,
    Value<String?>? originalName,
    Value<int>? referenceCount,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return BlobsTableCompanion(
      hash: hash ?? this.hash,
      byteSize: byteSize ?? this.byteSize,
      mimeType: mimeType ?? this.mimeType,
      originalName: originalName ?? this.originalName,
      referenceCount: referenceCount ?? this.referenceCount,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (hash.present) {
      map['hash'] = Variable<String>(hash.value);
    }
    if (byteSize.present) {
      map['byte_size'] = Variable<int>(byteSize.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (originalName.present) {
      map['original_name'] = Variable<String>(originalName.value);
    }
    if (referenceCount.present) {
      map['reference_count'] = Variable<int>(referenceCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlobsTableCompanion(')
          ..write('hash: $hash, ')
          ..write('byteSize: $byteSize, ')
          ..write('mimeType: $mimeType, ')
          ..write('originalName: $originalName, ')
          ..write('referenceCount: $referenceCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NotebooksTableTable notebooksTable = $NotebooksTableTable(this);
  late final $SectionsTableTable sectionsTable = $SectionsTableTable(this);
  late final $PagesTableTable pagesTable = $PagesTableTable(this);
  late final $NoteBlocksTableTable noteBlocksTable = $NoteBlocksTableTable(
    this,
  );
  late final $TasksTableTable tasksTable = $TasksTableTable(this);
  late final $BlobsTableTable blobsTable = $BlobsTableTable(this);
  late final NotesDao notesDao = NotesDao(this as AppDatabase);
  late final SearchDao searchDao = SearchDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    notebooksTable,
    sectionsTable,
    pagesTable,
    noteBlocksTable,
    tasksTable,
    blobsTable,
  ];
}

typedef $$NotebooksTableTableCreateCompanionBuilder =
    NotebooksTableCompanion Function({
      required String id,
      required String name,
      Value<String?> color,
      Value<String?> icon,
      Value<double> sortOrder,
      required String createdAtHlc,
      required String updatedAtHlc,
      Value<String?> deletedAtHlc,
      Value<int> rowid,
    });
typedef $$NotebooksTableTableUpdateCompanionBuilder =
    NotebooksTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> color,
      Value<String?> icon,
      Value<double> sortOrder,
      Value<String> createdAtHlc,
      Value<String> updatedAtHlc,
      Value<String?> deletedAtHlc,
      Value<int> rowid,
    });

class $$NotebooksTableTableFilterComposer
    extends Composer<_$AppDatabase, $NotebooksTableTable> {
  $$NotebooksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deletedAtHlc => $composableBuilder(
    column: $table.deletedAtHlc,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotebooksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NotebooksTableTable> {
  $$NotebooksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deletedAtHlc => $composableBuilder(
    column: $table.deletedAtHlc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotebooksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotebooksTableTable> {
  $$NotebooksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<double> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deletedAtHlc => $composableBuilder(
    column: $table.deletedAtHlc,
    builder: (column) => column,
  );
}

class $$NotebooksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotebooksTableTable,
          NotebooksTableData,
          $$NotebooksTableTableFilterComposer,
          $$NotebooksTableTableOrderingComposer,
          $$NotebooksTableTableAnnotationComposer,
          $$NotebooksTableTableCreateCompanionBuilder,
          $$NotebooksTableTableUpdateCompanionBuilder,
          (
            NotebooksTableData,
            BaseReferences<
              _$AppDatabase,
              $NotebooksTableTable,
              NotebooksTableData
            >,
          ),
          NotebooksTableData,
          PrefetchHooks Function()
        > {
  $$NotebooksTableTableTableManager(
    _$AppDatabase db,
    $NotebooksTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotebooksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotebooksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotebooksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<double> sortOrder = const Value.absent(),
                Value<String> createdAtHlc = const Value.absent(),
                Value<String> updatedAtHlc = const Value.absent(),
                Value<String?> deletedAtHlc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotebooksTableCompanion(
                id: id,
                name: name,
                color: color,
                icon: icon,
                sortOrder: sortOrder,
                createdAtHlc: createdAtHlc,
                updatedAtHlc: updatedAtHlc,
                deletedAtHlc: deletedAtHlc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> color = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<double> sortOrder = const Value.absent(),
                required String createdAtHlc,
                required String updatedAtHlc,
                Value<String?> deletedAtHlc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotebooksTableCompanion.insert(
                id: id,
                name: name,
                color: color,
                icon: icon,
                sortOrder: sortOrder,
                createdAtHlc: createdAtHlc,
                updatedAtHlc: updatedAtHlc,
                deletedAtHlc: deletedAtHlc,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotebooksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotebooksTableTable,
      NotebooksTableData,
      $$NotebooksTableTableFilterComposer,
      $$NotebooksTableTableOrderingComposer,
      $$NotebooksTableTableAnnotationComposer,
      $$NotebooksTableTableCreateCompanionBuilder,
      $$NotebooksTableTableUpdateCompanionBuilder,
      (
        NotebooksTableData,
        BaseReferences<_$AppDatabase, $NotebooksTableTable, NotebooksTableData>,
      ),
      NotebooksTableData,
      PrefetchHooks Function()
    >;
typedef $$SectionsTableTableCreateCompanionBuilder =
    SectionsTableCompanion Function({
      required String id,
      required String notebookId,
      required String name,
      Value<String?> color,
      Value<double> sortOrder,
      required String createdAtHlc,
      required String updatedAtHlc,
      Value<String?> deletedAtHlc,
      Value<int> rowid,
    });
typedef $$SectionsTableTableUpdateCompanionBuilder =
    SectionsTableCompanion Function({
      Value<String> id,
      Value<String> notebookId,
      Value<String> name,
      Value<String?> color,
      Value<double> sortOrder,
      Value<String> createdAtHlc,
      Value<String> updatedAtHlc,
      Value<String?> deletedAtHlc,
      Value<int> rowid,
    });

class $$SectionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SectionsTableTable> {
  $$SectionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notebookId => $composableBuilder(
    column: $table.notebookId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deletedAtHlc => $composableBuilder(
    column: $table.deletedAtHlc,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SectionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SectionsTableTable> {
  $$SectionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notebookId => $composableBuilder(
    column: $table.notebookId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deletedAtHlc => $composableBuilder(
    column: $table.deletedAtHlc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SectionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SectionsTableTable> {
  $$SectionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get notebookId => $composableBuilder(
    column: $table.notebookId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<double> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deletedAtHlc => $composableBuilder(
    column: $table.deletedAtHlc,
    builder: (column) => column,
  );
}

class $$SectionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SectionsTableTable,
          SectionsTableData,
          $$SectionsTableTableFilterComposer,
          $$SectionsTableTableOrderingComposer,
          $$SectionsTableTableAnnotationComposer,
          $$SectionsTableTableCreateCompanionBuilder,
          $$SectionsTableTableUpdateCompanionBuilder,
          (
            SectionsTableData,
            BaseReferences<
              _$AppDatabase,
              $SectionsTableTable,
              SectionsTableData
            >,
          ),
          SectionsTableData,
          PrefetchHooks Function()
        > {
  $$SectionsTableTableTableManager(_$AppDatabase db, $SectionsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SectionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SectionsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SectionsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> notebookId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<double> sortOrder = const Value.absent(),
                Value<String> createdAtHlc = const Value.absent(),
                Value<String> updatedAtHlc = const Value.absent(),
                Value<String?> deletedAtHlc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SectionsTableCompanion(
                id: id,
                notebookId: notebookId,
                name: name,
                color: color,
                sortOrder: sortOrder,
                createdAtHlc: createdAtHlc,
                updatedAtHlc: updatedAtHlc,
                deletedAtHlc: deletedAtHlc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String notebookId,
                required String name,
                Value<String?> color = const Value.absent(),
                Value<double> sortOrder = const Value.absent(),
                required String createdAtHlc,
                required String updatedAtHlc,
                Value<String?> deletedAtHlc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SectionsTableCompanion.insert(
                id: id,
                notebookId: notebookId,
                name: name,
                color: color,
                sortOrder: sortOrder,
                createdAtHlc: createdAtHlc,
                updatedAtHlc: updatedAtHlc,
                deletedAtHlc: deletedAtHlc,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SectionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SectionsTableTable,
      SectionsTableData,
      $$SectionsTableTableFilterComposer,
      $$SectionsTableTableOrderingComposer,
      $$SectionsTableTableAnnotationComposer,
      $$SectionsTableTableCreateCompanionBuilder,
      $$SectionsTableTableUpdateCompanionBuilder,
      (
        SectionsTableData,
        BaseReferences<_$AppDatabase, $SectionsTableTable, SectionsTableData>,
      ),
      SectionsTableData,
      PrefetchHooks Function()
    >;
typedef $$PagesTableTableCreateCompanionBuilder =
    PagesTableCompanion Function({
      required String id,
      required String sectionId,
      required String title,
      Value<bool> isPinned,
      Value<double> sortOrder,
      required String createdAtHlc,
      required String updatedAtHlc,
      Value<String?> deletedAtHlc,
      Value<int> rowid,
    });
typedef $$PagesTableTableUpdateCompanionBuilder =
    PagesTableCompanion Function({
      Value<String> id,
      Value<String> sectionId,
      Value<String> title,
      Value<bool> isPinned,
      Value<double> sortOrder,
      Value<String> createdAtHlc,
      Value<String> updatedAtHlc,
      Value<String?> deletedAtHlc,
      Value<int> rowid,
    });

class $$PagesTableTableFilterComposer
    extends Composer<_$AppDatabase, $PagesTableTable> {
  $$PagesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sectionId => $composableBuilder(
    column: $table.sectionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deletedAtHlc => $composableBuilder(
    column: $table.deletedAtHlc,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PagesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PagesTableTable> {
  $$PagesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sectionId => $composableBuilder(
    column: $table.sectionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deletedAtHlc => $composableBuilder(
    column: $table.deletedAtHlc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PagesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PagesTableTable> {
  $$PagesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sectionId =>
      $composableBuilder(column: $table.sectionId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isPinned =>
      $composableBuilder(column: $table.isPinned, builder: (column) => column);

  GeneratedColumn<double> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deletedAtHlc => $composableBuilder(
    column: $table.deletedAtHlc,
    builder: (column) => column,
  );
}

class $$PagesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PagesTableTable,
          PagesTableData,
          $$PagesTableTableFilterComposer,
          $$PagesTableTableOrderingComposer,
          $$PagesTableTableAnnotationComposer,
          $$PagesTableTableCreateCompanionBuilder,
          $$PagesTableTableUpdateCompanionBuilder,
          (
            PagesTableData,
            BaseReferences<_$AppDatabase, $PagesTableTable, PagesTableData>,
          ),
          PagesTableData,
          PrefetchHooks Function()
        > {
  $$PagesTableTableTableManager(_$AppDatabase db, $PagesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PagesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PagesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PagesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sectionId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<double> sortOrder = const Value.absent(),
                Value<String> createdAtHlc = const Value.absent(),
                Value<String> updatedAtHlc = const Value.absent(),
                Value<String?> deletedAtHlc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PagesTableCompanion(
                id: id,
                sectionId: sectionId,
                title: title,
                isPinned: isPinned,
                sortOrder: sortOrder,
                createdAtHlc: createdAtHlc,
                updatedAtHlc: updatedAtHlc,
                deletedAtHlc: deletedAtHlc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sectionId,
                required String title,
                Value<bool> isPinned = const Value.absent(),
                Value<double> sortOrder = const Value.absent(),
                required String createdAtHlc,
                required String updatedAtHlc,
                Value<String?> deletedAtHlc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PagesTableCompanion.insert(
                id: id,
                sectionId: sectionId,
                title: title,
                isPinned: isPinned,
                sortOrder: sortOrder,
                createdAtHlc: createdAtHlc,
                updatedAtHlc: updatedAtHlc,
                deletedAtHlc: deletedAtHlc,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PagesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PagesTableTable,
      PagesTableData,
      $$PagesTableTableFilterComposer,
      $$PagesTableTableOrderingComposer,
      $$PagesTableTableAnnotationComposer,
      $$PagesTableTableCreateCompanionBuilder,
      $$PagesTableTableUpdateCompanionBuilder,
      (
        PagesTableData,
        BaseReferences<_$AppDatabase, $PagesTableTable, PagesTableData>,
      ),
      PagesTableData,
      PrefetchHooks Function()
    >;
typedef $$NoteBlocksTableTableCreateCompanionBuilder =
    NoteBlocksTableCompanion Function({
      required String id,
      required String pageId,
      required String blockType,
      Value<double> sortOrder,
      required String content,
      Value<Uint8List?> crdtState,
      required String createdAtHlc,
      required String updatedAtHlc,
      Value<String?> deletedAtHlc,
      Value<int> rowid,
    });
typedef $$NoteBlocksTableTableUpdateCompanionBuilder =
    NoteBlocksTableCompanion Function({
      Value<String> id,
      Value<String> pageId,
      Value<String> blockType,
      Value<double> sortOrder,
      Value<String> content,
      Value<Uint8List?> crdtState,
      Value<String> createdAtHlc,
      Value<String> updatedAtHlc,
      Value<String?> deletedAtHlc,
      Value<int> rowid,
    });

class $$NoteBlocksTableTableFilterComposer
    extends Composer<_$AppDatabase, $NoteBlocksTableTable> {
  $$NoteBlocksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pageId => $composableBuilder(
    column: $table.pageId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get blockType => $composableBuilder(
    column: $table.blockType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get crdtState => $composableBuilder(
    column: $table.crdtState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deletedAtHlc => $composableBuilder(
    column: $table.deletedAtHlc,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NoteBlocksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NoteBlocksTableTable> {
  $$NoteBlocksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pageId => $composableBuilder(
    column: $table.pageId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get blockType => $composableBuilder(
    column: $table.blockType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get crdtState => $composableBuilder(
    column: $table.crdtState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deletedAtHlc => $composableBuilder(
    column: $table.deletedAtHlc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NoteBlocksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoteBlocksTableTable> {
  $$NoteBlocksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pageId =>
      $composableBuilder(column: $table.pageId, builder: (column) => column);

  GeneratedColumn<String> get blockType =>
      $composableBuilder(column: $table.blockType, builder: (column) => column);

  GeneratedColumn<double> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<Uint8List> get crdtState =>
      $composableBuilder(column: $table.crdtState, builder: (column) => column);

  GeneratedColumn<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deletedAtHlc => $composableBuilder(
    column: $table.deletedAtHlc,
    builder: (column) => column,
  );
}

class $$NoteBlocksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NoteBlocksTableTable,
          NoteBlocksTableData,
          $$NoteBlocksTableTableFilterComposer,
          $$NoteBlocksTableTableOrderingComposer,
          $$NoteBlocksTableTableAnnotationComposer,
          $$NoteBlocksTableTableCreateCompanionBuilder,
          $$NoteBlocksTableTableUpdateCompanionBuilder,
          (
            NoteBlocksTableData,
            BaseReferences<
              _$AppDatabase,
              $NoteBlocksTableTable,
              NoteBlocksTableData
            >,
          ),
          NoteBlocksTableData,
          PrefetchHooks Function()
        > {
  $$NoteBlocksTableTableTableManager(
    _$AppDatabase db,
    $NoteBlocksTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteBlocksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteBlocksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteBlocksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pageId = const Value.absent(),
                Value<String> blockType = const Value.absent(),
                Value<double> sortOrder = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<Uint8List?> crdtState = const Value.absent(),
                Value<String> createdAtHlc = const Value.absent(),
                Value<String> updatedAtHlc = const Value.absent(),
                Value<String?> deletedAtHlc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NoteBlocksTableCompanion(
                id: id,
                pageId: pageId,
                blockType: blockType,
                sortOrder: sortOrder,
                content: content,
                crdtState: crdtState,
                createdAtHlc: createdAtHlc,
                updatedAtHlc: updatedAtHlc,
                deletedAtHlc: deletedAtHlc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String pageId,
                required String blockType,
                Value<double> sortOrder = const Value.absent(),
                required String content,
                Value<Uint8List?> crdtState = const Value.absent(),
                required String createdAtHlc,
                required String updatedAtHlc,
                Value<String?> deletedAtHlc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NoteBlocksTableCompanion.insert(
                id: id,
                pageId: pageId,
                blockType: blockType,
                sortOrder: sortOrder,
                content: content,
                crdtState: crdtState,
                createdAtHlc: createdAtHlc,
                updatedAtHlc: updatedAtHlc,
                deletedAtHlc: deletedAtHlc,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NoteBlocksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NoteBlocksTableTable,
      NoteBlocksTableData,
      $$NoteBlocksTableTableFilterComposer,
      $$NoteBlocksTableTableOrderingComposer,
      $$NoteBlocksTableTableAnnotationComposer,
      $$NoteBlocksTableTableCreateCompanionBuilder,
      $$NoteBlocksTableTableUpdateCompanionBuilder,
      (
        NoteBlocksTableData,
        BaseReferences<
          _$AppDatabase,
          $NoteBlocksTableTable,
          NoteBlocksTableData
        >,
      ),
      NoteBlocksTableData,
      PrefetchHooks Function()
    >;
typedef $$TasksTableTableCreateCompanionBuilder =
    TasksTableCompanion Function({
      required String id,
      required String blockId,
      required String pageId,
      required String title,
      Value<bool> isCompleted,
      Value<String> priority,
      Value<String> status,
      Value<DateTime?> dueDate,
      Value<DateTime?> startDate,
      Value<String?> estimate,
      Value<String?> rrule,
      Value<String?> tags,
      required String createdAtHlc,
      required String updatedAtHlc,
      Value<int> rowid,
    });
typedef $$TasksTableTableUpdateCompanionBuilder =
    TasksTableCompanion Function({
      Value<String> id,
      Value<String> blockId,
      Value<String> pageId,
      Value<String> title,
      Value<bool> isCompleted,
      Value<String> priority,
      Value<String> status,
      Value<DateTime?> dueDate,
      Value<DateTime?> startDate,
      Value<String?> estimate,
      Value<String?> rrule,
      Value<String?> tags,
      Value<String> createdAtHlc,
      Value<String> updatedAtHlc,
      Value<int> rowid,
    });

class $$TasksTableTableFilterComposer
    extends Composer<_$AppDatabase, $TasksTableTable> {
  $$TasksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get blockId => $composableBuilder(
    column: $table.blockId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pageId => $composableBuilder(
    column: $table.pageId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get estimate => $composableBuilder(
    column: $table.estimate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rrule => $composableBuilder(
    column: $table.rrule,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TasksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTableTable> {
  $$TasksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get blockId => $composableBuilder(
    column: $table.blockId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pageId => $composableBuilder(
    column: $table.pageId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estimate => $composableBuilder(
    column: $table.estimate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rrule => $composableBuilder(
    column: $table.rrule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TasksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTableTable> {
  $$TasksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get blockId =>
      $composableBuilder(column: $table.blockId, builder: (column) => column);

  GeneratedColumn<String> get pageId =>
      $composableBuilder(column: $table.pageId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<String> get estimate =>
      $composableBuilder(column: $table.estimate, builder: (column) => column);

  GeneratedColumn<String> get rrule =>
      $composableBuilder(column: $table.rrule, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get createdAtHlc => $composableBuilder(
    column: $table.createdAtHlc,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedAtHlc => $composableBuilder(
    column: $table.updatedAtHlc,
    builder: (column) => column,
  );
}

class $$TasksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTableTable,
          TasksTableData,
          $$TasksTableTableFilterComposer,
          $$TasksTableTableOrderingComposer,
          $$TasksTableTableAnnotationComposer,
          $$TasksTableTableCreateCompanionBuilder,
          $$TasksTableTableUpdateCompanionBuilder,
          (
            TasksTableData,
            BaseReferences<_$AppDatabase, $TasksTableTable, TasksTableData>,
          ),
          TasksTableData,
          PrefetchHooks Function()
        > {
  $$TasksTableTableTableManager(_$AppDatabase db, $TasksTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> blockId = const Value.absent(),
                Value<String> pageId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<String?> estimate = const Value.absent(),
                Value<String?> rrule = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String> createdAtHlc = const Value.absent(),
                Value<String> updatedAtHlc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksTableCompanion(
                id: id,
                blockId: blockId,
                pageId: pageId,
                title: title,
                isCompleted: isCompleted,
                priority: priority,
                status: status,
                dueDate: dueDate,
                startDate: startDate,
                estimate: estimate,
                rrule: rrule,
                tags: tags,
                createdAtHlc: createdAtHlc,
                updatedAtHlc: updatedAtHlc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String blockId,
                required String pageId,
                required String title,
                Value<bool> isCompleted = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<String?> estimate = const Value.absent(),
                Value<String?> rrule = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                required String createdAtHlc,
                required String updatedAtHlc,
                Value<int> rowid = const Value.absent(),
              }) => TasksTableCompanion.insert(
                id: id,
                blockId: blockId,
                pageId: pageId,
                title: title,
                isCompleted: isCompleted,
                priority: priority,
                status: status,
                dueDate: dueDate,
                startDate: startDate,
                estimate: estimate,
                rrule: rrule,
                tags: tags,
                createdAtHlc: createdAtHlc,
                updatedAtHlc: updatedAtHlc,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TasksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTableTable,
      TasksTableData,
      $$TasksTableTableFilterComposer,
      $$TasksTableTableOrderingComposer,
      $$TasksTableTableAnnotationComposer,
      $$TasksTableTableCreateCompanionBuilder,
      $$TasksTableTableUpdateCompanionBuilder,
      (
        TasksTableData,
        BaseReferences<_$AppDatabase, $TasksTableTable, TasksTableData>,
      ),
      TasksTableData,
      PrefetchHooks Function()
    >;
typedef $$BlobsTableTableCreateCompanionBuilder =
    BlobsTableCompanion Function({
      required String hash,
      required int byteSize,
      Value<String?> mimeType,
      Value<String?> originalName,
      Value<int> referenceCount,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$BlobsTableTableUpdateCompanionBuilder =
    BlobsTableCompanion Function({
      Value<String> hash,
      Value<int> byteSize,
      Value<String?> mimeType,
      Value<String?> originalName,
      Value<int> referenceCount,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$BlobsTableTableFilterComposer
    extends Composer<_$AppDatabase, $BlobsTableTable> {
  $$BlobsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get hash => $composableBuilder(
    column: $table.hash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get byteSize => $composableBuilder(
    column: $table.byteSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalName => $composableBuilder(
    column: $table.originalName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get referenceCount => $composableBuilder(
    column: $table.referenceCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BlobsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BlobsTableTable> {
  $$BlobsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get hash => $composableBuilder(
    column: $table.hash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get byteSize => $composableBuilder(
    column: $table.byteSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalName => $composableBuilder(
    column: $table.originalName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get referenceCount => $composableBuilder(
    column: $table.referenceCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BlobsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BlobsTableTable> {
  $$BlobsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get hash =>
      $composableBuilder(column: $table.hash, builder: (column) => column);

  GeneratedColumn<int> get byteSize =>
      $composableBuilder(column: $table.byteSize, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<String> get originalName => $composableBuilder(
    column: $table.originalName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get referenceCount => $composableBuilder(
    column: $table.referenceCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BlobsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BlobsTableTable,
          BlobsTableData,
          $$BlobsTableTableFilterComposer,
          $$BlobsTableTableOrderingComposer,
          $$BlobsTableTableAnnotationComposer,
          $$BlobsTableTableCreateCompanionBuilder,
          $$BlobsTableTableUpdateCompanionBuilder,
          (
            BlobsTableData,
            BaseReferences<_$AppDatabase, $BlobsTableTable, BlobsTableData>,
          ),
          BlobsTableData,
          PrefetchHooks Function()
        > {
  $$BlobsTableTableTableManager(_$AppDatabase db, $BlobsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BlobsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BlobsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BlobsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> hash = const Value.absent(),
                Value<int> byteSize = const Value.absent(),
                Value<String?> mimeType = const Value.absent(),
                Value<String?> originalName = const Value.absent(),
                Value<int> referenceCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BlobsTableCompanion(
                hash: hash,
                byteSize: byteSize,
                mimeType: mimeType,
                originalName: originalName,
                referenceCount: referenceCount,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String hash,
                required int byteSize,
                Value<String?> mimeType = const Value.absent(),
                Value<String?> originalName = const Value.absent(),
                Value<int> referenceCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BlobsTableCompanion.insert(
                hash: hash,
                byteSize: byteSize,
                mimeType: mimeType,
                originalName: originalName,
                referenceCount: referenceCount,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BlobsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BlobsTableTable,
      BlobsTableData,
      $$BlobsTableTableFilterComposer,
      $$BlobsTableTableOrderingComposer,
      $$BlobsTableTableAnnotationComposer,
      $$BlobsTableTableCreateCompanionBuilder,
      $$BlobsTableTableUpdateCompanionBuilder,
      (
        BlobsTableData,
        BaseReferences<_$AppDatabase, $BlobsTableTable, BlobsTableData>,
      ),
      BlobsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NotebooksTableTableTableManager get notebooksTable =>
      $$NotebooksTableTableTableManager(_db, _db.notebooksTable);
  $$SectionsTableTableTableManager get sectionsTable =>
      $$SectionsTableTableTableManager(_db, _db.sectionsTable);
  $$PagesTableTableTableManager get pagesTable =>
      $$PagesTableTableTableManager(_db, _db.pagesTable);
  $$NoteBlocksTableTableTableManager get noteBlocksTable =>
      $$NoteBlocksTableTableTableManager(_db, _db.noteBlocksTable);
  $$TasksTableTableTableManager get tasksTable =>
      $$TasksTableTableTableManager(_db, _db.tasksTable);
  $$BlobsTableTableTableManager get blobsTable =>
      $$BlobsTableTableTableManager(_db, _db.blobsTable);
}
