import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/offer_type_enum.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/coupon_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/request_models/offers_request_model.dart';
import 'package:natural_groceries/core/data/repositories/content_repository.dart';

@injectable
class GetOffersUsecase {
  GetOffersUsecase({
    required this.repository,
  });

  final ContentRepository repository;
  Future<BaseResponse<BaseModel<List<CouponModel>>>> call(OfferTypeEnum type) =>
      repository.getOffers(OffersRequestModel(offerType: type));

  Future<BaseResponse<BaseModel<List<CouponModel>>>> available() =>
      call(OfferTypeEnum.available);

  Future<BaseResponse<BaseModel<List<CouponModel>>>> redeemed() =>
      call(OfferTypeEnum.redeemed);

  Future<BaseResponse<BaseModel<List<CouponModel>>>> expired() =>
      call(OfferTypeEnum.expired);

  Future<BaseResponse<BaseModel<List<CouponModel>>>> selected() =>
      call(OfferTypeEnum.selected);
}
