
class Settings {
  Settings({
    this.isSpecialPrices,
    this.typeFoodSales,
    this.csMerchantId,
    this.vcoMerchantId,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
    isSpecialPrices: json['is_special_prices'],
    typeFoodSales: json['type_food_sales'],
    csMerchantId: json['cs_merchant_id'],
    vcoMerchantId: json['vco_merchant_id'],
  );

  bool isSpecialPrices;
  String typeFoodSales;
  String csMerchantId;
  String vcoMerchantId;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'is_special_prices': isSpecialPrices,
    'type_food_sales': typeFoodSales,
    'cs_merchant_id': csMerchantId,
    'vco_merchant_id': vcoMerchantId,
  };
}