
import 'package:flutter/material.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/pages/user_post_images_showing/user_post.dart';

class SavedGridView extends StatefulWidget {
  final UserModel? userModel;
  const SavedGridView({super.key, required this.userModel});

  @override
  State<SavedGridView> createState() => _SavedGridViewState();
}

class _SavedGridViewState extends State<SavedGridView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userModel == null ||
        widget.userModel!.posts == null ||
        widget.userModel!.posts!.isEmpty) {
      return const Center(
        child: Text('No Posts available'),
      );
    }
    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: widget.userModel!.posts!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              navigatorPush(
                  UsersPostImages(
                    userModel: widget.userModel!,
                    index: index,
                  ),
                  context);
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        widget.userModel!.posts![index].mediaURL![0]),
                    fit: BoxFit.cover),
             
              ),
            ),
          );
        },
      ),
    );
  }
}
