class Data {
  int? id;
  String? name;
  String? email;
  String? verificationCode;
  String? resetToken;
  bool? isVerified;
  bool? isBlocked;
  bool? hasValidPackage;
  bool? canCopyCoupon;

  Data({
    this.id,
    this.name,
    this.email,
    this.verificationCode,
    this.resetToken,
    this.isVerified,
    this.isBlocked,
    this.hasValidPackage,
    this.canCopyCoupon,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        verificationCode: json['verification_code'] as String?,
        resetToken: json['reset_token'] as String?,
        isVerified: json['is_verified'] as bool?,
        isBlocked: json['is_blocked'] as bool?,
        hasValidPackage: json['has_valid_package'] as bool?,
        canCopyCoupon: json['can_copy_coupon'] as bool?,
      );
}
