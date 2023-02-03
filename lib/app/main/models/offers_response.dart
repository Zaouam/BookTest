import 'package:bibliotheque/app/main/models/offer.dart';

class OffersResponse {
  OffersResponse({
    required this.offers,
  });

  List<Offer> offers;

  factory OffersResponse.fromJson(Map<String, List<Offer>> json) => OffersResponse(
    offers: List<Offer>.from(json["offers"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
  };
}
