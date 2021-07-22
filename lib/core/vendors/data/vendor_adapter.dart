import 'package:objectbox/objectbox.dart';
import '../models/models.dart';

@Entity() //Used by Obectbox. //? TODO: Better implementation?
class VendorAdapter {
  VendorAdapter({
    this.id = 0,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  static VendorAdapter fromVendor(Vendor vendor) {
    return VendorAdapter(
      id: vendor.id,
      name: vendor.name.value,
      description: vendor.description,
    );
  }

  static Vendor toVendor(VendorAdapter vendor) {
    return Vendor(
      id: vendor.id,
      name: Name(vendor.name),
      description: vendor.description,
    );
  }
}
