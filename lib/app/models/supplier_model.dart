class Supplier {
  final String sid;
  final String storeName;
  final String storeBanner;
  final String storeLogo;
  final String storeEmail;
  final String storePhone;
  final String storeWebsite;
  Supplier({
    required this.sid,
    required this.storeName,
    required this.storeBanner,
    required this.storeLogo,
    required this.storeEmail,
    required this.storePhone,
    required this.storeWebsite,
  });

  Supplier copyWith({
    String? sid,
    String? storeName,
    String? storeBanner,
    String? storeLogo,
    String? storeEmail,
    String? storePhone,
    String? storeWebsite,
  }) {
    return Supplier(
      sid: sid ?? this.sid,
      storeName: storeName ?? this.storeName,
      storeBanner: storeBanner ?? this.storeBanner,
      storeLogo: storeLogo ?? this.storeLogo,
      storeEmail: storeEmail ?? this.storeEmail,
      storePhone: storePhone ?? this.storePhone,
      storeWebsite: storeWebsite ?? this.storeWebsite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sid': sid,
      'storeName': storeName,
      'storeBanner': storeBanner,
      'storeLogo': storeLogo,
      'storeEmail': storeEmail,
      'storePhone': storePhone,
      'storeWebsite': storeWebsite,
    };
  }

  factory Supplier.fromMap(Map<String, dynamic> map) {
    return Supplier(
      sid: map['sid'] as String,
      storeName: map['storeName'] as String,
      storeBanner: map['storeBanner'] as String,
      storeLogo: map['storeLogo'] as String,
      storeEmail: map['storeEmail'] as String,
      storePhone: map['storePhone'] as String,
      storeWebsite: map['storeWebsite'] as String,
    );
  }

  @override
  String toString() {
    return 'Supplier(sid: $sid, storeName: $storeName, storeBanner: $storeBanner, storeLogo: $storeLogo, storeEmail: $storeEmail, storePhone: $storePhone, storeWebsite: $storeWebsite)';
  }

  @override
  bool operator ==(covariant Supplier other) {
    if (identical(this, other)) return true;

    return other.sid == sid &&
        other.storeName == storeName &&
        other.storeBanner == storeBanner &&
        other.storeLogo == storeLogo &&
        other.storeEmail == storeEmail &&
        other.storePhone == storePhone &&
        other.storeWebsite == storeWebsite;
  }

  @override
  int get hashCode {
    return sid.hashCode ^
        storeName.hashCode ^
        storeBanner.hashCode ^
        storeLogo.hashCode ^
        storeEmail.hashCode ^
        storePhone.hashCode ^
        storeWebsite.hashCode;
  }
}
