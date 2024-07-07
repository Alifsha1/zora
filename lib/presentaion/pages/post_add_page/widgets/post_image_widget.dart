import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class PostImageSelectWidget extends StatelessWidget {
  const PostImageSelectWidget({
    super.key,
    required this.mediawidth,
    required this.assetEntity,
  });

  final double mediawidth;
  final AssetEntity assetEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: mediawidth,
        child: Stack(
          children: [
            Positioned.fill(
                child: AssetEntityImage(
              assetEntity,
              isOriginal: false,
              thumbnailSize:
                  const ThumbnailSize.square(1000),
              fit: BoxFit.cover,
              errorBuilder: (context, error,
                  stackTrace) {
                return const Center(
                  child: Icon(Icons.error),
                );
              },
            )),
            if (assetEntity.type ==
                AssetType.video)
              const Positioned.fill(
                child: Align(
                  alignment:
                      Alignment.bottomRight,
                  child: Padding(
                    padding:
                        EdgeInsets.all(10),
                    child: Icon(
                        Icons.video_call),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}