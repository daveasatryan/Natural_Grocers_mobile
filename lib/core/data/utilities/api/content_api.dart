import 'package:dio/dio.dart';
import 'package:natural_groceries/core/data/models/articles/article_model.dart';
import 'package:natural_groceries/core/data/models/base/base_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/coupon_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/coupons/request_models/offers_request_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/transaction_model.dart';
import 'package:natural_groceries/core/data/models/dashboard/transactions/transactions_paging_model.dart';
import 'package:natural_groceries/core/data/models/faqs/faqs_model.dart';
import 'package:natural_groceries/core/data/models/more_ways_to_save/more_ways_to_save_model.dart';
import 'package:natural_groceries/core/data/models/filters/filters_model.dart';
import 'package:natural_groceries/core/data/models/recipes/recipes_model.dart';
import 'package:natural_groceries/core/data/models/store/store_event_model.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/models/store/store_promo_model.dart';
import 'package:retrofit/retrofit.dart';

part 'content_api.g.dart';

/// Retrofit abstract App ApiClient
@RestApi()
abstract class ContentApi {
  /// Factory constructor
  factory ContentApi(
    Dio dio, {
    String baseUrl,
  }) = _ContentApi;

  @GET('/api/user/stores')
  Future<HttpResponse<BaseModel<List<StoreModel>>>> getStores();

  @GET('/api/user/recipes')
  Future<HttpResponse<BaseModel<List<RecipesModel>>>> getRecipes(
    @Queries(encoded: true) Map<String, dynamic> queryMap,
  );

  @GET('/api/user/store-events/{nid}')
  Future<HttpResponse<BaseModel<List<StoreEventModel>>>> getStoreEvents(@Path('nid') String? nid);

  @GET('/api/user/store-promos/{nid}')
  Future<HttpResponse<BaseModel<List<StorePromoModel>>>> getStorePromos(@Path('nid') String? nid);

  @GET('/api/user/recipes/{nid}')
  Future<HttpResponse<BaseModel<List<RecipesModel>>>> getRecipeDetails(@Path('nid') String? nid);

  @GET('/api/user/articles')
  Future<HttpResponse<BaseModel<List<ArticleModel>>>> getArticles(
    @Queries(encoded: true) Map<String, dynamic> queryMap,
  );

  @GET('/api/user/articles/{nid}')
  Future<HttpResponse<BaseModel<List<ArticleModel>>>> getArticleDetails(@Path('nid') String? nid);

  @GET('/api/user/baskets')
  Future<HttpResponse<BaseModel<TransactionsPagingModel>>> getTransactions(
    @Query('page') int? page,
  );

  @GET('/api/user/basket/{basketId}')
  Future<HttpResponse<BaseModel<TransactionModel>>> getTransactionDetails(
    @Path('basketId') String? basketId,
  );

  @GET('/api/user/shopper/offers')
  Future<HttpResponse<BaseModel<List<CouponModel>>>> getOffers(
    @Body() OffersRequestModel body,
  );

  @GET('/api/user/faq')
  Future<HttpResponse<BaseModel<FaqsModel>>> getFaqs();

  @GET('/api/user/recipe-course')
  Future<HttpResponse<BaseModel<List<FiltersModel>>>> getRecipeCourse();

  @GET('/api/user/recipe-dish')
  Future<HttpResponse<BaseModel<List<FiltersModel>>>> getRecipeDish();

  @GET('/api/user/recipe-diet')
  Future<HttpResponse<BaseModel<List<FiltersModel>>>> getRecipeDietaryPreference();

  @GET('/api/user/mobile-app-promos')
  Future<HttpResponse<BaseModel<List<MoreWaysToSaveModel>>>> getMoreWaysToSave();

  @GET('/ap/user/article-dietary-supplements')
  Future<HttpResponse<BaseModel<List<FiltersModel>>>> getArticleDietarySupplements();

  @GET('/ap/user/article-food-topics')
  Future<HttpResponse<BaseModel<List<FiltersModel>>>> getArticleFoodTopics();

  @GET('/ap/user/article-health-protocol')
  Future<HttpResponse<BaseModel<List<FiltersModel>>>> getArticleHealthProtocol();

  @GET('/ap/user/article-health-topic')
  Future<HttpResponse<BaseModel<List<FiltersModel>>>> getArticleHealthTopic();

  @GET('/ap/user/article-sustainable-food')
  Future<HttpResponse<BaseModel<List<FiltersModel>>>> getArticleSustainableFood();
}
