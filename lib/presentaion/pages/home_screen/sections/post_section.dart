import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/presentaion/bloc/get_all_post/get_all_post_bloc.dart';
import 'package:zora/presentaion/bloc/saved_posts/saved_posts_bloc.dart';
import 'package:zora/presentaion/pages/home_screen/loading/postcontainer_loading.dart';
import 'package:zora/presentaion/pages/home_screen/widgets/post_container.dart';

class PostSection extends StatefulWidget {
  const PostSection(
      {super.key, required this.mediaheight, required this.mediawidth});
  final double mediaheight;
  final double mediawidth;
  @override
  State<PostSection> createState() => _PostSectionState();
}
class _PostSectionState extends State<PostSection> {
  @override
  void initState() {
    context.read<GetAllPostBloc>().add(GetAllPostInitialFetchEvent());
    context.read<SavedPostsBloc>().add(GetSavedPostEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // context.read<GetAllPostBloc>().add(GetAllPostInitialFetchEvent());
    // context.read<SavedPostsBloc>().add(GetSavedPostEvent());
    return BlocBuilder<GetAllPostBloc, GetAllPostState>(
        builder: (context, state) {
      if (state is GetAllPostLoadingState) {
        return Column(
          children: [
            PostcontainerLoading(
              mediaheight: widget.mediaheight,
              mediawidth: widget.mediawidth,
            ),
            kheight20,
            PostcontainerLoading(
              mediaheight: widget.mediaheight,
              mediawidth: widget.mediawidth,
            ),
          ],
        );
      }
      if (state is GetAllPostSuccessState) {
        log(state.posts.length.toString());
        return Column(
          children: List.generate(
            state.posts.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: PostContainer(
                  mediaheight: widget.mediaheight,
                  mediawidth: widget.mediawidth,
                  post: state.posts[index],
                  user: state.posts[index].user!,
                  indexofpost: index,
                ),
              );
            },
          ),
        );
      } else {
         return Column(
          children: [
            PostcontainerLoading(
              mediaheight: widget.mediaheight,
              mediawidth: widget.mediawidth,
            ),
            kheight20,
            PostcontainerLoading(
              mediaheight: widget.mediaheight,
              mediawidth: widget.mediawidth,
            ),
          ],
        );
      }
   
    });
  }
}
