import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosofe_app/common/firebase_keys/firebase_keys.dart';

class AddressEntity {
  final String city;
  final String area;
  final String zone;
  final String street;
  final String buildingNumber;
  final String apartment;
  final String floorNumber;
  final String addressId;

  AddressEntity({
    this.addressId = '',
    required this.city,
    required this.area,
    required this.zone,
    required this.street,
    required this.buildingNumber,
    required this.apartment,
    required this.floorNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      FireBaseUserKeys.city: city,
      FireBaseUserKeys.area: area,
      FireBaseUserKeys.zone: zone,
      FireBaseUserKeys.street: street,
      FireBaseUserKeys.buildingNumber: buildingNumber,
      FireBaseUserKeys.apartment: apartment,
      FireBaseUserKeys.floorNumber: floorNumber,
    };
  }

  static AddressEntity fromJson(Map<String, dynamic> json, {String? id}) {
    return AddressEntity(
        city: json[FireBaseUserKeys.city].toString(),
        area: json[FireBaseUserKeys.area].toString(),
        zone: json[FireBaseUserKeys.zone].toString(),
        street: json[FireBaseUserKeys.street].toString(),
        buildingNumber: json[FireBaseUserKeys.buildingNumber].toString(),
        apartment: json[FireBaseUserKeys.apartment].toString(),
        floorNumber: json[FireBaseUserKeys.floorNumber].toString(),
        addressId: id ?? '');
  }

  static AddressEntity convert(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return AddressEntity.fromJson(data, id: snapshot.id);
  }

  @override
  String toString() {
    return 'AddressEntity{city: $city, area: $area, zone: $zone, street: $street, buildingNumber: $buildingNumber, apartment: $apartment, floorNumber: $floorNumber, addressId: $addressId}';
  }
}
