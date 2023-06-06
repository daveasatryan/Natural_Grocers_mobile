import 'dart:async';
import 'dart:ui';
import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:natural_groceries/core/data/enums/dialog_icons.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/data/utilities/storage/preferences_manager.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/provider/user_provider.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/find_store/bloc/find_store_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/find_store/bloc/find_store_state.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:permission_handler/permission_handler.dart';

class MapStoreView extends StatefulWidget {
  const MapStoreView({super.key, required this.stores});

  final List<StoreModel> stores;

  @override
  State<MapStoreView> createState() => _MapStoreViewState();
}

class _MapStoreViewState extends State<MapStoreView> with BaseStateMixin {
  List<StoreModel> get stores => widget.stores;
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const cameraZoom = 15.4746;

  BitmapDescriptor? markerIcon;
  BitmapDescriptor? preferredMarkerIcon;
  BitmapDescriptor? selectedMarkIcon;
  BitmapDescriptor? preferredMarkerSelectedIcon;
  String? selectedMarkerId;

  StoreModel? selectedStore;

  Map<MarkerId, Marker> markers = {};

  Position? currentPosition;

  CameraPosition _googlePlex = const CameraPosition(
    target: LatLng(AppConstants.lat, AppConstants.lng),
    zoom: 15.4746,
  );

  @override
  void initState() {
    final preferredStoreId = context.read<UserProvider>().userModel?.preferredStore ?? '';
    (stores.firstWhereOrNull((element) => element.nid == preferredStoreId) ?? stores.firstOrNull)
        ?.let((self) {
      _googlePlex = CameraPosition(
        target: LatLng(
          self.fieldStoreGeolocation?.lat?.toDouble() ?? AppConstants.lat,
          self.fieldStoreGeolocation?.lng?.toDouble() ?? AppConstants.lng,
        ),
        zoom: cameraZoom,
      );
    });

    Permission.location.isGranted.then((value) {
      if (value) {
        Geolocator.getCurrentPosition().then((value) {
          currentPosition = value;
          navigateToMyPosition();
        });
      }
    });

    getBytesFromAsset(AppAssets.icMark, 100.sp.toInt()).then((bytes) {
      if (bytes != null) {
        setState(() {
          markerIcon = BitmapDescriptor.fromBytes(bytes);
        });
        setMarkers(stores);
      }
    });

    getBytesFromAsset(AppAssets.icPreferredMark, 100.sp.toInt()).then((bytes) {
      if (bytes != null) {
        setState(() {
          preferredMarkerIcon = BitmapDescriptor.fromBytes(bytes);
        });
        setMarkers(stores);
      }
    });

    getBytesFromAsset(AppAssets.selectedMarkIcon, 120.sp.toInt()).then((bytes) {
      if (bytes != null) {
        setState(() {
          selectedMarkIcon = BitmapDescriptor.fromBytes(bytes);
        });
        setMarkers(stores);
      }
    });

    getBytesFromAsset(AppAssets.preferredStoreSelectedIcon, 120.sp.toInt()).then((bytes) {
      if (bytes != null) {
        setState(() {
          preferredMarkerSelectedIcon = BitmapDescriptor.fromBytes(bytes);
        });
        setMarkers(stores);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FindStoreBloc, FindStoreState>(
      bloc: context.read<FindStoreBloc>(),
      listener: (context, state) {
        final stores = state.searchKey.isNullOrEmpty()
            ? this.stores
            : this
                .stores
                .where((element) =>
                    element.fullTitle?.contains(state.searchKey ?? '') == true ||
                    element.fieldStoreAddress?.postalCode?.contains(state.searchKey ?? '') ==
                        true ||
                    element.fieldStoreAddress?.locality?.contains(state.searchKey ?? '') == true ||
                    element.fieldStoreAddress?.administrativeArea
                            ?.contains(state.searchKey ?? '') ==
                        true)
                .toList();
        setMarkers(stores);

        if (!state.searchKey.isNullOrEmpty()) {
          _controller.future.then((mapController) {
            final store = stores.firstOrNull;
            if (store == null) return;
            mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(
                    store.fieldStoreGeolocation?.lat?.toDouble() ?? AppConstants.lat,
                    store.fieldStoreGeolocation?.lng?.toDouble() ?? AppConstants.lng,
                  ),
                  zoom: cameraZoom,
                ),
              ),
            );
          });
        }
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 17.sp),
            child: GoogleMap(
              onTap: (_) => setState(() {
                selectedStore?.let((store) => changeMarker(store, null));
                selectedStore = null;
              }),
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              initialCameraPosition: _googlePlex,
              mapType: MapType.normal,
              markers: markers.values.toSet(),
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Positioned(
            right: 20.sp,
            bottom: 90.sp,
            child: InkWell(
              onTap: () async {
                if (!(await Permission.location.isGranted)) {
                  showTwoOptionDialog(
                    title: strings.location_permission_denied,
                    msg: strings.location_permission_denied,
                    icon: DialogIcons.error,
                    positiveButtonClick: () async => await openAppSettings(),
                    positiveButtonText: strings.settings,
                    negativeButtonText: strings.cancel,
                  );

                  return;
                }
                currentPosition ??= await Geolocator.getCurrentPosition();
                if (currentPosition == null) return;
                navigateToMyPosition();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.borderTrueColor,
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
                child: Center(
                  child: SvgPicture.asset(AppAssets.currentLocationIcon),
                ),
              ),
            ),
          ),
          if (selectedStore != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 90.sp),
                child: InkWell(
                  onTap: () async {
                    AppRoutes.goToNested(AppRoutes.storeDetails, arguments: selectedStore);
                  },
                  child: storeCardWidget(selectedStore ?? StoreModel()),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))?.buffer.asUint8List();
  }

  void setMarkers(List<StoreModel> stores) {
    final preferredStoreId = context.read<UserProvider>().userModel?.preferredStore ?? '';
    setState(() {
      markers.clear();
      markers.addEntries(
        stores.map(
          (store) => MapEntry(
            MarkerId(store.nid ?? ''),
            Marker(
              markerId: MarkerId(store.nid ?? ''),
              position: LatLng(
                store.fieldStoreGeolocation?.lat?.toDouble() ?? 0,
                store.fieldStoreGeolocation?.lng?.toDouble() ?? 0,
              ),
              icon: preferredStoreId == store.nid
                  ? (preferredMarkerIcon ??
                      BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueGreen,
                      ))
                  : (markerIcon ??
                      BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue,
                      )),
              onTap: () {
                if (selectedStore != null) {
                  setSelectedStore(selectedStore ?? store, null);
                }
                selectedStore = store;
                setSelectedStore(store, store.nid);
                setState(() {});
              },
            ),
          ),
        ),
      );
    });
  }

  void setSelectedStore(StoreModel store, String? newSelection) {
    if (selectedMarkerId != null) {
      changeMarker(store, newSelection);
    }
    selectedMarkerId = newSelection;

    changeMarker(store, selectedMarkerId);
  }

  void changeMarker(StoreModel store, String? newSelection) {
    setState(() {
      markers[MarkerId(store.nid ?? '')] = Marker(
        markerId: MarkerId(store.nid ?? ''),
        position: LatLng(
          store.fieldStoreGeolocation?.lat?.toDouble() ?? 0,
          store.fieldStoreGeolocation?.lng?.toDouble() ?? 0,
        ),
        icon: newSelection == store.nid
            ? store.nid == PreferencesManager.user?.preferredStore
                ? (preferredMarkerSelectedIcon ??
                    BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue))
                : (selectedMarkIcon ??
                    BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue))
            : store.nid == PreferencesManager.user?.preferredStore
                ? (preferredMarkerIcon ??
                    BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue))
                : (markerIcon ?? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)),
        onTap: () {
          if (selectedStore != null) {
            setSelectedStore(selectedStore ?? store, null);
          }
          selectedStore = store;
          setSelectedStore(store, store.nid);
          setState(() {});
        },
      );
    });
  }

  void navigateToMyPosition() {
    if (currentPosition == null) return;
    _controller.future.then(
      (mapController) {
        final store = stores.firstOrNull;
        if (store == null) return;
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                currentPosition?.latitude ?? AppConstants.lat,
                currentPosition?.longitude ?? AppConstants.lng,
              ),
              zoom: cameraZoom,
            ),
          ),
        );
      },
    );
  }

  Widget storeCardWidget(StoreModel store) {
    return Container(
      color: context.colors.whiteColor,
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.only(
          top: 15.sp,
          bottom: 25.sp,
          left: 25.sp,
          right: 25.sp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 25.sp,
                  height: 25.sp,
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colors.purpleTransparent,
                  ),
                  child: Image.asset(AppAssets.icMark),
                ),
                SizedBox(width: 5.sp),
                Flexible(
                  child: Text(
                    store.fullTitle ?? '',
                    style: context.fonts.latoBoldItalic.copyWith(
                      fontSize: 18.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.sp),
            Text(
              store.address ?? '18471 Green Valle Ranch Blvd\nDenver, CO 80249',
              style: context.fonts.latoRegular.copyWith(
                fontSize: 14.sp,
                color: context.colors.whisperOpacityColor,
              ),
            ),
            SizedBox(height: 4.sp),
            Text(
              strings.miles_away_text(
                  store.getMiles(
                      currentPosition?.latitude ?? 0.0, currentPosition?.longitude ?? 0.0) ??
                  0),
              style: context.fonts.latoBlack.copyWith(
                color: context.colors.borderTrueColor,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
