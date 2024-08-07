import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaService {
  Future<List<AssetPathEntity>> loadAlbums(RequestType requestType) async {
    var permission = await PhotoManager.requestPermissionExtend();
    List<AssetPathEntity> albumList = [];
    if (permission.isAuth == true) {
      albumList = await PhotoManager.getAssetPathList(
          filterOption: FilterOptionGroup(
            videoOption: const FilterOption(
              durationConstraint: DurationConstraint(
                max: Duration(
                  minutes: 2,
                ),
              ),
            ),
          ),
          type: requestType);
    }
    log('Album length: $albumList');
    return albumList;
  }

  Future<List<AssetEntity>> loadAssets(AssetPathEntity selectedAlbum) async {
    List<AssetEntity> assetList = await selectedAlbum.getAssetListRange(
        start: 0, end: await selectedAlbum.assetCountAsync);
    debugPrint('${assetList.length}');
    return assetList;
  }
}
