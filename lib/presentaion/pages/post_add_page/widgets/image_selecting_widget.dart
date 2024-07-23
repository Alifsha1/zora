import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:zora/presentaion/pages/post_add_page/widgets/post_image_widget.dart';

class SelectImageWidget extends StatelessWidget {
  final double mediaheight;
  final double mediawidth;
  final Function()? ontap;
  final List selectedAssetList;
   SelectImageWidget({super.key, this.ontap,required this.mediaheight,required this.mediawidth,required this.selectedAssetList});

 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: mediaheight * .4,
        width: mediawidth,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: selectedAssetList.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedAssetList.length,
                itemBuilder: (ctx, index) {
                  AssetEntity assetEntity = selectedAssetList[index];
                  return PostImageSelectWidget(
                      mediawidth: mediawidth, assetEntity: assetEntity);
                },
              )
            : Card(
                color: const Color.fromARGB(255, 149, 203, 248),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: IconButton(
                        onPressed: ontap,
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                        ),
                      ),
                    ),
                    const Text("Select image")
                  ],
                ),
              ),
      ),
    );
  }
}
