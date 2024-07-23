import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/delete_post/delete_post_bloc.dart';
import 'package:zora/presentaion/bloc/save_Unsave_post/save_un_save_post_bloc.dart';
import 'package:zora/presentaion/bloc/saved_posts/saved_posts_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/user_saved_postimage/widgets/pop_up_menu_widget.dart';

class PopUpMenuProfileButtonWidget extends StatefulWidget {
  final String? postid;
  final UserModel? userModel;
  final int index;
  // final ScrollController scrollController;
  const PopUpMenuProfileButtonWidget(
      {super.key,
      required this.postid,
      required this.userModel,
      required this.index,
      // required this.scrollController,
       });

  @override
  State<PopUpMenuProfileButtonWidget> createState() =>
      _PopUpMenuProfileButtonWidgetState();
}

class _PopUpMenuProfileButtonWidgetState
    extends State<PopUpMenuProfileButtonWidget> {
      final ScrollController scrollController = ScrollController();
  
  @override
  void initState() {
    // context.read<DeletePostBloc>();
    posts = widget.userModel!.posts ?? [];
    log('${widget.index}');
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        if (scrollController.hasClients) {
        scrollController.position.jumpTo(widget.index * 350);
        }
      },
    );
    super.initState();
  }

  List<PostModel> posts = [];
  void deletePost(String postId) {
    setState(() {
      posts.removeWhere((post) => post.id == postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 23,
        backgroundColor: Colors.transparent.withOpacity(.5),
        child: Builder(builder: (BuildContext context) {
          return BlocBuilder<SavedPostsBloc, SavedPostsState>(
            builder: (context, state) {
              if (state is GetSavedPostSuccessState) {
                if (state.savedpostids.contains(widget.postid)) {
                  return PopUpMenuWidgetButton(
                    onTap1: () {
                      context
                          .read<SaveUnSavePostBloc>()
                          .add(UnsavePostEvent(postid: widget.postid));
                      state.savedpostids.remove(widget.postid);
                      setState(() {});
                    },
                    buttontxt: 'Unsave',
                    txt2: 'Delete',
                    onTap2: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                //  backgroundColor: Colors.transparent.withOpacity(0.5),
                                title: const Text('Delete post'),
                                content: const Text(
                                    "Are you sure you want \nto delete?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      context.read<DeletePostBloc>().add(
                                          DeletePostfromProfileEvent(
                                              postid: widget.postid!));
                                      deletePost(widget.postid!);
                                      context.read<UserProfileBloc>().add(
                                          UserProfileInitialDetailsFetchEvent());
                                           Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'delete',
                                      style: TextStyle(color: kred),
                                    ),
                                  ),
                                ],
                              ));
                    },
                  );
                }
                return PopUpMenuWidgetButton(
                  onTap1: () {
                    context
                        .read<SaveUnSavePostBloc>()
                        .add(SavePostEvent(postid: widget.postid));
                    state.savedpostids.add(widget.postid);
                    setState(() {});
                  },
                  buttontxt: 'Save',
                  txt2: 'Delete',
                  onTap2: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              //  backgroundColor: Colors.transparent.withOpacity(0.5),
                              title: const Text('Delete post'),
                              content: const Text(
                                  "Are you sure you want \nto delete?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    context.read<DeletePostBloc>().add(
                                        DeletePostfromProfileEvent(
                                            postid: widget.postid!));
                                    deletePost(widget.postid!);
                                    context.read<UserProfileBloc>().add(
                                        UserProfileInitialDetailsFetchEvent());
                                         Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'delete',
                                    style: TextStyle(color: kred),
                                  ),
                                ),
                              ],
                            ));
                  },
                );
              }
              return BlocListener<SaveUnSavePostBloc, SaveUnSavePostState>(
                listener: (context, state) {
                  if (state is SavePostSuccessState) {
                    log('message');
                    context.read<SavedPostsBloc>().add(GetSavedPostEvent());
                  }
                },
                child: PopUpMenuWidgetButton(
                  onTap1: () {
                    context
                        .read<SaveUnSavePostBloc>()
                        .add(SavePostEvent(postid: widget.postid));
                  },
                  buttontxt: 'Save',
                  txt2: 'Delete',
                  onTap2: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              //  backgroundColor: Colors.transparent.withOpacity(0.5),
                              title: const Text('Delete post'),
                              content: const Text(
                                  "Are you sure you want \nto delete?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    context.read<DeletePostBloc>().add(
                                        DeletePostfromProfileEvent(
                                            postid: widget.postid!));
                                    deletePost(widget.postid!);
                                    context.read<UserProfileBloc>().add(
                                        UserProfileInitialDetailsFetchEvent());
                                         Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'delete',
                                    style: TextStyle(color: kred),
                                  ),
                                ),
                              ],
                            ));
                  },
                ),
              );
            },
          );
        }));
  }
}
