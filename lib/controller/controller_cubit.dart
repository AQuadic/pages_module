import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages_module/models/page_model.dart';
import 'package:pages_module/ui/page_screen.dart';

part 'controller_state.dart';

class ControllerCubit extends Cubit<ControllerState> {
  ControllerCubit(this._dioInstance) : super(ControllerInitial());

  static ControllerCubit get(context) => BlocProvider.of(context);

  final dynamic _dioInstance;

  List<PageModel>? pages;

  Future<void> fetchPages() async {
    emit(PagesLoading());
    try {
      final value = await _dioInstance.getData('pages');
      if (value is Response) {
        final pages = value.data as List;
        this.pages = pages.map((page) => PageModel.fromJson(page)).toList();
        emit(
          PagesLoaded(
            msg: 'Pages loaded successfully with ${pages.length} items',
          ),
        );
      } else {
        emit(PagesError('Failed to load pages'));
      }
    } catch (e) {
      emit(PagesError(e.toString()));
    }
  }

  onPageTap(BuildContext context, PageModel page) {
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
}
