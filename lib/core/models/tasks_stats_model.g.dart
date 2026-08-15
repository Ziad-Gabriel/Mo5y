// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_stats_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTasksStatsModelCollection on Isar {
  IsarCollection<TasksStatsModel> get tasksStatsModels => this.collection();
}

const TasksStatsModelSchema = CollectionSchema(
  name: r'TasksStatsModel',
  id: 8865794898006994307,
  properties: {
    r'tasksAdded': PropertySchema(
      id: 0,
      name: r'tasksAdded',
      type: IsarType.long,
    ),
    r'tasksCompleted': PropertySchema(
      id: 1,
      name: r'tasksCompleted',
      type: IsarType.long,
    ),
    r'weekStart': PropertySchema(
      id: 2,
      name: r'weekStart',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _tasksStatsModelEstimateSize,
  serialize: _tasksStatsModelSerialize,
  deserialize: _tasksStatsModelDeserialize,
  deserializeProp: _tasksStatsModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tasksStatsModelGetId,
  getLinks: _tasksStatsModelGetLinks,
  attach: _tasksStatsModelAttach,
  version: '3.1.0+1',
);

int _tasksStatsModelEstimateSize(
  TasksStatsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _tasksStatsModelSerialize(
  TasksStatsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.tasksAdded);
  writer.writeLong(offsets[1], object.tasksCompleted);
  writer.writeDateTime(offsets[2], object.weekStart);
}

TasksStatsModel _tasksStatsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TasksStatsModel();
  object.id = id;
  object.tasksAdded = reader.readLong(offsets[0]);
  object.tasksCompleted = reader.readLong(offsets[1]);
  object.weekStart = reader.readDateTime(offsets[2]);
  return object;
}

P _tasksStatsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tasksStatsModelGetId(TasksStatsModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tasksStatsModelGetLinks(TasksStatsModel object) {
  return [];
}

void _tasksStatsModelAttach(
    IsarCollection<dynamic> col, Id id, TasksStatsModel object) {
  object.id = id;
}

extension TasksStatsModelQueryWhereSort
    on QueryBuilder<TasksStatsModel, TasksStatsModel, QWhere> {
  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TasksStatsModelQueryWhere
    on QueryBuilder<TasksStatsModel, TasksStatsModel, QWhereClause> {
  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TasksStatsModelQueryFilter
    on QueryBuilder<TasksStatsModel, TasksStatsModel, QFilterCondition> {
  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      tasksAddedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tasksAdded',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      tasksAddedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tasksAdded',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      tasksAddedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tasksAdded',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      tasksAddedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tasksAdded',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      tasksCompletedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tasksCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      tasksCompletedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tasksCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      tasksCompletedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tasksCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      tasksCompletedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tasksCompleted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      weekStartEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekStart',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      weekStartGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weekStart',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      weekStartLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weekStart',
        value: value,
      ));
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterFilterCondition>
      weekStartBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weekStart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TasksStatsModelQueryObject
    on QueryBuilder<TasksStatsModel, TasksStatsModel, QFilterCondition> {}

extension TasksStatsModelQueryLinks
    on QueryBuilder<TasksStatsModel, TasksStatsModel, QFilterCondition> {}

extension TasksStatsModelQuerySortBy
    on QueryBuilder<TasksStatsModel, TasksStatsModel, QSortBy> {
  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy>
      sortByTasksAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tasksAdded', Sort.asc);
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy>
      sortByTasksAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tasksAdded', Sort.desc);
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy>
      sortByTasksCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tasksCompleted', Sort.asc);
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy>
      sortByTasksCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tasksCompleted', Sort.desc);
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy>
      sortByWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.asc);
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy>
      sortByWeekStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.desc);
    });
  }
}

extension TasksStatsModelQuerySortThenBy
    on QueryBuilder<TasksStatsModel, TasksStatsModel, QSortThenBy> {
  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy>
      thenByTasksAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tasksAdded', Sort.asc);
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy>
      thenByTasksAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tasksAdded', Sort.desc);
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy>
      thenByTasksCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tasksCompleted', Sort.asc);
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy>
      thenByTasksCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tasksCompleted', Sort.desc);
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy>
      thenByWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.asc);
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QAfterSortBy>
      thenByWeekStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStart', Sort.desc);
    });
  }
}

extension TasksStatsModelQueryWhereDistinct
    on QueryBuilder<TasksStatsModel, TasksStatsModel, QDistinct> {
  QueryBuilder<TasksStatsModel, TasksStatsModel, QDistinct>
      distinctByTasksAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tasksAdded');
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QDistinct>
      distinctByTasksCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tasksCompleted');
    });
  }

  QueryBuilder<TasksStatsModel, TasksStatsModel, QDistinct>
      distinctByWeekStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekStart');
    });
  }
}

extension TasksStatsModelQueryProperty
    on QueryBuilder<TasksStatsModel, TasksStatsModel, QQueryProperty> {
  QueryBuilder<TasksStatsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TasksStatsModel, int, QQueryOperations> tasksAddedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tasksAdded');
    });
  }

  QueryBuilder<TasksStatsModel, int, QQueryOperations>
      tasksCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tasksCompleted');
    });
  }

  QueryBuilder<TasksStatsModel, DateTime, QQueryOperations>
      weekStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekStart');
    });
  }
}
