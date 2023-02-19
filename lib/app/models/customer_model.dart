class Customer {
  final String cid;
  final String name;
  final String email;
  final String avatar;
  final String phone;
  final String address;
  Customer({
    required this.cid,
    required this.name,
    required this.email,
    required this.avatar,
    required this.phone,
    required this.address,
  });

  Customer copyWith({
    String? cid,
    String? name,
    String? email,
    String? avatar,
    String? phone,
    String? address,
  }) {
    return Customer(
      cid: cid ?? this.cid,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cid': cid,
      'name': name,
      'email': email,
      'avatar': avatar,
      'phone': phone,
      'address': address,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      cid: map['cid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
    );
  }

  @override
  String toString() {
    return 'Customer(cid: $cid, name: $name, email: $email, avatar: $avatar, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(covariant Customer other) {
    if (identical(this, other)) return true;

    return other.cid == cid &&
        other.name == name &&
        other.email == email &&
        other.avatar == avatar &&
        other.phone == phone &&
        other.address == address;
  }

  @override
  int get hashCode {
    return cid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        avatar.hashCode ^
        phone.hashCode ^
        address.hashCode;
  }
}
