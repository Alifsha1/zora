import 'dart:developer';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/utils/alerts.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/bloc/comment/comment_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';

class CommentSecWidget extends StatefulWidget {
  final UserModel user;
  final PostModel post;
  const CommentSecWidget({super.key, required this.user, required this.post});

  @override
  State<CommentSecWidget> createState() => _CommentSecWidgetState();
}

class _CommentSecWidgetState extends State<CommentSecWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            commentBox(context);
          },
          child: const Icon(
            FeatherIcons.messageCircle,
            size: 25,
            color: kwhite,
          ),
        ),
        Text(
          widget.post.comments == null || widget.post.comments!.isEmpty
              ? 'No Comments'
              : widget.post.comments!.length.toString(),
          style: const TextStyle(
            color: kwhite,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Future<dynamic> commentBox(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final TextEditingController commentcontroller = TextEditingController();
    late final controller = SlidableController(this);

    return showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        final bottompadding = MediaQuery.of(context).viewInsets.bottom;
        return BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, stateA) {
            context.watch<UserProfileBloc>().state;

            if (stateA is UserProfileSuccessfulState) {
              return Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: bottompadding),
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: mediawidth * 0.05),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.post.comments!.length.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                ' Comments',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: widget.post.comments!.isEmpty
                                ? const Center(
                                    child: Text(
                                      'No Comments',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: widget.post.comments!.length,
                                    itemBuilder: (context, index) {
                                      bool isuser = false;
                                      log('is user: ${stateA.user.id} commentuser id :${widget.post.comments![index].user.id}index$index');
                                      final comment =
                                          widget.post.comments![index];
                                      log('boool $isuser');
                                      if (stateA.user.id ==
                                          widget
                                              .post.comments![index].user.id) {
                                        isuser = true;
                                        log('boool $isuser');
                                      }
                                      log("post id:${widget.post.id}  comment id :${widget.post.comments![index].id}");
                                      // log(message)
                                      final time =
                                          formatTimeAgo(comment.createdAt);

                                      return Slidable(
                                        key: ValueKey(index),
                                        controller: controller,
                                        enabled: isuser,
                                        endActionPane: isuser
                                            ? ActionPane(
                                                motion: const ScrollMotion(),
                                                children: [
                                                    SlidableAction(
                                                      flex: 1,
                                                      onPressed: (_) {
                                                        context
                                                            .read<CommentBloc>()
                                                            .add(
                                                                DeleteCommentEvent(
                                                              postid: widget
                                                                  .post
                                                                  .comments![
                                                                      index]
                                                                  .id,
                                                              commentid: widget
                                                                  .post.id!,
                                                              postModel:
                                                                  widget.post,
                                                            ));
                                                      },
                                                      backgroundColor: kwhite,
                                                      foregroundColor: kred,
                                                      icon:
                                                          CupertinoIcons.delete,
                                                      //  label: 'Delete',
                                                    )
                                                  ])
                                            : null,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(comment
                                                              .user
                                                              .profilePicture
                                                              .toString()),
                                                    ),
                                                  ],
                                                ),
                                                kwidht10,
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        BoldTitles(
                                                            titles: comment
                                                                .user.fullName
                                                                .toString(),
                                                            fontsize: 16),
                                                        kwidht10,
                                                        NormalBondTitles(
                                                          titles: time,
                                                          color: kgrey,
                                                        ),
                                                      ],
                                                    ),
                                                    Text(comment.comments),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const Divider(
                                              indent: 10,
                                              endIndent: 10,
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kwhite,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3.0, vertical: 3.0),
                          child:
                              // Builder(
                              // builder: (context) {
                              //   final stateA =
                              //       context.watch<UserProfileBloc>().state;
                              // final stateB = context.watch<CommentBloc>().state;
                              // if (stateA is UserProfileSuccessfulState) {
                              //   return
                              Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: commentcontroller,
                                  decoration: InputDecoration(
                                    hintText: 'Add a comment...',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(TablerIcons.send),
                                onPressed: () {
                                  log('user ${stateA.user.id}');
                                  context.read<CommentBloc>().add(
                                        AddCommentEvent(
                                            postid: widget.post.id!,
                                            comment: commentcontroller.text,
                                            postModel: widget.post,
                                            userModel: stateA.user),
                                      );
                                  commentcontroller.clear();
                                  //  navigatorpop(context);
                                  customSnackbar(context, 'posting', kgrey);
                                },
                              ),
                            ],
                          )
                          // }
                          // return Container();
                          //},
                          // ),
                          ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        );
      },
    );
  }

  String formatTimeAgo(String dateTimeString) {
    try {
      DateTime dateTime = DateTime.parse(dateTimeString);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays > 7) {
        return DateFormat('yMMMd').format(dateTime);
      } else if (difference.inDays >= 2) {
        return '${difference.inDays}days';
      } else if (difference.inDays >= 1) {
        return 'yesterday';
      } else if (difference.inHours >= 1) {
        return '${difference.inHours}hrs';
      } else if (difference.inMinutes >= 1) {
        return '${difference.inMinutes}m';
      } else {
        return 'now';
      }
    } catch (e) {
      return 'Invalid date';
    }
  }
}
