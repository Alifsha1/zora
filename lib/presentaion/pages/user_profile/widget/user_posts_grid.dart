import 'package:flutter/cupertino.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/pages/user_post_images_showing/user_post.dart';

class UserPostsGridView extends StatefulWidget {
  final List<PostModel>? posts;
  final UserModel? userModel;
  const UserPostsGridView({super.key,required this.posts,required this.userModel});

  @override
  State<UserPostsGridView> createState() => _UserPostsGridViewState();
}

class _UserPostsGridViewState extends State<UserPostsGridView> {
   @override
  Widget build(BuildContext context) {
    if (widget.posts == null ||
        widget.posts == null ||
        widget.posts!.isEmpty) {
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
        itemCount: widget.posts!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              navigatorPush(
                  UsersPostImages(
                    userModel: widget.userModel,
                    index: index,
                    title: 'Posts',
                  ),
                  context);
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        widget.posts![index].mediaURL![0]),
                    fit: BoxFit.cover),
             
              ),
            ),
          );
        },
      ),
    );
  }
}