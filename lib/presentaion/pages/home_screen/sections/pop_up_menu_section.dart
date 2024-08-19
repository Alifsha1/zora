import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/presentaion/bloc/save_Unsave_post/save_un_save_post_bloc.dart';
import 'package:zora/presentaion/bloc/saved_posts/saved_posts_bloc.dart';
import 'package:zora/presentaion/pages/user_saved_postimage/widgets/pop_up_home.dart';
import 'package:zora/presentaion/pages/user_saved_postimage/widgets/pop_up_menu_widget.dart';

class PopUpMenuSection extends StatefulWidget {
  final String? postid;
 const PopUpMenuSection({
    super.key, this.postid,
  });

  @override
  State<PopUpMenuSection> createState() => _PopUpMenuSectionState();
}

class _PopUpMenuSectionState extends State<PopUpMenuSection> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 23,
      backgroundColor: Colors.transparent.withOpacity(.5),
      child: Builder(
        builder: (BuildContext context) {
          return BlocBuilder<SavedPostsBloc, SavedPostsState>(
            builder: (context, stateA) {
              if (stateA is GetSavedPostSuccessState) {
                log('Saved post succes state inside bloc builder');
                if (stateA.savedpostids.contains(widget.postid)) {
                  log('saved fetcing ${stateA.savedpostids} ${widget.postid}');
                  return PopUpHomeWidget(
                    onTap1: () {
                      context
                          .read<SaveUnSavePostBloc>()
                          .add(UnsavePostEvent(postid: widget.postid!));
                      stateA.savedpostids.remove(widget.postid);
                      setState(() {});
                    },
                    buttontxt: 'Unsave',
                    //txt2: 'Report',
                  );
                }
                return PopUpHomeWidget(
                  onTap1: () {
                    context
                        .read<SaveUnSavePostBloc>()
                        .add(SavePostEvent(postid: widget.postid!));
                    stateA.savedpostids.add(widget.postid);
                    setState(() {});
                  },
                  buttontxt: 'Save',
                  //txt2: 'Report',
                );
              }
              return BlocListener<SaveUnSavePostBloc, SaveUnSavePostState>(
                listener: (context, state) {
                  if (state is SavePostSuccessState) {
                    log('message');
                    context.read<SavedPostsBloc>().add(GetSavedPostEvent());
                  }
                },
                child: PopUpHomeWidget(
                  onTap1: () {
                    context
                        .read<SaveUnSavePostBloc>()
                        .add(SavePostEvent(postid: widget.postid!));
                  },
                  buttontxt: 'Save',
                  //txt2: 'Report',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
