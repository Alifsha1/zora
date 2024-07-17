import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/presentaion/bloc/get_all_post/get_all_post_bloc.dart';
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
  Widget build(BuildContext context) {
    context.read<GetAllPostBloc>().add(GetAllPostInitialFetchEvent());

    return BlocBuilder<GetAllPostBloc, GetAllPostState>(
        builder: (context, state) {
      if (state is GetAllPostLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is GetAllPostSuccessState) {
        log(state.posts.length.toString());
        return Column(
            children: List.generate(state.posts.length, (index) {
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
        }));
      } else {
        return Center(
          child: Text('no data'),
        );
      }
      // return Container();
    });
  }
}
