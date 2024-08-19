import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/core/utils/alerts.dart';
import 'package:zora/data/repository/image_picker_impl/photo_picker.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/Widgets/zora.dart';
import 'package:zora/presentaion/bloc/create_post/create_post_bloc.dart';
import 'package:zora/presentaion/pages/image_picker/media_picker.dart';
import 'package:zora/presentaion/pages/nav_bar/nav_bar.dart';
import 'package:zora/presentaion/pages/post_add_page/widgets/image_selecting_widget.dart';
import 'package:zora/presentaion/pages/post_add_page/widgets/post_custom_text_field.dart';

class PostAddScreen extends StatefulWidget {
  const PostAddScreen({super.key});
  @override
  State<PostAddScreen> createState() => _PostAddScreenState();
}

class _PostAddScreenState extends State<PostAddScreen> {
  AssetPathEntity? selectedAlbums;
  List<AssetPathEntity> albumList = [];
  List<AssetEntity> assetList = [];
  List<AssetEntity> selectedAssetList = [];
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    MediaService().loadAlbums(RequestType.common).then((value) {
      setState(() {
        albumList = value;
        selectedAlbums = value[0];
      });
      MediaService().loadAssets(selectedAlbums!).then((value) {
        setState(() {
          assetList = value;
        });
      });
    });
    super.initState();
  }

  Future pickAssets(
      {required int maxCount, required RequestType requestType}) async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return MediaPicker(maxCount: maxCount, requestType: requestType);
    }));
    if (result != null) {
      setState(() {
        selectedAssetList = List<AssetEntity>.from(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const MainHeading(heading: 'Add Post'),
          actions: [
            GestureDetector(
                onTap: () {
                  context.read<CreatePostBloc>().add(
                        AddingPostEvent(
                            description: descriptioncontroller.text,
                            location: locationcontroller.text,
                            selectedimages: selectedAssetList),
                      );
                },
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Post',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
          backgroundColor: const Color.fromARGB(255, 228, 246, 246),
        ),
        body: BlocConsumer<CreatePostBloc, CreatePostState>(
          listener: (context, state) {
            if (state is AddPostSuccessState) {
              navigatorReplacement(const CustomNavBar(), context);
            } else if (state is AddPostMissingfieldState) {
              customSnackbar(context, "All fields are required", Colors.red);
            } else if (state is AddPostErrorState) {
              customSnackbar(context, "Oops..! Server unreachable", Colors.red);
            } else if (state is AddPostLoadingState) {}
          },
          builder: (context, state) {
            if (state is AddPostLoadingState) {
              return Center(
                child: LottieBuilder.asset(
                  'assets/lottie/creatingloading.json',
                  width: 350,
                  height: 350,
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SelectImageWidget(
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                          ontap: () {
                            pickAssets(
                                maxCount: 10, requestType: RequestType.common);
                          },
                          selectedAssetList: selectedAssetList,
                        ),
                        kheight10,
                        const Row(
                          children: [
                            BoldTitles(
                              fontsize: 17,
                              titles: 'Description',
                              color: Color.fromARGB(255, 121, 119, 119),
                            ),
                          ],
                        ),
                        kheight10,
                        PostCustomTexTField(
                          controller: descriptioncontroller,
                          hint: 'Description',
                          maxline: 5,
                        ),
                        kheight10,
                        const Row(
                          children: [
                            BoldTitles(
                              titles: 'location',
                              color: Color.fromARGB(255, 121, 119, 119),
                              fontsize: 17,
                            ),
                          ],
                        ),
                        kheight10,
                        PostCustomTexTField(
                          controller: locationcontroller,
                          hint: 'location',
                          prefix: const Icon(CupertinoIcons.location_solid),
                        ),
                        kheight10,
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ));
  }
}
