import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/data_sources/content_data_source.dart';
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

@injectable
class ContentRepository {
  ContentRepository(this.dataSource);

  final ContentDataSource dataSource;

  Future<BaseResponse<BaseModel<List<StoreModel>>>> getStores() => dataSource.getStores();

  Future<BaseResponse<BaseModel<List<RecipesModel>>>> getRecipes(Map<String, dynamic> queryMap) =>
      dataSource.getRecipes(queryMap);

  Future<BaseResponse<BaseModel<List<StoreEventModel>>>> getStoreEvents(String? nid) =>
      dataSource.getStoreEvents(nid);

  Future<BaseResponse<BaseModel<List<StorePromoModel>>>> getStorePromos(String? nid) =>
      dataSource.getStorePromos(nid);

  Future<BaseResponse<BaseModel<List<RecipesModel>>>> getRecipeDetails(String? nid) =>
      dataSource.getRecipeDetails(nid);

  Future<BaseResponse<BaseModel<List<ArticleModel>>>> getArticles(
    Map<String, dynamic> queryMap,
  ) =>
      dataSource.getArticles(queryMap);

  Future<BaseResponse<BaseModel<List<ArticleModel>>>> getArticleDetails(String? nid) =>
      dataSource.getArticleDetails(nid);

  Future<BaseResponse<BaseModel<TransactionsPagingModel>>> getTransactions(int? page) =>
      dataSource.getTransactions(page);

  Future<BaseResponse<BaseModel<TransactionModel>>> getTransactionDetails(
    String? basketId,
  ) =>
      dataSource.getTransactionDetails(basketId);

  Future<BaseResponse<BaseModel<List<CouponModel>>>> getOffers(
    OffersRequestModel body,
  ) =>
      dataSource.getOffers(body);

  Future<BaseResponse<BaseModel<FaqsModel>>> getFaqs() => dataSource.getFaqs();

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getRecipeCourse() =>
      dataSource.getRecipeCourse();

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getRecipeDish() => dataSource.getRecipeDish();

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getRecipeDietaryPreference() =>
      dataSource.getRecipeDietaryPreference();

  Future<BaseResponse<BaseModel<List<MoreWaysToSaveModel>>>> getMoreWaysToSave() =>
      dataSource.getMoreWaysToSave();

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getArticleDietarySupplements() =>
      dataSource.getArticleDietarySupplements();

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getArticleFoodTopics() =>
      dataSource.getArticleFoodTopics();

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getArticleHealthProtocol() =>
      dataSource.getArticleHealthProtocol();

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getArticleHealthTopic() =>
      dataSource.getArticleHealthTopic();

  Future<BaseResponse<BaseModel<List<FiltersModel>>>> getArticleSustainableFood() =>
      dataSource.getArticleSustainableFood();
}
