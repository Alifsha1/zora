import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/like_post/like_post_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/home_screen/sections/comment_section.dart';

class LikeComSecWidget extends StatefulWidget {
  final UserModel user;
  final PostModel post;
  const LikeComSecWidget({
    super.key,
    required this.user,
    required this.post,
  });

  @override
  State<LikeComSecWidget> createState() => _LikeComSecWidgetState();
}

class _LikeComSecWidgetState extends State<LikeComSecWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<UserProfileBloc, UserProfileState>(
          //  bloc: context.read<UserProfileBloc>(),
          builder: (context, states) {
            if (states is UserProfileSuccessfulState) {
              return Row(
                children: [
                  Row(
                    children: [
                      BlocBuilder<LikePostBloc, LikePostState>(
                        builder: (context, state) {
                          // if (post.likes!.contains(user.id)) {

                          if (state is LikePostSuccessState) {
                            if (widget.post.likes!.contains(states.user.id)) {
                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      widget.post.likes!.remove(states.user.id);
                                      log('Post Likes: ${widget.post.likes} User Id: ${states.user.id}');
                                      context.read<LikePostBloc>().add(
                                          UnLikePostFetchEvent(
                                              postid: widget.post.id!));
                                    },
                                    child: const Icon(
                                      CupertinoIcons.heart_fill,
                                      size: 25,
                                      color: kred,
                                    ),
                                  ),
                                  Text(
                                    widget.post.likes == null ||
                                            widget.post.likes!.isEmpty
                                        ? 'No Likes'
                                        : widget.post.likes!.length.toString(),
                                    style: const TextStyle(
                                      color: kwhite,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              );
                            }
                          }
                          if (state is UnLikePostSuccessState) {
                            if (!widget.post.likes!.contains(states.user.id)) {
                              return Row(
                                children: [
                                  GestureDetector(
                                    onDoubleTap: () {
                                      widget.post.likes!.add(states.user.id);
                                      log('Post Likes: ${widget.post.likes} User Id: ${states.user.id}');
                                      context.read<LikePostBloc>().add(
                                          LikePostFetchEvent(
                                              postid: widget.post.id!));
                                    },
                                    child: const Icon(
                                      CupertinoIcons.heart,
                                      size: 25,
                                      color: kwhite,
                                    ),
                                  ),
                                  Text(
                                    widget.post.likes == null ||
                                            widget.post.likes!.isEmpty
                                        ? 'No Likes'
                                        : widget.post.likes!.length.toString(),
                                    style: const TextStyle(
                                      color: kwhite,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              );
                            }
                          }
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  widget.post.likes!.remove(states.user.id);
                                  log('Post Likes: ${widget.post.likes} User Id: ${states.user.id}');
                                  context.read<LikePostBloc>().add(
                                      UnLikePostFetchEvent(
                                          postid: widget.post.id!));
                                },
                                onDoubleTap: () {
                                  widget.post.likes!.add(states.user.id);
                                  log('Post Likes: ${widget.post.likes} User Id: ${states.user.id}');
                                  context.read<LikePostBloc>().add(
                                      LikePostFetchEvent(
                                          postid: widget.post.id!));
                                },
                                child:
                                    widget.post.likes!.contains(states.user.id)
                                        ? const Icon(
                                            CupertinoIcons.heart_fill,
                                            size: 25,
                                            color: kred,
                                          )
                                        : const Icon(
                                            CupertinoIcons.heart,
                                            size: 25,
                                            color: kwhite,
                                          ),
                              ),
                              Text(
                                widget.post.likes == null ||
                                        widget.post.likes!.isEmpty
                                    ? 'No Likes'
                                    : widget.post.likes!.length.toString(),
                                style: const TextStyle(
                                  color: kwhite,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  kwidht10,
                  CommentSecWidget(user: widget.user, post: widget.post),
                ],
              );
            }
            return Container();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Row(
            children: [
              Text(
                widget.post.description!,
                style: const TextStyle(
                  color: kwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
