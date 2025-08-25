import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages_module/controller/controller_cubit.dart';
import 'package:pages_module/ui/page_screen.dart';

import '../dto/page_dto.dart';

class PagesListView extends StatefulWidget {
  const PagesListView({super.key, this.dioInstance, required this.builder});

  final dynamic dioInstance;
  final Widget Function(BuildContext, List<PageDto>) builder;

  static onPageTap(BuildContext context, PageDto page) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => PageScreen(
          title: page.title?.get(context) ?? '',
          description: page.description?.get(context) ?? '',
        ),
      ),
    );
  }

  @override
  State<PagesListView> createState() => _PagesListViewState();
}

class _PagesListViewState extends State<PagesListView> {
  late ControllerCubit controller;

  @override
  void initState() {
    super.initState();
    controller = ControllerCubit(widget.dioInstance);
    _getPages();
  }

  _getPages() {
    controller.fetchPages();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => controller,
      child: BlocBuilder<ControllerCubit, ControllerState>(
        builder: (context, state) {
          final pages = controller.pages;
          if (pages == null) {
            return Center(
              child: CupertinoActivityIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (pages.isEmpty) {
            return SizedBox.shrink();
          } else {
            return widget.builder(context, pages);
          }
        },
      ),
    );
  }
}
