library pages_module;

import 'package:flutter/material.dart';
import 'package:pages_module/controller/controller_cubit.dart';
import 'package:pages_module/models/page_model.dart';
import 'package:pages_module/ui/pages_list_view.dart';

class PagesModule {
  PagesModule._();

  static final instance = PagesModule._();

  late ControllerCubit pagesController;

  initController(dynamic dioInstance) {
    pagesController = ControllerCubit(dioInstance);
  }

  Future<void> fetchPages() async {
    await pagesController.fetchPages();
  }

  Widget pages({
    required Widget Function(BuildContext, List<PageModel>) builder,
  }) {
    return PagesListView(builder: builder, pagesController: pagesController);
  }

  void onPageTap(BuildContext context, PageModel page) =>
      pagesController.onPageTap(context, page);

  bool get hasPages => pagesController.pages?.isNotEmpty ?? false;
}
