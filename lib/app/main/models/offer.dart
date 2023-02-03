class Offer {
  String? type;
  double? value;
  double? sliceValue;

  Offer({
    this.type,
    this.value,
    this.sliceValue
  });

  Offer.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = double.parse(json['value'].toString());
    if(json.containsKey('sliceValue')){
      sliceValue = double.parse(json['sliceValue'].toString());
    }else{
      sliceValue = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
    data['sliceValue'] = sliceValue;
    return data;
  }
}