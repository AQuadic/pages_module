import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages_module/controller/controller_cubit.dart';

import '../dto/page_dto.dart';

class PagesListView extends StatefulWidget {
  final dynamic dioInstance;
  final Widget Function(BuildContext, List<PageDto>) builder;
  final ControllerCubit? pagesController;

  const PagesListView({
    super.key,
    this.dioInstance,
    required this.builder,
    this.pagesController,
  });

  @override
  State<PagesListView> createState() => _PagesListViewState();
}

class _PagesListViewState extends State<PagesListView> {
  late ControllerCubit controller;

  @override
  void initState() {
    super.initState();
    controller = widget.pagesController ?? ControllerCubit(widget.dioInstance);
    _getPages();
  }

  _getPages() async {
    try {
      if (widget.pagesController != null) await controller.fetchPages();
    } catch (e, s) {
      print(e);
      print(s);
    }
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
