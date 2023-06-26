// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $AffiliatesEntitysTable extends AffiliatesEntitys
    with TableInfo<$AffiliatesEntitysTable, AffiliatesEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AffiliatesEntitysTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _openTimeMeta =
      const VerificationMeta('openTime');
  @override
  late final GeneratedColumn<String> openTime = GeneratedColumn<String>(
      'open_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _closeTimeMeta =
      const VerificationMeta('closeTime');
  @override
  late final GeneratedColumn<String> closeTime = GeneratedColumn<String>(
      'close_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        imageUrl,
        openTime,
        closeTime,
        isFullTimeService,
        phoneNumber,
        rating,
        lat,
        long,
        address,
        services,
        state
      ];
  @override
  String get aliasedName => _alias ?? 'affiliates_entitys';
  @override
  String get actualTableName => 'affiliates_entitys';
  @override
  VerificationContext validateIntegrity(Insertable<AffiliatesEntity> instance,
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
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('open_time')) {
      context.handle(_openTimeMeta,
          openTime.isAcceptableOrUnknown(data['open_time']!, _openTimeMeta));
    }
    if (data.containsKey('close_time')) {
      context.handle(_closeTimeMeta,
          closeTime.isAcceptableOrUnknown(data['close_time']!, _closeTimeMeta));
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
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AffiliatesEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AffiliatesEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      openTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}open_time']),
      closeTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}close_time']),
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
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!,
    );
  }

  @override
  $AffiliatesEntitysTable createAlias(String alias) {
    return $AffiliatesEntitysTable(attachedDatabase, alias);
  }
}

class AffiliatesEntity extends DataClass
    implements Insertable<AffiliatesEntity> {
  final String id;
  final String name;
  final String imageUrl;
  final String? openTime;
  final String? closeTime;
  final bool isFullTimeService;
  final String phoneNumber;
  final double rating;
  final double lat;
  final double long;
  final String address;
  final String services;
  final String state;
  const AffiliatesEntity(
      {required this.id,
      required this.name,
      required this.imageUrl,
      this.openTime,
      this.closeTime,
      required this.isFullTimeService,
      required this.phoneNumber,
      required this.rating,
      required this.lat,
      required this.long,
      required this.address,
      required this.services,
      required this.state});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['image_url'] = Variable<String>(imageUrl);
    if (!nullToAbsent || openTime != null) {
      map['open_time'] = Variable<String>(openTime);
    }
    if (!nullToAbsent || closeTime != null) {
      map['close_time'] = Variable<String>(closeTime);
    }
    map['is_full_time_service'] = Variable<bool>(isFullTimeService);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['rating'] = Variable<double>(rating);
    map['lat'] = Variable<double>(lat);
    map['long'] = Variable<double>(long);
    map['address'] = Variable<String>(address);
    map['services'] = Variable<String>(services);
    map['state'] = Variable<String>(state);
    return map;
  }

  AffiliatesEntitysCompanion toCompanion(bool nullToAbsent) {
    return AffiliatesEntitysCompanion(
      id: Value(id),
      name: Value(name),
      imageUrl: Value(imageUrl),
      openTime: openTime == null && nullToAbsent
          ? const Value.absent()
          : Value(openTime),
      closeTime: closeTime == null && nullToAbsent
          ? const Value.absent()
          : Value(closeTime),
      isFullTimeService: Value(isFullTimeService),
      phoneNumber: Value(phoneNumber),
      rating: Value(rating),
      lat: Value(lat),
      long: Value(long),
      address: Value(address),
      services: Value(services),
      state: Value(state),
    );
  }

  factory AffiliatesEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AffiliatesEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      openTime: serializer.fromJson<String?>(json['openTime']),
      closeTime: serializer.fromJson<String?>(json['closeTime']),
      isFullTimeService: serializer.fromJson<bool>(json['isFullTimeService']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      rating: serializer.fromJson<double>(json['rating']),
      lat: serializer.fromJson<double>(json['lat']),
      long: serializer.fromJson<double>(json['long']),
      address: serializer.fromJson<String>(json['address']),
      services: serializer.fromJson<String>(json['services']),
      state: serializer.fromJson<String>(json['state']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'openTime': serializer.toJson<String?>(openTime),
      'closeTime': serializer.toJson<String?>(closeTime),
      'isFullTimeService': serializer.toJson<bool>(isFullTimeService),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'rating': serializer.toJson<double>(rating),
      'lat': serializer.toJson<double>(lat),
      'long': serializer.toJson<double>(long),
      'address': serializer.toJson<String>(address),
      'services': serializer.toJson<String>(services),
      'state': serializer.toJson<String>(state),
    };
  }

  AffiliatesEntity copyWith(
          {String? id,
          String? name,
          String? imageUrl,
          Value<String?> openTime = const Value.absent(),
          Value<String?> closeTime = const Value.absent(),
          bool? isFullTimeService,
          String? phoneNumber,
          double? rating,
          double? lat,
          double? long,
          String? address,
          String? services,
          String? state}) =>
      AffiliatesEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        openTime: openTime.present ? openTime.value : this.openTime,
        closeTime: closeTime.present ? closeTime.value : this.closeTime,
        isFullTimeService: isFullTimeService ?? this.isFullTimeService,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        rating: rating ?? this.rating,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        address: address ?? this.address,
        services: services ?? this.services,
        state: state ?? this.state,
      );
  @override
  String toString() {
    return (StringBuffer('AffiliatesEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('openTime: $openTime, ')
          ..write('closeTime: $closeTime, ')
          ..write('isFullTimeService: $isFullTimeService, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('rating: $rating, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('address: $address, ')
          ..write('services: $services, ')
          ..write('state: $state')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      imageUrl,
      openTime,
      closeTime,
      isFullTimeService,
      phoneNumber,
      rating,
      lat,
      long,
      address,
      services,
      state);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AffiliatesEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl &&
          other.openTime == this.openTime &&
          other.closeTime == this.closeTime &&
          other.isFullTimeService == this.isFullTimeService &&
          other.phoneNumber == this.phoneNumber &&
          other.rating == this.rating &&
          other.lat == this.lat &&
          other.long == this.long &&
          other.address == this.address &&
          other.services == this.services &&
          other.state == this.state);
}

class AffiliatesEntitysCompanion extends UpdateCompanion<AffiliatesEntity> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> imageUrl;
  final Value<String?> openTime;
  final Value<String?> closeTime;
  final Value<bool> isFullTimeService;
  final Value<String> phoneNumber;
  final Value<double> rating;
  final Value<double> lat;
  final Value<double> long;
  final Value<String> address;
  final Value<String> services;
  final Value<String> state;
  final Value<int> rowid;
  const AffiliatesEntitysCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.openTime = const Value.absent(),
    this.closeTime = const Value.absent(),
    this.isFullTimeService = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.rating = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.address = const Value.absent(),
    this.services = const Value.absent(),
    this.state = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AffiliatesEntitysCompanion.insert({
    required String id,
    required String name,
    required String imageUrl,
    this.openTime = const Value.absent(),
    this.closeTime = const Value.absent(),
    required bool isFullTimeService,
    required String phoneNumber,
    required double rating,
    required double lat,
    required double long,
    required String address,
    required String services,
    required String state,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        imageUrl = Value(imageUrl),
        isFullTimeService = Value(isFullTimeService),
        phoneNumber = Value(phoneNumber),
        rating = Value(rating),
        lat = Value(lat),
        long = Value(long),
        address = Value(address),
        services = Value(services),
        state = Value(state);
  static Insertable<AffiliatesEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? imageUrl,
    Expression<String>? openTime,
    Expression<String>? closeTime,
    Expression<bool>? isFullTimeService,
    Expression<String>? phoneNumber,
    Expression<double>? rating,
    Expression<double>? lat,
    Expression<double>? long,
    Expression<String>? address,
    Expression<String>? services,
    Expression<String>? state,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (openTime != null) 'open_time': openTime,
      if (closeTime != null) 'close_time': closeTime,
      if (isFullTimeService != null) 'is_full_time_service': isFullTimeService,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (rating != null) 'rating': rating,
      if (lat != null) 'lat': lat,
      if (long != null) 'long': long,
      if (address != null) 'address': address,
      if (services != null) 'services': services,
      if (state != null) 'state': state,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AffiliatesEntitysCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? imageUrl,
      Value<String?>? openTime,
      Value<String?>? closeTime,
      Value<bool>? isFullTimeService,
      Value<String>? phoneNumber,
      Value<double>? rating,
      Value<double>? lat,
      Value<double>? long,
      Value<String>? address,
      Value<String>? services,
      Value<String>? state,
      Value<int>? rowid}) {
    return AffiliatesEntitysCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      openTime: openTime ?? this.openTime,
      closeTime: closeTime ?? this.closeTime,
      isFullTimeService: isFullTimeService ?? this.isFullTimeService,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rating: rating ?? this.rating,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      address: address ?? this.address,
      services: services ?? this.services,
      state: state ?? this.state,
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
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
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
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AffiliatesEntitysCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('openTime: $openTime, ')
          ..write('closeTime: $closeTime, ')
          ..write('isFullTimeService: $isFullTimeService, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('rating: $rating, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('address: $address, ')
          ..write('services: $services, ')
          ..write('state: $state, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RatingsEntitysTable extends RatingsEntitys
    with TableInfo<$RatingsEntitysTable, RatingsEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RatingsEntitysTable(this.attachedDatabase, [this._alias]);
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
  String get aliasedName => _alias ?? 'ratings_entitys';
  @override
  String get actualTableName => 'ratings_entitys';
  @override
  VerificationContext validateIntegrity(Insertable<RatingsEntity> instance,
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
  RatingsEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RatingsEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      affiliateId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}affiliate_id'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating'])!,
    );
  }

  @override
  $RatingsEntitysTable createAlias(String alias) {
    return $RatingsEntitysTable(attachedDatabase, alias);
  }
}

class RatingsEntity extends DataClass implements Insertable<RatingsEntity> {
  final String id;
  final String affiliateId;
  final double rating;
  const RatingsEntity(
      {required this.id, required this.affiliateId, required this.rating});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['affiliate_id'] = Variable<String>(affiliateId);
    map['rating'] = Variable<double>(rating);
    return map;
  }

  RatingsEntitysCompanion toCompanion(bool nullToAbsent) {
    return RatingsEntitysCompanion(
      id: Value(id),
      affiliateId: Value(affiliateId),
      rating: Value(rating),
    );
  }

  factory RatingsEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RatingsEntity(
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

  RatingsEntity copyWith({String? id, String? affiliateId, double? rating}) =>
      RatingsEntity(
        id: id ?? this.id,
        affiliateId: affiliateId ?? this.affiliateId,
        rating: rating ?? this.rating,
      );
  @override
  String toString() {
    return (StringBuffer('RatingsEntity(')
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
      (other is RatingsEntity &&
          other.id == this.id &&
          other.affiliateId == this.affiliateId &&
          other.rating == this.rating);
}

class RatingsEntitysCompanion extends UpdateCompanion<RatingsEntity> {
  final Value<String> id;
  final Value<String> affiliateId;
  final Value<double> rating;
  final Value<int> rowid;
  const RatingsEntitysCompanion({
    this.id = const Value.absent(),
    this.affiliateId = const Value.absent(),
    this.rating = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RatingsEntitysCompanion.insert({
    required String id,
    required String affiliateId,
    required double rating,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        affiliateId = Value(affiliateId),
        rating = Value(rating);
  static Insertable<RatingsEntity> custom({
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

  RatingsEntitysCompanion copyWith(
      {Value<String>? id,
      Value<String>? affiliateId,
      Value<double>? rating,
      Value<int>? rowid}) {
    return RatingsEntitysCompanion(
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
    return (StringBuffer('RatingsEntitysCompanion(')
          ..write('id: $id, ')
          ..write('affiliateId: $affiliateId, ')
          ..write('rating: $rating, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserEntitysTable extends UserEntitys
    with TableInfo<$UserEntitysTable, UserEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserEntitysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailVerifiedMeta =
      const VerificationMeta('emailVerified');
  @override
  late final GeneratedColumn<bool> emailVerified =
      GeneratedColumn<bool>('email_verified', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("email_verified" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isAnonymousMeta =
      const VerificationMeta('isAnonymous');
  @override
  late final GeneratedColumn<bool> isAnonymous =
      GeneratedColumn<bool>('is_anonymous', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_anonymous" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _photoURLMeta =
      const VerificationMeta('photoURL');
  @override
  late final GeneratedColumn<String> photoURL = GeneratedColumn<String>(
      'photo_u_r_l', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _refreshTokenMeta =
      const VerificationMeta('refreshToken');
  @override
  late final GeneratedColumn<String> refreshToken = GeneratedColumn<String>(
      'refresh_token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uid,
        userName,
        email,
        phoneNumber,
        emailVerified,
        isAnonymous,
        photoURL,
        refreshToken
      ];
  @override
  String get aliasedName => _alias ?? 'user_entitys';
  @override
  String get actualTableName => 'user_entitys';
  @override
  VerificationContext validateIntegrity(Insertable<UserEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('email_verified')) {
      context.handle(
          _emailVerifiedMeta,
          emailVerified.isAcceptableOrUnknown(
              data['email_verified']!, _emailVerifiedMeta));
    } else if (isInserting) {
      context.missing(_emailVerifiedMeta);
    }
    if (data.containsKey('is_anonymous')) {
      context.handle(
          _isAnonymousMeta,
          isAnonymous.isAcceptableOrUnknown(
              data['is_anonymous']!, _isAnonymousMeta));
    } else if (isInserting) {
      context.missing(_isAnonymousMeta);
    }
    if (data.containsKey('photo_u_r_l')) {
      context.handle(_photoURLMeta,
          photoURL.isAcceptableOrUnknown(data['photo_u_r_l']!, _photoURLMeta));
    } else if (isInserting) {
      context.missing(_photoURLMeta);
    }
    if (data.containsKey('refresh_token')) {
      context.handle(
          _refreshTokenMeta,
          refreshToken.isAcceptableOrUnknown(
              data['refresh_token']!, _refreshTokenMeta));
    } else if (isInserting) {
      context.missing(_refreshTokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      emailVerified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}email_verified'])!,
      isAnonymous: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_anonymous'])!,
      photoURL: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_u_r_l'])!,
      refreshToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}refresh_token'])!,
    );
  }

  @override
  $UserEntitysTable createAlias(String alias) {
    return $UserEntitysTable(attachedDatabase, alias);
  }
}

class UserEntity extends DataClass implements Insertable<UserEntity> {
  final String id;
  final String uid;
  final String userName;
  final String email;
  final String phoneNumber;
  final bool emailVerified;
  final bool isAnonymous;
  final String photoURL;
  final String refreshToken;
  const UserEntity(
      {required this.id,
      required this.uid,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.emailVerified,
      required this.isAnonymous,
      required this.photoURL,
      required this.refreshToken});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['uid'] = Variable<String>(uid);
    map['user_name'] = Variable<String>(userName);
    map['email'] = Variable<String>(email);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['email_verified'] = Variable<bool>(emailVerified);
    map['is_anonymous'] = Variable<bool>(isAnonymous);
    map['photo_u_r_l'] = Variable<String>(photoURL);
    map['refresh_token'] = Variable<String>(refreshToken);
    return map;
  }

  UserEntitysCompanion toCompanion(bool nullToAbsent) {
    return UserEntitysCompanion(
      id: Value(id),
      uid: Value(uid),
      userName: Value(userName),
      email: Value(email),
      phoneNumber: Value(phoneNumber),
      emailVerified: Value(emailVerified),
      isAnonymous: Value(isAnonymous),
      photoURL: Value(photoURL),
      refreshToken: Value(refreshToken),
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntity(
      id: serializer.fromJson<String>(json['id']),
      uid: serializer.fromJson<String>(json['uid']),
      userName: serializer.fromJson<String>(json['userName']),
      email: serializer.fromJson<String>(json['email']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      emailVerified: serializer.fromJson<bool>(json['emailVerified']),
      isAnonymous: serializer.fromJson<bool>(json['isAnonymous']),
      photoURL: serializer.fromJson<String>(json['photoURL']),
      refreshToken: serializer.fromJson<String>(json['refreshToken']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'uid': serializer.toJson<String>(uid),
      'userName': serializer.toJson<String>(userName),
      'email': serializer.toJson<String>(email),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'emailVerified': serializer.toJson<bool>(emailVerified),
      'isAnonymous': serializer.toJson<bool>(isAnonymous),
      'photoURL': serializer.toJson<String>(photoURL),
      'refreshToken': serializer.toJson<String>(refreshToken),
    };
  }

  UserEntity copyWith(
          {String? id,
          String? uid,
          String? userName,
          String? email,
          String? phoneNumber,
          bool? emailVerified,
          bool? isAnonymous,
          String? photoURL,
          String? refreshToken}) =>
      UserEntity(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        emailVerified: emailVerified ?? this.emailVerified,
        isAnonymous: isAnonymous ?? this.isAnonymous,
        photoURL: photoURL ?? this.photoURL,
        refreshToken: refreshToken ?? this.refreshToken,
      );
  @override
  String toString() {
    return (StringBuffer('UserEntity(')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('userName: $userName, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('emailVerified: $emailVerified, ')
          ..write('isAnonymous: $isAnonymous, ')
          ..write('photoURL: $photoURL, ')
          ..write('refreshToken: $refreshToken')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uid, userName, email, phoneNumber,
      emailVerified, isAnonymous, photoURL, refreshToken);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          other.id == this.id &&
          other.uid == this.uid &&
          other.userName == this.userName &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.emailVerified == this.emailVerified &&
          other.isAnonymous == this.isAnonymous &&
          other.photoURL == this.photoURL &&
          other.refreshToken == this.refreshToken);
}

class UserEntitysCompanion extends UpdateCompanion<UserEntity> {
  final Value<String> id;
  final Value<String> uid;
  final Value<String> userName;
  final Value<String> email;
  final Value<String> phoneNumber;
  final Value<bool> emailVerified;
  final Value<bool> isAnonymous;
  final Value<String> photoURL;
  final Value<String> refreshToken;
  final Value<int> rowid;
  const UserEntitysCompanion({
    this.id = const Value.absent(),
    this.uid = const Value.absent(),
    this.userName = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.emailVerified = const Value.absent(),
    this.isAnonymous = const Value.absent(),
    this.photoURL = const Value.absent(),
    this.refreshToken = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserEntitysCompanion.insert({
    required String id,
    required String uid,
    required String userName,
    required String email,
    required String phoneNumber,
    required bool emailVerified,
    required bool isAnonymous,
    required String photoURL,
    required String refreshToken,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        uid = Value(uid),
        userName = Value(userName),
        email = Value(email),
        phoneNumber = Value(phoneNumber),
        emailVerified = Value(emailVerified),
        isAnonymous = Value(isAnonymous),
        photoURL = Value(photoURL),
        refreshToken = Value(refreshToken);
  static Insertable<UserEntity> custom({
    Expression<String>? id,
    Expression<String>? uid,
    Expression<String>? userName,
    Expression<String>? email,
    Expression<String>? phoneNumber,
    Expression<bool>? emailVerified,
    Expression<bool>? isAnonymous,
    Expression<String>? photoURL,
    Expression<String>? refreshToken,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uid != null) 'uid': uid,
      if (userName != null) 'user_name': userName,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (emailVerified != null) 'email_verified': emailVerified,
      if (isAnonymous != null) 'is_anonymous': isAnonymous,
      if (photoURL != null) 'photo_u_r_l': photoURL,
      if (refreshToken != null) 'refresh_token': refreshToken,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserEntitysCompanion copyWith(
      {Value<String>? id,
      Value<String>? uid,
      Value<String>? userName,
      Value<String>? email,
      Value<String>? phoneNumber,
      Value<bool>? emailVerified,
      Value<bool>? isAnonymous,
      Value<String>? photoURL,
      Value<String>? refreshToken,
      Value<int>? rowid}) {
    return UserEntitysCompanion(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailVerified: emailVerified ?? this.emailVerified,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      photoURL: photoURL ?? this.photoURL,
      refreshToken: refreshToken ?? this.refreshToken,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (emailVerified.present) {
      map['email_verified'] = Variable<bool>(emailVerified.value);
    }
    if (isAnonymous.present) {
      map['is_anonymous'] = Variable<bool>(isAnonymous.value);
    }
    if (photoURL.present) {
      map['photo_u_r_l'] = Variable<String>(photoURL.value);
    }
    if (refreshToken.present) {
      map['refresh_token'] = Variable<String>(refreshToken.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserEntitysCompanion(')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('userName: $userName, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('emailVerified: $emailVerified, ')
          ..write('isAnonymous: $isAnonymous, ')
          ..write('photoURL: $photoURL, ')
          ..write('refreshToken: $refreshToken, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LicenseEntitysTable extends LicenseEntitys
    with TableInfo<$LicenseEntitysTable, LicenseEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LicenseEntitysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _freePeriodDateEndMeta =
      const VerificationMeta('freePeriodDateEnd');
  @override
  late final GeneratedColumn<String> freePeriodDateEnd =
      GeneratedColumn<String>('free_period_date_end', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isPayDoneMeta =
      const VerificationMeta('isPayDone');
  @override
  late final GeneratedColumn<bool> isPayDone =
      GeneratedColumn<bool>('is_pay_done', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_pay_done" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, freePeriodDateEnd, isPayDone];
  @override
  String get aliasedName => _alias ?? 'license_entitys';
  @override
  String get actualTableName => 'license_entitys';
  @override
  VerificationContext validateIntegrity(Insertable<LicenseEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('free_period_date_end')) {
      context.handle(
          _freePeriodDateEndMeta,
          freePeriodDateEnd.isAcceptableOrUnknown(
              data['free_period_date_end']!, _freePeriodDateEndMeta));
    } else if (isInserting) {
      context.missing(_freePeriodDateEndMeta);
    }
    if (data.containsKey('is_pay_done')) {
      context.handle(
          _isPayDoneMeta,
          isPayDone.isAcceptableOrUnknown(
              data['is_pay_done']!, _isPayDoneMeta));
    } else if (isInserting) {
      context.missing(_isPayDoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LicenseEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LicenseEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      freePeriodDateEnd: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}free_period_date_end'])!,
      isPayDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_pay_done'])!,
    );
  }

  @override
  $LicenseEntitysTable createAlias(String alias) {
    return $LicenseEntitysTable(attachedDatabase, alias);
  }
}

class LicenseEntity extends DataClass implements Insertable<LicenseEntity> {
  final String id;
  final String userId;
  final String freePeriodDateEnd;
  final bool isPayDone;
  const LicenseEntity(
      {required this.id,
      required this.userId,
      required this.freePeriodDateEnd,
      required this.isPayDone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['free_period_date_end'] = Variable<String>(freePeriodDateEnd);
    map['is_pay_done'] = Variable<bool>(isPayDone);
    return map;
  }

  LicenseEntitysCompanion toCompanion(bool nullToAbsent) {
    return LicenseEntitysCompanion(
      id: Value(id),
      userId: Value(userId),
      freePeriodDateEnd: Value(freePeriodDateEnd),
      isPayDone: Value(isPayDone),
    );
  }

  factory LicenseEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LicenseEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      freePeriodDateEnd: serializer.fromJson<String>(json['freePeriodDateEnd']),
      isPayDone: serializer.fromJson<bool>(json['isPayDone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'freePeriodDateEnd': serializer.toJson<String>(freePeriodDateEnd),
      'isPayDone': serializer.toJson<bool>(isPayDone),
    };
  }

  LicenseEntity copyWith(
          {String? id,
          String? userId,
          String? freePeriodDateEnd,
          bool? isPayDone}) =>
      LicenseEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        freePeriodDateEnd: freePeriodDateEnd ?? this.freePeriodDateEnd,
        isPayDone: isPayDone ?? this.isPayDone,
      );
  @override
  String toString() {
    return (StringBuffer('LicenseEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('freePeriodDateEnd: $freePeriodDateEnd, ')
          ..write('isPayDone: $isPayDone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, freePeriodDateEnd, isPayDone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LicenseEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.freePeriodDateEnd == this.freePeriodDateEnd &&
          other.isPayDone == this.isPayDone);
}

class LicenseEntitysCompanion extends UpdateCompanion<LicenseEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> freePeriodDateEnd;
  final Value<bool> isPayDone;
  final Value<int> rowid;
  const LicenseEntitysCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.freePeriodDateEnd = const Value.absent(),
    this.isPayDone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LicenseEntitysCompanion.insert({
    required String id,
    required String userId,
    required String freePeriodDateEnd,
    required bool isPayDone,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        freePeriodDateEnd = Value(freePeriodDateEnd),
        isPayDone = Value(isPayDone);
  static Insertable<LicenseEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? freePeriodDateEnd,
    Expression<bool>? isPayDone,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (freePeriodDateEnd != null) 'free_period_date_end': freePeriodDateEnd,
      if (isPayDone != null) 'is_pay_done': isPayDone,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LicenseEntitysCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? freePeriodDateEnd,
      Value<bool>? isPayDone,
      Value<int>? rowid}) {
    return LicenseEntitysCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      freePeriodDateEnd: freePeriodDateEnd ?? this.freePeriodDateEnd,
      isPayDone: isPayDone ?? this.isPayDone,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (freePeriodDateEnd.present) {
      map['free_period_date_end'] = Variable<String>(freePeriodDateEnd.value);
    }
    if (isPayDone.present) {
      map['is_pay_done'] = Variable<bool>(isPayDone.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LicenseEntitysCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('freePeriodDateEnd: $freePeriodDateEnd, ')
          ..write('isPayDone: $isPayDone, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _affiliateIdMeta =
      const VerificationMeta('affiliateId');
  @override
  late final GeneratedColumn<String> affiliateId = GeneratedColumn<String>(
      'affiliate_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [affiliateId];
  @override
  String get aliasedName => _alias ?? 'favorites';
  @override
  String get actualTableName => 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('affiliate_id')) {
      context.handle(
          _affiliateIdMeta,
          affiliateId.isAcceptableOrUnknown(
              data['affiliate_id']!, _affiliateIdMeta));
    } else if (isInserting) {
      context.missing(_affiliateIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      affiliateId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}affiliate_id'])!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final String affiliateId;
  const Favorite({required this.affiliateId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['affiliate_id'] = Variable<String>(affiliateId);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      affiliateId: Value(affiliateId),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      affiliateId: serializer.fromJson<String>(json['affiliateId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'affiliateId': serializer.toJson<String>(affiliateId),
    };
  }

  Favorite copyWith({String? affiliateId}) => Favorite(
        affiliateId: affiliateId ?? this.affiliateId,
      );
  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('affiliateId: $affiliateId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => affiliateId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite && other.affiliateId == this.affiliateId);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<String> affiliateId;
  final Value<int> rowid;
  const FavoritesCompanion({
    this.affiliateId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoritesCompanion.insert({
    required String affiliateId,
    this.rowid = const Value.absent(),
  }) : affiliateId = Value(affiliateId);
  static Insertable<Favorite> custom({
    Expression<String>? affiliateId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (affiliateId != null) 'affiliate_id': affiliateId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoritesCompanion copyWith({Value<String>? affiliateId, Value<int>? rowid}) {
    return FavoritesCompanion(
      affiliateId: affiliateId ?? this.affiliateId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (affiliateId.present) {
      map['affiliate_id'] = Variable<String>(affiliateId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('affiliateId: $affiliateId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $AffiliatesEntitysTable affiliatesEntitys =
      $AffiliatesEntitysTable(this);
  late final $RatingsEntitysTable ratingsEntitys = $RatingsEntitysTable(this);
  late final $UserEntitysTable userEntitys = $UserEntitysTable(this);
  late final $LicenseEntitysTable licenseEntitys = $LicenseEntitysTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        affiliatesEntitys,
        ratingsEntitys,
        userEntitys,
        licenseEntitys,
        favorites
      ];
}
