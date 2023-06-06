import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/data_sources/base_data_source.dart';
import 'package:natural_groceries/core/data/models/articles/article_model.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/base/base_response.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/coupon_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/request_models/offers_request_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/transaction_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/transactions_paging_model.dart';
import 'package:natural_groceries/core/data/models/faqs/faqs_model.dart';
import 'package:natural_groceries/core/data/models/filters/filters_model.dart';
import 'package:natural_groceries/core/data/models/more_ways_to_save/more_ways_to_save_model.dart';
import 'package:natural_groceries/core/data/models/recipes/recipes_model.dart';
import 'package:natural_groceries/core/data/models/store/store_event_model.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/models/store/store_promo_model.dart';
import 'package:natural_groceries/core/data/utilities/api/api.dart';
import 'package:natural_groceries/core/data/utilities/api/content_api.dart';

@injectable
class ContentDataSource with BaseDataSource {
  ContentDataSource(Api api) {
    this.api = api.content;
  }

  late final ContentApi api;

  Future<BaseResponse<BaseModel<List<StoreModel>>>> getStores() => getResult(() => api.getStores());

  Future<BaseResponse<BaseModel<List<RecipesModel>>>> getRecipes(Map<String, dynamic> queryMap) =>
      getResult(() => api.getRecipes(queryMap));

  Future<BaseResponse<BaseModel<List<StoreEventModel>>>> getStoreEvents(String? nid) =>
      getResult(() => api.getStoreEvents(nid));

  Future<BaseResponse<BaseModel<List<StorePromoModel>>>> getStorePromos(String? nid) =>
      getResult(() => api.getStorePromos(nid));

  Future<BaseResponse<BaseModel<List<RecipesModel>>>> getRecipeDetails(String? nid) =>
      getResult(() => api.getRecipeDetails(nid));

  Future<BaseResponse<BaseModel<List<ArticleModel>>>> getArticles(
    Map<String, dynamic> queryMap,
  ) =>
      getResult(() => api.getArticles(queryMap));

  Future<BaseResponse<BaseModel<List<ArticleModel>>>> getArticleDetails(String? nid) =>
      getResult(() => api.getArticleDetails(nid));

  Future<BaseResponse<BaseModel<TransactionsPagingModel>>> getTransactions(int? page) =>
      getResult(() => api.getTransactions(page));

  Future<BaseResponse<BaseModel<TransactionModel>>> getTransactionDetails(
    String? basketId,
  ) =>
      getResult(() => api.getTransactionDetails(basketId));

  Future<BaseResponse<BaseModel<List<CouponModel>>>> getOffers(
    OffersRequestModel body,
  ) =>
      getResult(() => api.getOffers(body));

  Future<BaseResponse<BaseModel<FaqsModel>>> getFaqs() => getResult(() => api.getFaqs());

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getRecipeCourse() =>
      getResult(() => api.getRecipeCourse());

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getRecipeDish() =>
      getResult(() => api.getRecipeDish());

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getRecipeDietaryPreference() =>
      getResult(() => api.getRecipeDietaryPreference());

  Future<BaseResponse<BaseModel<List<MoreWaysToSaveModel>>>> getMoreWaysToSave() =>
      getResult(() => api.getMoreWaysToSave());

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getArticleDietarySupplements() =>
      getResult(() => api.getArticleDietarySupplements());

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getArticleFoodTopics() =>
      getResult(() => api.getArticleFoodTopics());

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getArticleHealthProtocol() =>
      getResult(() => api.getArticleHealthProtocol());

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getArticleHealthTopic() =>
      getResult(() => api.getArticleHealthTopic());

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getArticleSustainableFood() =>
      getResult(() => api.getArticleSustainableFood());
}
