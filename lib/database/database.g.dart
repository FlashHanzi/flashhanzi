// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CharacterCardsTable extends CharacterCards
    with TableInfo<$CharacterCardsTable, CharacterCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _characterMeta = const VerificationMeta(
    'character',
  );
  @override
  late final GeneratedColumn<String> character = GeneratedColumn<String>(
    'character',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pinyinMeta = const VerificationMeta('pinyin');
  @override
  late final GeneratedColumn<String> pinyin = GeneratedColumn<String>(
    'pinyin',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _definitionMeta = const VerificationMeta(
    'definition',
  );
  @override
  late final GeneratedColumn<String> definition = GeneratedColumn<String>(
    'definition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _intervalMeta = const VerificationMeta(
    'interval',
  );
  @override
  late final GeneratedColumn<int> interval = GeneratedColumn<int>(
    'interval',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _repetitionMeta = const VerificationMeta(
    'repetition',
  );
  @override
  late final GeneratedColumn<int> repetition = GeneratedColumn<int>(
    'repetition',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _easeFactorMeta = const VerificationMeta(
    'easeFactor',
  );
  @override
  late final GeneratedColumn<double> easeFactor = GeneratedColumn<double>(
    'ease_factor',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(2.5),
  );
  static const VerificationMeta _nextReviewMeta = const VerificationMeta(
    'nextReview',
  );
  @override
  late final GeneratedColumn<DateTime> nextReview = GeneratedColumn<DateTime>(
    'next_review',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    character,
    pinyin,
    definition,
    interval,
    repetition,
    easeFactor,
    nextReview,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_cards';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterCard> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character')) {
      context.handle(
        _characterMeta,
        character.isAcceptableOrUnknown(data['character']!, _characterMeta),
      );
    } else if (isInserting) {
      context.missing(_characterMeta);
    }
    if (data.containsKey('pinyin')) {
      context.handle(
        _pinyinMeta,
        pinyin.isAcceptableOrUnknown(data['pinyin']!, _pinyinMeta),
      );
    } else if (isInserting) {
      context.missing(_pinyinMeta);
    }
    if (data.containsKey('definition')) {
      context.handle(
        _definitionMeta,
        definition.isAcceptableOrUnknown(data['definition']!, _definitionMeta),
      );
    } else if (isInserting) {
      context.missing(_definitionMeta);
    }
    if (data.containsKey('interval')) {
      context.handle(
        _intervalMeta,
        interval.isAcceptableOrUnknown(data['interval']!, _intervalMeta),
      );
    }
    if (data.containsKey('repetition')) {
      context.handle(
        _repetitionMeta,
        repetition.isAcceptableOrUnknown(data['repetition']!, _repetitionMeta),
      );
    }
    if (data.containsKey('ease_factor')) {
      context.handle(
        _easeFactorMeta,
        easeFactor.isAcceptableOrUnknown(data['ease_factor']!, _easeFactorMeta),
      );
    }
    if (data.containsKey('next_review')) {
      context.handle(
        _nextReviewMeta,
        nextReview.isAcceptableOrUnknown(data['next_review']!, _nextReviewMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {character};
  @override
  CharacterCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterCard(
      character:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}character'],
          )!,
      pinyin:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pinyin'],
          )!,
      definition:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}definition'],
          )!,
      interval:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}interval'],
          )!,
      repetition:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}repetition'],
          )!,
      easeFactor:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}ease_factor'],
          )!,
      nextReview: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_review'],
      ),
    );
  }

  @override
  $CharacterCardsTable createAlias(String alias) {
    return $CharacterCardsTable(attachedDatabase, alias);
  }
}

class CharacterCard extends DataClass implements Insertable<CharacterCard> {
  final String character;
  final String pinyin;
  final String definition;
  final int interval;
  final int repetition;
  final double easeFactor;
  final DateTime? nextReview;
  const CharacterCard({
    required this.character,
    required this.pinyin,
    required this.definition,
    required this.interval,
    required this.repetition,
    required this.easeFactor,
    this.nextReview,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character'] = Variable<String>(character);
    map['pinyin'] = Variable<String>(pinyin);
    map['definition'] = Variable<String>(definition);
    map['interval'] = Variable<int>(interval);
    map['repetition'] = Variable<int>(repetition);
    map['ease_factor'] = Variable<double>(easeFactor);
    if (!nullToAbsent || nextReview != null) {
      map['next_review'] = Variable<DateTime>(nextReview);
    }
    return map;
  }

  CharacterCardsCompanion toCompanion(bool nullToAbsent) {
    return CharacterCardsCompanion(
      character: Value(character),
      pinyin: Value(pinyin),
      definition: Value(definition),
      interval: Value(interval),
      repetition: Value(repetition),
      easeFactor: Value(easeFactor),
      nextReview:
          nextReview == null && nullToAbsent
              ? const Value.absent()
              : Value(nextReview),
    );
  }

  factory CharacterCard.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterCard(
      character: serializer.fromJson<String>(json['character']),
      pinyin: serializer.fromJson<String>(json['pinyin']),
      definition: serializer.fromJson<String>(json['definition']),
      interval: serializer.fromJson<int>(json['interval']),
      repetition: serializer.fromJson<int>(json['repetition']),
      easeFactor: serializer.fromJson<double>(json['easeFactor']),
      nextReview: serializer.fromJson<DateTime?>(json['nextReview']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'character': serializer.toJson<String>(character),
      'pinyin': serializer.toJson<String>(pinyin),
      'definition': serializer.toJson<String>(definition),
      'interval': serializer.toJson<int>(interval),
      'repetition': serializer.toJson<int>(repetition),
      'easeFactor': serializer.toJson<double>(easeFactor),
      'nextReview': serializer.toJson<DateTime?>(nextReview),
    };
  }

  CharacterCard copyWith({
    String? character,
    String? pinyin,
    String? definition,
    int? interval,
    int? repetition,
    double? easeFactor,
    Value<DateTime?> nextReview = const Value.absent(),
  }) => CharacterCard(
    character: character ?? this.character,
    pinyin: pinyin ?? this.pinyin,
    definition: definition ?? this.definition,
    interval: interval ?? this.interval,
    repetition: repetition ?? this.repetition,
    easeFactor: easeFactor ?? this.easeFactor,
    nextReview: nextReview.present ? nextReview.value : this.nextReview,
  );
  CharacterCard copyWithCompanion(CharacterCardsCompanion data) {
    return CharacterCard(
      character: data.character.present ? data.character.value : this.character,
      pinyin: data.pinyin.present ? data.pinyin.value : this.pinyin,
      definition:
          data.definition.present ? data.definition.value : this.definition,
      interval: data.interval.present ? data.interval.value : this.interval,
      repetition:
          data.repetition.present ? data.repetition.value : this.repetition,
      easeFactor:
          data.easeFactor.present ? data.easeFactor.value : this.easeFactor,
      nextReview:
          data.nextReview.present ? data.nextReview.value : this.nextReview,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterCard(')
          ..write('character: $character, ')
          ..write('pinyin: $pinyin, ')
          ..write('definition: $definition, ')
          ..write('interval: $interval, ')
          ..write('repetition: $repetition, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('nextReview: $nextReview')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    character,
    pinyin,
    definition,
    interval,
    repetition,
    easeFactor,
    nextReview,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterCard &&
          other.character == this.character &&
          other.pinyin == this.pinyin &&
          other.definition == this.definition &&
          other.interval == this.interval &&
          other.repetition == this.repetition &&
          other.easeFactor == this.easeFactor &&
          other.nextReview == this.nextReview);
}

class CharacterCardsCompanion extends UpdateCompanion<CharacterCard> {
  final Value<String> character;
  final Value<String> pinyin;
  final Value<String> definition;
  final Value<int> interval;
  final Value<int> repetition;
  final Value<double> easeFactor;
  final Value<DateTime?> nextReview;
  final Value<int> rowid;
  const CharacterCardsCompanion({
    this.character = const Value.absent(),
    this.pinyin = const Value.absent(),
    this.definition = const Value.absent(),
    this.interval = const Value.absent(),
    this.repetition = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.nextReview = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterCardsCompanion.insert({
    required String character,
    required String pinyin,
    required String definition,
    this.interval = const Value.absent(),
    this.repetition = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.nextReview = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : character = Value(character),
       pinyin = Value(pinyin),
       definition = Value(definition);
  static Insertable<CharacterCard> custom({
    Expression<String>? character,
    Expression<String>? pinyin,
    Expression<String>? definition,
    Expression<int>? interval,
    Expression<int>? repetition,
    Expression<double>? easeFactor,
    Expression<DateTime>? nextReview,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (character != null) 'character': character,
      if (pinyin != null) 'pinyin': pinyin,
      if (definition != null) 'definition': definition,
      if (interval != null) 'interval': interval,
      if (repetition != null) 'repetition': repetition,
      if (easeFactor != null) 'ease_factor': easeFactor,
      if (nextReview != null) 'next_review': nextReview,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterCardsCompanion copyWith({
    Value<String>? character,
    Value<String>? pinyin,
    Value<String>? definition,
    Value<int>? interval,
    Value<int>? repetition,
    Value<double>? easeFactor,
    Value<DateTime?>? nextReview,
    Value<int>? rowid,
  }) {
    return CharacterCardsCompanion(
      character: character ?? this.character,
      pinyin: pinyin ?? this.pinyin,
      definition: definition ?? this.definition,
      interval: interval ?? this.interval,
      repetition: repetition ?? this.repetition,
      easeFactor: easeFactor ?? this.easeFactor,
      nextReview: nextReview ?? this.nextReview,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (character.present) {
      map['character'] = Variable<String>(character.value);
    }
    if (pinyin.present) {
      map['pinyin'] = Variable<String>(pinyin.value);
    }
    if (definition.present) {
      map['definition'] = Variable<String>(definition.value);
    }
    if (interval.present) {
      map['interval'] = Variable<int>(interval.value);
    }
    if (repetition.present) {
      map['repetition'] = Variable<int>(repetition.value);
    }
    if (easeFactor.present) {
      map['ease_factor'] = Variable<double>(easeFactor.value);
    }
    if (nextReview.present) {
      map['next_review'] = Variable<DateTime>(nextReview.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterCardsCompanion(')
          ..write('character: $character, ')
          ..write('pinyin: $pinyin, ')
          ..write('definition: $definition, ')
          ..write('interval: $interval, ')
          ..write('repetition: $repetition, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('nextReview: $nextReview, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DictionaryEntriesTable extends DictionaryEntries
    with TableInfo<$DictionaryEntriesTable, DictionaryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DictionaryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _simplifiedMeta = const VerificationMeta(
    'simplified',
  );
  @override
  late final GeneratedColumn<String> simplified = GeneratedColumn<String>(
    'simplified',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _traditionalMeta = const VerificationMeta(
    'traditional',
  );
  @override
  late final GeneratedColumn<String> traditional = GeneratedColumn<String>(
    'traditional',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pinyinMeta = const VerificationMeta('pinyin');
  @override
  late final GeneratedColumn<String> pinyin = GeneratedColumn<String>(
    'pinyin',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _definitionMeta = const VerificationMeta(
    'definition',
  );
  @override
  late final GeneratedColumn<String> definition = GeneratedColumn<String>(
    'definition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pinyinPlainMeta = const VerificationMeta(
    'pinyinPlain',
  );
  @override
  late final GeneratedColumn<String> pinyinPlain = GeneratedColumn<String>(
    'pinyin_plain',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    simplified,
    traditional,
    pinyin,
    definition,
    pinyinPlain,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dictionary_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DictionaryEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('simplified')) {
      context.handle(
        _simplifiedMeta,
        simplified.isAcceptableOrUnknown(data['simplified']!, _simplifiedMeta),
      );
    } else if (isInserting) {
      context.missing(_simplifiedMeta);
    }
    if (data.containsKey('traditional')) {
      context.handle(
        _traditionalMeta,
        traditional.isAcceptableOrUnknown(
          data['traditional']!,
          _traditionalMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_traditionalMeta);
    }
    if (data.containsKey('pinyin')) {
      context.handle(
        _pinyinMeta,
        pinyin.isAcceptableOrUnknown(data['pinyin']!, _pinyinMeta),
      );
    } else if (isInserting) {
      context.missing(_pinyinMeta);
    }
    if (data.containsKey('definition')) {
      context.handle(
        _definitionMeta,
        definition.isAcceptableOrUnknown(data['definition']!, _definitionMeta),
      );
    } else if (isInserting) {
      context.missing(_definitionMeta);
    }
    if (data.containsKey('pinyin_plain')) {
      context.handle(
        _pinyinPlainMeta,
        pinyinPlain.isAcceptableOrUnknown(
          data['pinyin_plain']!,
          _pinyinPlainMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {simplified, pinyin};
  @override
  DictionaryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DictionaryEntry(
      simplified:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}simplified'],
          )!,
      traditional:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}traditional'],
          )!,
      pinyin:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pinyin'],
          )!,
      definition:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}definition'],
          )!,
      pinyinPlain: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pinyin_plain'],
      ),
    );
  }

  @override
  $DictionaryEntriesTable createAlias(String alias) {
    return $DictionaryEntriesTable(attachedDatabase, alias);
  }
}

class DictionaryEntry extends DataClass implements Insertable<DictionaryEntry> {
  final String simplified;
  final String traditional;
  final String pinyin;
  final String definition;
  final String? pinyinPlain;
  const DictionaryEntry({
    required this.simplified,
    required this.traditional,
    required this.pinyin,
    required this.definition,
    this.pinyinPlain,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['simplified'] = Variable<String>(simplified);
    map['traditional'] = Variable<String>(traditional);
    map['pinyin'] = Variable<String>(pinyin);
    map['definition'] = Variable<String>(definition);
    if (!nullToAbsent || pinyinPlain != null) {
      map['pinyin_plain'] = Variable<String>(pinyinPlain);
    }
    return map;
  }

  DictionaryEntriesCompanion toCompanion(bool nullToAbsent) {
    return DictionaryEntriesCompanion(
      simplified: Value(simplified),
      traditional: Value(traditional),
      pinyin: Value(pinyin),
      definition: Value(definition),
      pinyinPlain:
          pinyinPlain == null && nullToAbsent
              ? const Value.absent()
              : Value(pinyinPlain),
    );
  }

  factory DictionaryEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DictionaryEntry(
      simplified: serializer.fromJson<String>(json['simplified']),
      traditional: serializer.fromJson<String>(json['traditional']),
      pinyin: serializer.fromJson<String>(json['pinyin']),
      definition: serializer.fromJson<String>(json['definition']),
      pinyinPlain: serializer.fromJson<String?>(json['pinyinPlain']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'simplified': serializer.toJson<String>(simplified),
      'traditional': serializer.toJson<String>(traditional),
      'pinyin': serializer.toJson<String>(pinyin),
      'definition': serializer.toJson<String>(definition),
      'pinyinPlain': serializer.toJson<String?>(pinyinPlain),
    };
  }

  DictionaryEntry copyWith({
    String? simplified,
    String? traditional,
    String? pinyin,
    String? definition,
    Value<String?> pinyinPlain = const Value.absent(),
  }) => DictionaryEntry(
    simplified: simplified ?? this.simplified,
    traditional: traditional ?? this.traditional,
    pinyin: pinyin ?? this.pinyin,
    definition: definition ?? this.definition,
    pinyinPlain: pinyinPlain.present ? pinyinPlain.value : this.pinyinPlain,
  );
  DictionaryEntry copyWithCompanion(DictionaryEntriesCompanion data) {
    return DictionaryEntry(
      simplified:
          data.simplified.present ? data.simplified.value : this.simplified,
      traditional:
          data.traditional.present ? data.traditional.value : this.traditional,
      pinyin: data.pinyin.present ? data.pinyin.value : this.pinyin,
      definition:
          data.definition.present ? data.definition.value : this.definition,
      pinyinPlain:
          data.pinyinPlain.present ? data.pinyinPlain.value : this.pinyinPlain,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DictionaryEntry(')
          ..write('simplified: $simplified, ')
          ..write('traditional: $traditional, ')
          ..write('pinyin: $pinyin, ')
          ..write('definition: $definition, ')
          ..write('pinyinPlain: $pinyinPlain')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(simplified, traditional, pinyin, definition, pinyinPlain);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DictionaryEntry &&
          other.simplified == this.simplified &&
          other.traditional == this.traditional &&
          other.pinyin == this.pinyin &&
          other.definition == this.definition &&
          other.pinyinPlain == this.pinyinPlain);
}

class DictionaryEntriesCompanion extends UpdateCompanion<DictionaryEntry> {
  final Value<String> simplified;
  final Value<String> traditional;
  final Value<String> pinyin;
  final Value<String> definition;
  final Value<String?> pinyinPlain;
  final Value<int> rowid;
  const DictionaryEntriesCompanion({
    this.simplified = const Value.absent(),
    this.traditional = const Value.absent(),
    this.pinyin = const Value.absent(),
    this.definition = const Value.absent(),
    this.pinyinPlain = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DictionaryEntriesCompanion.insert({
    required String simplified,
    required String traditional,
    required String pinyin,
    required String definition,
    this.pinyinPlain = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : simplified = Value(simplified),
       traditional = Value(traditional),
       pinyin = Value(pinyin),
       definition = Value(definition);
  static Insertable<DictionaryEntry> custom({
    Expression<String>? simplified,
    Expression<String>? traditional,
    Expression<String>? pinyin,
    Expression<String>? definition,
    Expression<String>? pinyinPlain,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (simplified != null) 'simplified': simplified,
      if (traditional != null) 'traditional': traditional,
      if (pinyin != null) 'pinyin': pinyin,
      if (definition != null) 'definition': definition,
      if (pinyinPlain != null) 'pinyin_plain': pinyinPlain,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DictionaryEntriesCompanion copyWith({
    Value<String>? simplified,
    Value<String>? traditional,
    Value<String>? pinyin,
    Value<String>? definition,
    Value<String?>? pinyinPlain,
    Value<int>? rowid,
  }) {
    return DictionaryEntriesCompanion(
      simplified: simplified ?? this.simplified,
      traditional: traditional ?? this.traditional,
      pinyin: pinyin ?? this.pinyin,
      definition: definition ?? this.definition,
      pinyinPlain: pinyinPlain ?? this.pinyinPlain,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (simplified.present) {
      map['simplified'] = Variable<String>(simplified.value);
    }
    if (traditional.present) {
      map['traditional'] = Variable<String>(traditional.value);
    }
    if (pinyin.present) {
      map['pinyin'] = Variable<String>(pinyin.value);
    }
    if (definition.present) {
      map['definition'] = Variable<String>(definition.value);
    }
    if (pinyinPlain.present) {
      map['pinyin_plain'] = Variable<String>(pinyinPlain.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DictionaryEntriesCompanion(')
          ..write('simplified: $simplified, ')
          ..write('traditional: $traditional, ')
          ..write('pinyin: $pinyin, ')
          ..write('definition: $definition, ')
          ..write('pinyinPlain: $pinyinPlain, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SentencePairsTable extends SentencePairs
    with TableInfo<$SentencePairsTable, SentencePair> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SentencePairsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _chineseMeta = const VerificationMeta(
    'chinese',
  );
  @override
  late final GeneratedColumn<String> chinese = GeneratedColumn<String>(
    'chinese',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _englishMeta = const VerificationMeta(
    'english',
  );
  @override
  late final GeneratedColumn<String> english = GeneratedColumn<String>(
    'english',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, chinese, english];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sentence_pairs';
  @override
  VerificationContext validateIntegrity(
    Insertable<SentencePair> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chinese')) {
      context.handle(
        _chineseMeta,
        chinese.isAcceptableOrUnknown(data['chinese']!, _chineseMeta),
      );
    } else if (isInserting) {
      context.missing(_chineseMeta);
    }
    if (data.containsKey('english')) {
      context.handle(
        _englishMeta,
        english.isAcceptableOrUnknown(data['english']!, _englishMeta),
      );
    } else if (isInserting) {
      context.missing(_englishMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SentencePair map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SentencePair(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      chinese:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}chinese'],
          )!,
      english:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}english'],
          )!,
    );
  }

  @override
  $SentencePairsTable createAlias(String alias) {
    return $SentencePairsTable(attachedDatabase, alias);
  }
}

class SentencePair extends DataClass implements Insertable<SentencePair> {
  final int id;
  final String chinese;
  final String english;
  const SentencePair({
    required this.id,
    required this.chinese,
    required this.english,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chinese'] = Variable<String>(chinese);
    map['english'] = Variable<String>(english);
    return map;
  }

  SentencePairsCompanion toCompanion(bool nullToAbsent) {
    return SentencePairsCompanion(
      id: Value(id),
      chinese: Value(chinese),
      english: Value(english),
    );
  }

  factory SentencePair.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SentencePair(
      id: serializer.fromJson<int>(json['id']),
      chinese: serializer.fromJson<String>(json['chinese']),
      english: serializer.fromJson<String>(json['english']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chinese': serializer.toJson<String>(chinese),
      'english': serializer.toJson<String>(english),
    };
  }

  SentencePair copyWith({int? id, String? chinese, String? english}) =>
      SentencePair(
        id: id ?? this.id,
        chinese: chinese ?? this.chinese,
        english: english ?? this.english,
      );
  SentencePair copyWithCompanion(SentencePairsCompanion data) {
    return SentencePair(
      id: data.id.present ? data.id.value : this.id,
      chinese: data.chinese.present ? data.chinese.value : this.chinese,
      english: data.english.present ? data.english.value : this.english,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SentencePair(')
          ..write('id: $id, ')
          ..write('chinese: $chinese, ')
          ..write('english: $english')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chinese, english);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SentencePair &&
          other.id == this.id &&
          other.chinese == this.chinese &&
          other.english == this.english);
}

class SentencePairsCompanion extends UpdateCompanion<SentencePair> {
  final Value<int> id;
  final Value<String> chinese;
  final Value<String> english;
  const SentencePairsCompanion({
    this.id = const Value.absent(),
    this.chinese = const Value.absent(),
    this.english = const Value.absent(),
  });
  SentencePairsCompanion.insert({
    this.id = const Value.absent(),
    required String chinese,
    required String english,
  }) : chinese = Value(chinese),
       english = Value(english);
  static Insertable<SentencePair> custom({
    Expression<int>? id,
    Expression<String>? chinese,
    Expression<String>? english,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chinese != null) 'chinese': chinese,
      if (english != null) 'english': english,
    });
  }

  SentencePairsCompanion copyWith({
    Value<int>? id,
    Value<String>? chinese,
    Value<String>? english,
  }) {
    return SentencePairsCompanion(
      id: id ?? this.id,
      chinese: chinese ?? this.chinese,
      english: english ?? this.english,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chinese.present) {
      map['chinese'] = Variable<String>(chinese.value);
    }
    if (english.present) {
      map['english'] = Variable<String>(english.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SentencePairsCompanion(')
          ..write('id: $id, ')
          ..write('chinese: $chinese, ')
          ..write('english: $english')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CharacterCardsTable characterCards = $CharacterCardsTable(this);
  late final $DictionaryEntriesTable dictionaryEntries =
      $DictionaryEntriesTable(this);
  late final $SentencePairsTable sentencePairs = $SentencePairsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    characterCards,
    dictionaryEntries,
    sentencePairs,
  ];
}

typedef $$CharacterCardsTableCreateCompanionBuilder =
    CharacterCardsCompanion Function({
      required String character,
      required String pinyin,
      required String definition,
      Value<int> interval,
      Value<int> repetition,
      Value<double> easeFactor,
      Value<DateTime?> nextReview,
      Value<int> rowid,
    });
typedef $$CharacterCardsTableUpdateCompanionBuilder =
    CharacterCardsCompanion Function({
      Value<String> character,
      Value<String> pinyin,
      Value<String> definition,
      Value<int> interval,
      Value<int> repetition,
      Value<double> easeFactor,
      Value<DateTime?> nextReview,
      Value<int> rowid,
    });

class $$CharacterCardsTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterCardsTable> {
  $$CharacterCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get character => $composableBuilder(
    column: $table.character,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pinyin => $composableBuilder(
    column: $table.pinyin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get interval => $composableBuilder(
    column: $table.interval,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetition => $composableBuilder(
    column: $table.repetition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextReview => $composableBuilder(
    column: $table.nextReview,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CharacterCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterCardsTable> {
  $$CharacterCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get character => $composableBuilder(
    column: $table.character,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pinyin => $composableBuilder(
    column: $table.pinyin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get interval => $composableBuilder(
    column: $table.interval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetition => $composableBuilder(
    column: $table.repetition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextReview => $composableBuilder(
    column: $table.nextReview,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CharacterCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterCardsTable> {
  $$CharacterCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get character =>
      $composableBuilder(column: $table.character, builder: (column) => column);

  GeneratedColumn<String> get pinyin =>
      $composableBuilder(column: $table.pinyin, builder: (column) => column);

  GeneratedColumn<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => column,
  );

  GeneratedColumn<int> get interval =>
      $composableBuilder(column: $table.interval, builder: (column) => column);

  GeneratedColumn<int> get repetition => $composableBuilder(
    column: $table.repetition,
    builder: (column) => column,
  );

  GeneratedColumn<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextReview => $composableBuilder(
    column: $table.nextReview,
    builder: (column) => column,
  );
}

class $$CharacterCardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterCardsTable,
          CharacterCard,
          $$CharacterCardsTableFilterComposer,
          $$CharacterCardsTableOrderingComposer,
          $$CharacterCardsTableAnnotationComposer,
          $$CharacterCardsTableCreateCompanionBuilder,
          $$CharacterCardsTableUpdateCompanionBuilder,
          (
            CharacterCard,
            BaseReferences<_$AppDatabase, $CharacterCardsTable, CharacterCard>,
          ),
          CharacterCard,
          PrefetchHooks Function()
        > {
  $$CharacterCardsTableTableManager(
    _$AppDatabase db,
    $CharacterCardsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CharacterCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$CharacterCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CharacterCardsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> character = const Value.absent(),
                Value<String> pinyin = const Value.absent(),
                Value<String> definition = const Value.absent(),
                Value<int> interval = const Value.absent(),
                Value<int> repetition = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<DateTime?> nextReview = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterCardsCompanion(
                character: character,
                pinyin: pinyin,
                definition: definition,
                interval: interval,
                repetition: repetition,
                easeFactor: easeFactor,
                nextReview: nextReview,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String character,
                required String pinyin,
                required String definition,
                Value<int> interval = const Value.absent(),
                Value<int> repetition = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<DateTime?> nextReview = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterCardsCompanion.insert(
                character: character,
                pinyin: pinyin,
                definition: definition,
                interval: interval,
                repetition: repetition,
                easeFactor: easeFactor,
                nextReview: nextReview,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CharacterCardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterCardsTable,
      CharacterCard,
      $$CharacterCardsTableFilterComposer,
      $$CharacterCardsTableOrderingComposer,
      $$CharacterCardsTableAnnotationComposer,
      $$CharacterCardsTableCreateCompanionBuilder,
      $$CharacterCardsTableUpdateCompanionBuilder,
      (
        CharacterCard,
        BaseReferences<_$AppDatabase, $CharacterCardsTable, CharacterCard>,
      ),
      CharacterCard,
      PrefetchHooks Function()
    >;
typedef $$DictionaryEntriesTableCreateCompanionBuilder =
    DictionaryEntriesCompanion Function({
      required String simplified,
      required String traditional,
      required String pinyin,
      required String definition,
      Value<String?> pinyinPlain,
      Value<int> rowid,
    });
typedef $$DictionaryEntriesTableUpdateCompanionBuilder =
    DictionaryEntriesCompanion Function({
      Value<String> simplified,
      Value<String> traditional,
      Value<String> pinyin,
      Value<String> definition,
      Value<String?> pinyinPlain,
      Value<int> rowid,
    });

class $$DictionaryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $DictionaryEntriesTable> {
  $$DictionaryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get simplified => $composableBuilder(
    column: $table.simplified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get traditional => $composableBuilder(
    column: $table.traditional,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pinyin => $composableBuilder(
    column: $table.pinyin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pinyinPlain => $composableBuilder(
    column: $table.pinyinPlain,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DictionaryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DictionaryEntriesTable> {
  $$DictionaryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get simplified => $composableBuilder(
    column: $table.simplified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get traditional => $composableBuilder(
    column: $table.traditional,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pinyin => $composableBuilder(
    column: $table.pinyin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pinyinPlain => $composableBuilder(
    column: $table.pinyinPlain,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DictionaryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DictionaryEntriesTable> {
  $$DictionaryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get simplified => $composableBuilder(
    column: $table.simplified,
    builder: (column) => column,
  );

  GeneratedColumn<String> get traditional => $composableBuilder(
    column: $table.traditional,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pinyin =>
      $composableBuilder(column: $table.pinyin, builder: (column) => column);

  GeneratedColumn<String> get definition => $composableBuilder(
    column: $table.definition,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pinyinPlain => $composableBuilder(
    column: $table.pinyinPlain,
    builder: (column) => column,
  );
}

class $$DictionaryEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DictionaryEntriesTable,
          DictionaryEntry,
          $$DictionaryEntriesTableFilterComposer,
          $$DictionaryEntriesTableOrderingComposer,
          $$DictionaryEntriesTableAnnotationComposer,
          $$DictionaryEntriesTableCreateCompanionBuilder,
          $$DictionaryEntriesTableUpdateCompanionBuilder,
          (
            DictionaryEntry,
            BaseReferences<
              _$AppDatabase,
              $DictionaryEntriesTable,
              DictionaryEntry
            >,
          ),
          DictionaryEntry,
          PrefetchHooks Function()
        > {
  $$DictionaryEntriesTableTableManager(
    _$AppDatabase db,
    $DictionaryEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DictionaryEntriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$DictionaryEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$DictionaryEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> simplified = const Value.absent(),
                Value<String> traditional = const Value.absent(),
                Value<String> pinyin = const Value.absent(),
                Value<String> definition = const Value.absent(),
                Value<String?> pinyinPlain = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DictionaryEntriesCompanion(
                simplified: simplified,
                traditional: traditional,
                pinyin: pinyin,
                definition: definition,
                pinyinPlain: pinyinPlain,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String simplified,
                required String traditional,
                required String pinyin,
                required String definition,
                Value<String?> pinyinPlain = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DictionaryEntriesCompanion.insert(
                simplified: simplified,
                traditional: traditional,
                pinyin: pinyin,
                definition: definition,
                pinyinPlain: pinyinPlain,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DictionaryEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DictionaryEntriesTable,
      DictionaryEntry,
      $$DictionaryEntriesTableFilterComposer,
      $$DictionaryEntriesTableOrderingComposer,
      $$DictionaryEntriesTableAnnotationComposer,
      $$DictionaryEntriesTableCreateCompanionBuilder,
      $$DictionaryEntriesTableUpdateCompanionBuilder,
      (
        DictionaryEntry,
        BaseReferences<_$AppDatabase, $DictionaryEntriesTable, DictionaryEntry>,
      ),
      DictionaryEntry,
      PrefetchHooks Function()
    >;
typedef $$SentencePairsTableCreateCompanionBuilder =
    SentencePairsCompanion Function({
      Value<int> id,
      required String chinese,
      required String english,
    });
typedef $$SentencePairsTableUpdateCompanionBuilder =
    SentencePairsCompanion Function({
      Value<int> id,
      Value<String> chinese,
      Value<String> english,
    });

class $$SentencePairsTableFilterComposer
    extends Composer<_$AppDatabase, $SentencePairsTable> {
  $$SentencePairsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chinese => $composableBuilder(
    column: $table.chinese,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get english => $composableBuilder(
    column: $table.english,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SentencePairsTableOrderingComposer
    extends Composer<_$AppDatabase, $SentencePairsTable> {
  $$SentencePairsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chinese => $composableBuilder(
    column: $table.chinese,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get english => $composableBuilder(
    column: $table.english,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SentencePairsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SentencePairsTable> {
  $$SentencePairsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get chinese =>
      $composableBuilder(column: $table.chinese, builder: (column) => column);

  GeneratedColumn<String> get english =>
      $composableBuilder(column: $table.english, builder: (column) => column);
}

class $$SentencePairsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SentencePairsTable,
          SentencePair,
          $$SentencePairsTableFilterComposer,
          $$SentencePairsTableOrderingComposer,
          $$SentencePairsTableAnnotationComposer,
          $$SentencePairsTableCreateCompanionBuilder,
          $$SentencePairsTableUpdateCompanionBuilder,
          (
            SentencePair,
            BaseReferences<_$AppDatabase, $SentencePairsTable, SentencePair>,
          ),
          SentencePair,
          PrefetchHooks Function()
        > {
  $$SentencePairsTableTableManager(_$AppDatabase db, $SentencePairsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SentencePairsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$SentencePairsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SentencePairsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> chinese = const Value.absent(),
                Value<String> english = const Value.absent(),
              }) => SentencePairsCompanion(
                id: id,
                chinese: chinese,
                english: english,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String chinese,
                required String english,
              }) => SentencePairsCompanion.insert(
                id: id,
                chinese: chinese,
                english: english,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SentencePairsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SentencePairsTable,
      SentencePair,
      $$SentencePairsTableFilterComposer,
      $$SentencePairsTableOrderingComposer,
      $$SentencePairsTableAnnotationComposer,
      $$SentencePairsTableCreateCompanionBuilder,
      $$SentencePairsTableUpdateCompanionBuilder,
      (
        SentencePair,
        BaseReferences<_$AppDatabase, $SentencePairsTable, SentencePair>,
      ),
      SentencePair,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CharacterCardsTableTableManager get characterCards =>
      $$CharacterCardsTableTableManager(_db, _db.characterCards);
  $$DictionaryEntriesTableTableManager get dictionaryEntries =>
      $$DictionaryEntriesTableTableManager(_db, _db.dictionaryEntries);
  $$SentencePairsTableTableManager get sentencePairs =>
      $$SentencePairsTableTableManager(_db, _db.sentencePairs);
}
