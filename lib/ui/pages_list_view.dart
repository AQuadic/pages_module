import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages_module/controller/controller_cubit.dart';
import 'package:pages_module/models/page_model.dart';

class PagesListView extends StatelessWidget {
  final Widget Function(BuildContext, List<PageModel>) builder;
  final ControllerCubit pagesController;

  const PagesListView({
    super.key,
    required this.builder,
    required this.pagesController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => pagesController,
      child: BlocBuilder<ControllerCubit, ControllerState>(
        builder: (context, state) {
          final pages = pagesController.pages;
          if (pages == null) {
            return Center(
              child: CupertinoActivityIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (pages.isEmpty) {
            return SizedBox.shrink();
          } else {
            return builder(context, pages);
          }
        },
      ),
    );
  }
}
