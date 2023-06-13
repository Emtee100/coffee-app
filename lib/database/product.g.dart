// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Item extends _Item with RealmEntity, RealmObjectBase, RealmObject {
  Item(
    ObjectId id,
    String name,
    double price,
    String size,
    String tag,
    double totalPrice,
    String imageURL,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'size', size);
    RealmObjectBase.set(this, 'tag', tag);
    RealmObjectBase.set(this, 'totalPrice', totalPrice);
    RealmObjectBase.set(this, 'imageURL', imageURL);
  }

  Item._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  double get price => RealmObjectBase.get<double>(this, 'price') as double;
  @override
  set price(double value) => RealmObjectBase.set(this, 'price', value);

  @override
  String get size => RealmObjectBase.get<String>(this, 'size') as String;
  @override
  set size(String value) => RealmObjectBase.set(this, 'size', value);

  @override
  String get tag => RealmObjectBase.get<String>(this, 'tag') as String;
  @override
  set tag(String value) => RealmObjectBase.set(this, 'tag', value);

  @override
  double get totalPrice =>
      RealmObjectBase.get<double>(this, 'totalPrice') as double;
  @override
  set totalPrice(double value) =>
      RealmObjectBase.set(this, 'totalPrice', value);

  @override
  String get imageURL =>
      RealmObjectBase.get<String>(this, 'imageURL') as String;
  @override
  set imageURL(String value) => RealmObjectBase.set(this, 'imageURL', value);

  @override
  Stream<RealmObjectChanges<Item>> get changes =>
      RealmObjectBase.getChanges<Item>(this);

  @override
  Item freeze() => RealmObjectBase.freezeObject<Item>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Item._);
    return const SchemaObject(ObjectType.realmObject, Item, 'Item', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('price', RealmPropertyType.double),
      SchemaProperty('size', RealmPropertyType.string),
      SchemaProperty('tag', RealmPropertyType.string),
      SchemaProperty('totalPrice', RealmPropertyType.double),
      SchemaProperty('imageURL', RealmPropertyType.string),
    ]);
  }
}
