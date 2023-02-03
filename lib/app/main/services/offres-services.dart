import 'package:bibliotheque/app/main/models/book.dart';
import 'package:bibliotheque/app/main/models/offers_response.dart';
import 'package:bibliotheque/config/api-urls/api_urls.dart';
import 'package:bibliotheque/config/interceptor/interceptor.dart';
import 'package:dio/dio.dart';

import '../models/offer.dart';

class OffersServices {

  /// FETCH LIST OF OFFERS
  Future<List<Offer>?> getOffersService(String ids) {
    var url = ApiUrls.offers+'/'+ids+'/commercialOffers';
    return DioInterceptor.dio!
        .get(url)
        .then((Response response) {
      if (response.statusCode == 200) {
        return List<Offer>.from(response.data['offers'].map((x) => Offer.fromJson(x)));
      } else {
        return null;
      }
    });
  }
}