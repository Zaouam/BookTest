import 'package:bibliotheque/app/main/controllers/books_controller.dart';
import 'package:bibliotheque/app/main/services/offres-services.dart';
import 'package:bibliotheque/config/controllerConfig/base_controller.dart';
import 'package:get/get.dart';
import '../../../config/interceptor/interceptor.dart';
import '../models/offer.dart';

class ShoppingCartController extends BaseController {

  /// VARIABLES
  final OffersServices _offersServices = OffersServices();
  final BooksController _booksController = Get.put(BooksController());
  double totalPrice = 0;

  /// GET LIST OF OFFERS
  void getOffers() {
    loadingState();
    DioInterceptor.enableLoader();
    if(_booksController.booksCartList.isEmpty){
      totalPrice = 0;
    }
    var ids = '';
    _booksController.booksCartList.forEach((element) {
      if(ids==''){
        ids = element.isbn!;
      }else{
        ids = ids+','+element.isbn!;
      }
    });
    _offersServices.getOffersService(ids).then((List<Offer>? response) {
      successState();
      if (response != null) {
        getPrice(response);
      } else {
        noDataState();
      }
    }).onError((error, stackTrace) {
      errorState();
    });
  }

  /// GET FINAL PRICE
  void getPrice(List<Offer>? response){
    double price = 0.0;
    List<double> listPriceSuggestion=[];
    _booksController.booksCartList.forEach((element) {
      price += element.price!;
    });
    response?.forEach((element) {
      switch(element.type){
        case 'minus':
          listPriceSuggestion.add(price - double.parse(element.value.toString()));
          break;
        case 'slice':
          if(price / element.sliceValue! >= 1) {
            listPriceSuggestion.add(price - (price ~/ element.sliceValue! * double.parse(element.value.toString())));
          }
          break;
        case 'percentage':
          listPriceSuggestion.add(price - ((price  * double.parse(element.value.toString()))/100));
          break;
        default:
      }
    });
    totalPrice = listPriceSuggestion.reduce((current, next) => current < next ? current : next);
    update();
  }

  /// RESET PRICE
  void resetPrice (){
    totalPrice = 0.0;
    update();
  }

}
