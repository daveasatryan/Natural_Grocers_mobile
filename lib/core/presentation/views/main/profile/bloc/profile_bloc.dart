import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/usecases/user/get_user_info_usecase.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/bloc/profile_event.dart';
import 'package:natural_groceries/core/presentation/views/main/profile/bloc/profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.getUserInfoUseCase)
      : super(const ProfileState.initial(viewType: ListViewType.listView)) {
    on<GetUserInfo>(_onGetUserInfo);
    on<ToggleViewProfile>(_onToggleView);
    on<AddToFavoritesProfile>(_onAddToFavorites);
  }

  List<int> favorites = [];
  ListViewType listViewType = ListViewType.listView;

  final GetUserInfoUseCase getUserInfoUseCase;

  void _onGetUserInfo(GetUserInfo event, Emitter<ProfileState> emit) async {
    final response = await getUserInfoUseCase(event.uid);

    response.when(
      success: (data) => emit(ProfileState.getUserSuccess(user: data?.result)),
      error: (msg) => emit(ProfileState.error(msg: msg)),
    );
  }

  void _onToggleView(ToggleViewProfile event, Emitter<ProfileState> emit) {
    listViewType = event.viewType;
    emit(ProfileState.initial(viewType: listViewType));
  }

  void _onAddToFavorites(AddToFavoritesProfile event, Emitter<ProfileState> emit) {
    if (favorites.contains(event.itemId)) {
      favorites.remove(event.itemId);
    } else {
      favorites.add(event.itemId);
    }
    emit(ProfileState.initial(favoriteItems: favorites, viewType: listViewType));
  }
}
