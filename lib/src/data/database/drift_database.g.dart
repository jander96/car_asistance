// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $AffiliatesTable extends Affiliates
    with TableInfo<$AffiliatesTable, Affiliate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AffiliatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _openTimeMeta =
      const VerificationMeta('openTime');
  @override
  late final GeneratedColumn<String> openTime = GeneratedColumn<String>(
      'open_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _closeTimeMeta =
      const VerificationMeta('closeTime');
  @override
  late final GeneratedColumn<String> closeTime = GeneratedColumn<String>(
      'close_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isFullTimeServiceMeta =
      const VerificationMeta('isFullTimeService');
  @override
  late final GeneratedColumn<bool> isFullTimeService =
      GeneratedColumn<bool>('is_full_time_service', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_full_time_service" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
      'lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longMeta = const VerificationMeta('long');
  @override
  late final GeneratedColumn<double> long = GeneratedColumn<double>(
      'long', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _servicesMeta =
      const VerificationMeta('services');
  @override
  late final GeneratedColumn<String> services = GeneratedColumn<String>(
      'services', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        openTime,
        closeTime,
        isFullTimeService,
        phoneNumber,
        rating,
        lat,
        long,
        address,
        services
      ];
  @override
  String get aliasedName => _alias ?? 'affiliates';
  @override
  String get actualTableName => 'affiliates';
  @override
  VerificationContext validateIntegrity(Insertable<Affiliate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('open_time')) {
      context.handle(_openTimeMeta,
          openTime.isAcceptableOrUnknown(data['open_time']!, _openTimeMeta));
    } else if (isInserting) {
      context.missing(_openTimeMeta);
    }
    if (data.containsKey('close_time')) {
      context.handle(_closeTimeMeta,
          closeTime.isAcceptableOrUnknown(data['close_time']!, _closeTimeMeta));
    } else if (isInserting) {
      context.missing(_closeTimeMeta);
    }
    if (data.containsKey('is_full_time_service')) {
      context.handle(
          _isFullTimeServiceMeta,
          isFullTimeService.isAcceptableOrUnknown(
              data['is_full_time_service']!, _isFullTimeServiceMeta));
    } else if (isInserting) {
      context.missing(_isFullTimeServiceMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('long')) {
      context.handle(
          _longMeta, long.isAcceptableOrUnknown(data['long']!, _longMeta));
    } else if (isInserting) {
      context.missing(_longMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('services')) {
      context.handle(_servicesMeta,
          services.isAcceptableOrUnknown(data['services']!, _servicesMeta));
    } else if (isInserting) {
      context.missing(_servicesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Affiliate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Affiliate(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      openTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}open_time'])!,
      closeTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}close_time'])!,
      isFullTimeService: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_full_time_service'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lat'])!,
      long: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}long'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      services: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}services'])!,
    );
  }

  @override
  $AffiliatesTable createAlias(String alias) {
    return $AffiliatesTable(attachedDatabase, alias);
  }
}

class Affiliate extends DataClass implements Insertable<Affiliate> {
  final String id;
  final String name;
  final String openTime;
  final String closeTime;
  final bool isFullTimeService;
  final String phoneNumber;
  final double rating;
  final double lat;
  final double long;
  final String address;
  final String services;
  const Affiliate(
      {required this.id,
      required this.name,
      required this.openTime,
      required this.closeTime,
      required this.isFullTimeService,
      required this.phoneNumber,
      required this.rating,
      required this.lat,
      required this.long,
      required this.address,
      required this.services});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['open_time'] = Variable<String>(openTime);
    map['close_time'] = Variable<String>(closeTime);
    map['is_full_time_service'] = Variable<bool>(isFullTimeService);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['rating'] = Variable<double>(rating);
    map['lat'] = Variable<double>(lat);
    map['long'] = Variable<double>(long);
    map['address'] = Variable<String>(address);
    map['services'] = Variable<String>(services);
    return map;
  }

  AffiliatesCompanion toCompanion(bool nullToAbsent) {
    return AffiliatesCompanion(
      id: Value(id),
      name: Value(name),
      openTime: Value(openTime),
      closeTime: Value(closeTime),
      isFullTimeService: Value(isFullTimeService),
      phoneNumber: Value(phoneNumber),
      rating: Value(rating),
      lat: Value(lat),
      long: Value(long),
      address: Value(address),
      services: Value(services),
    );
  }

  factory Affiliate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Affiliate(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      openTime: serializer.fromJson<String>(json['openTime']),
      closeTime: serializer.fromJson<String>(json['closeTime']),
      isFullTimeService: serializer.fromJson<bool>(json['isFullTimeService']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      rating: serializer.fromJson<double>(json['rating']),
      lat: serializer.fromJson<double>(json['lat']),
      long: serializer.fromJson<double>(json['long']),
      address: serializer.fromJson<String>(json['address']),
      services: serializer.fromJson<String>(json['services']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'openTime': serializer.toJson<String>(openTime),
      'closeTime': serializer.toJson<String>(closeTime),
      'isFullTimeService': serializer.toJson<bool>(isFullTimeService),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'rating': serializer.toJson<double>(rating),
      'lat': serializer.toJson<double>(lat),
      'long': serializer.toJson<double>(long),
      'address': serializer.toJson<String>(address),
      'services': serializer.toJson<String>(services),
    };
  }

  Affiliate copyWith(
          {String? id,
          String? name,
          String? openTime,
          String? closeTime,
          bool? isFullTimeService,
          String? phoneNumber,
          double? rating,
          double? lat,
          double? long,
          String? address,
          String? services}) =>
      Affiliate(
        id: id ?? this.id,
        name: name ?? this.name,
        openTime: openTime ?? this.openTime,
        closeTime: closeTime ?? this.closeTime,
        isFullTimeService: isFullTimeService ?? this.isFullTimeService,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        rating: rating ?? this.rating,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        address: address ?? this.address,
        services: services ?? this.services,
      );
  @override
  String toString() {
    return (StringBuffer('Affiliate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('openTime: $openTime, ')
          ..write('closeTime: $closeTime, ')
          ..write('isFullTimeService: $isFullTimeService, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('rating: $rating, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('address: $address, ')
          ..write('services: $services')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, openTime, closeTime,
      isFullTimeService, phoneNumber, rating, lat, long, address, services);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Affiliate &&
          other.id == this.id &&
          other.name == this.name &&
          other.openTime == this.openTime &&
          other.closeTime == this.closeTime &&
          other.isFullTimeService == this.isFullTimeService &&
          other.phoneNumber == this.phoneNumber &&
          other.rating == this.rating &&
          other.lat == this.lat &&
          other.long == this.long &&
          other.address == this.address &&
          other.services == this.services);
}

class AffiliatesCompanion extends UpdateCompanion<Affiliate> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> openTime;
  final Value<String> closeTime;
  final Value<bool> isFullTimeService;
  final Value<String> phoneNumber;
  final Value<double> rating;
  final Value<double> lat;
  final Value<double> long;
  final Value<String> address;
  final Value<String> services;
  final Value<int> rowid;
  const AffiliatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.openTime = const Value.absent(),
    this.closeTime = const Value.absent(),
    this.isFullTimeService = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.rating = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.address = const Value.absent(),
    this.services = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AffiliatesCompanion.insert({
    required String id,
    required String name,
    required String openTime,
    required String closeTime,
    required bool isFullTimeService,
    required String phoneNumber,
    required double rating,
    required double lat,
    required double long,
    required String address,
    required String services,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        openTime = Value(openTime),
        closeTime = Value(closeTime),
        isFullTimeService = Value(isFullTimeService),
        phoneNumber = Value(phoneNumber),
        rating = Value(rating),
        lat = Value(lat),
        long = Value(long),
        address = Value(address),
        services = Value(services);
  static Insertable<Affiliate> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? openTime,
    Expression<String>? closeTime,
    Expression<bool>? isFullTimeService,
    Expression<String>? phoneNumber,
    Expression<double>? rating,
    Expression<double>? lat,
    Expression<double>? long,
    Expression<String>? address,
    Expression<String>? services,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (openTime != null) 'open_time': openTime,
      if (closeTime != null) 'close_time': closeTime,
      if (isFullTimeService != null) 'is_full_time_service': isFullTimeService,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (rating != null) 'rating': rating,
      if (lat != null) 'lat': lat,
      if (long != null) 'long': long,
      if (address != null) 'address': address,
      if (services != null) 'services': services,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AffiliatesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? openTime,
      Value<String>? closeTime,
      Value<bool>? isFullTimeService,
      Value<String>? phoneNumber,
      Value<double>? rating,
      Value<double>? lat,
      Value<double>? long,
      Value<String>? address,
      Value<String>? services,
      Value<int>? rowid}) {
    return AffiliatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
      isFullTimeService: isFullTimeService ?? this.isFullTimeService,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rating: rating ?? this.rating,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      address: address ?? this.address,
      services: services ?? this.services,
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
    if (openTime.present) {
      map['open_time'] = Variable<String>(openTime.value);
    }
    if (closeTime.present) {
      map['close_time'] = Variable<String>(closeTime.value);
    }
    if (isFullTimeService.present) {
      map['is_full_time_service'] = Variable<bool>(isFullTimeService.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (long.present) {
      map['long'] = Variable<double>(long.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (services.present) {
      map['services'] = Variable<String>(services.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AffiliatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('openTime: $openTime, ')
          ..write('closeTime: $closeTime, ')
          ..write('isFullTimeService: $isFullTimeService, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('rating: $rating, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('address: $address, ')
          ..write('services: $services, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RatingsTable extends Ratings with TableInfo<$RatingsTable, Rating> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RatingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _affiliateIdMeta =
      const VerificationMeta('affiliateId');
  @override
  late final GeneratedColumn<String> affiliateId = GeneratedColumn<String>(
      'affiliate_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, affiliateId, rating];
  @override
  String get aliasedName => _alias ?? 'ratings';
  @override
  String get actualTableName => 'ratings';
  @override
  VerificationContext validateIntegrity(Insertable<Rating> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('affiliate_id')) {
      context.handle(
          _affiliateIdMeta,
          affiliateId.isAcceptableOrUnknown(
              data['affiliate_id']!, _affiliateIdMeta));
    } else if (isInserting) {
      context.missing(_affiliateIdMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Rating map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Rating(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      affiliateId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}affiliate_id'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating'])!,
    );
  }

  @override
  $RatingsTable createAlias(String alias) {
    return $RatingsTable(attachedDatabase, alias);
  }
}

class Rating extends DataClass implements Insertable<Rating> {
  final String id;
  final String affiliateId;
  final double rating;
  const Rating(
      {required this.id, required this.affiliateId, required this.rating});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['affiliate_id'] = Variable<String>(affiliateId);
    map['rating'] = Variable<double>(rating);
    return map;
  }

  RatingsCompanion toCompanion(bool nullToAbsent) {
    return RatingsCompanion(
      id: Value(id),
      affiliateId: Value(affiliateId),
      rating: Value(rating),
    );
  }

  factory Rating.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Rating(
      id: serializer.fromJson<String>(json['id']),
      affiliateId: serializer.fromJson<String>(json['affiliateId']),
      rating: serializer.fromJson<double>(json['rating']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'affiliateId': serializer.toJson<String>(affiliateId),
      'rating': serializer.toJson<double>(rating),
    };
  }

  Rating copyWith({String? id, String? affiliateId, double? rating}) => Rating(
        id: id ?? this.id,
        affiliateId: affiliateId ?? this.affiliateId,
        rating: rating ?? this.rating,
      );
  @override
  String toString() {
    return (StringBuffer('Rating(')
          ..write('id: $id, ')
          ..write('affiliateId: $affiliateId, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, affiliateId, rating);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rating &&
          other.id == this.id &&
          other.affiliateId == this.affiliateId &&
          other.rating == this.rating);
}

class RatingsCompanion extends UpdateCompanion<Rating> {
  final Value<String> id;
  final Value<String> affiliateId;
  final Value<double> rating;
  final Value<int> rowid;
  const RatingsCompanion({
    this.id = const Value.absent(),
    this.affiliateId = const Value.absent(),
    this.rating = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RatingsCompanion.insert({
    required String id,
    required String affiliateId,
    required double rating,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        affiliateId = Value(affiliateId),
        rating = Value(rating);
  static Insertable<Rating> custom({
    Expression<String>? id,
    Expression<String>? affiliateId,
    Expression<double>? rating,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (affiliateId != null) 'affiliate_id': affiliateId,
      if (rating != null) 'rating': rating,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RatingsCompanion copyWith(
      {Value<String>? id,
      Value<String>? affiliateId,
      Value<double>? rating,
      Value<int>? rowid}) {
    return RatingsCompanion(
      id: id ?? this.id,
      affiliateId: affiliateId ?? this.affiliateId,
      rating: rating ?? this.rating,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (affiliateId.present) {
      map['affiliate_id'] = Variable<String>(affiliateId.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RatingsCompanion(')
          ..write('id: $id, ')
          ..write('affiliateId: $affiliateId, ')
          ..write('rating: $rating, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $AffiliatesTable affiliates = $AffiliatesTable(this);
  late final $RatingsTable ratings = $RatingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [affiliates, ratings];
}
