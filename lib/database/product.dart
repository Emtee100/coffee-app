import 'package:realm/realm.dart';

part 'product.g.dart';

@RealmModel()
class _Item {
  @PrimaryKey()
  late ObjectId id;

  late String name;
  late double price;
  late String size;
  late String tag;
  late double totalPrice;
  late String imageURL;
}

final configuration = Configuration.local([Item.schema]);
final realm = Realm(configuration);