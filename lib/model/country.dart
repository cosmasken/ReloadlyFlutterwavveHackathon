import 'dart:convert';

Country tokenFromJson(String str) => Country.fromJson(json.decode(str));

String tokenToJson(Country data) => json.encode(data.toJson());

class Country {
  late String isoName;
  late String name;
  late String currencyCode;
  late String currencyName;
  late String currencySymbol;
  late String flag;
  late List<String> callingCodes;

  Country(
      {required this.isoName,
        required this.name,
        required this.currencyCode,
        required this.currencyName,
        required this.currencySymbol,
        required this.flag,
        required this.callingCodes});

  Country.fromJson(Map<String, dynamic> json) {
    isoName = json['isoName'];
    name = json['name'];
    currencyCode = json['currencyCode'];
    currencyName = json['currencyName'];
    currencySymbol = json['currencySymbol'];
    flag = json['flag'];
    callingCodes = json['callingCodes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isoName'] = this.isoName;
    data['name'] = this.name;
    data['currencyCode'] = this.currencyCode;
    data['currencyName'] = this.currencyName;
    data['currencySymbol'] = this.currencySymbol;
    data['flag'] = this.flag;
    data['callingCodes'] = this.callingCodes;
    return data;
  }
}
