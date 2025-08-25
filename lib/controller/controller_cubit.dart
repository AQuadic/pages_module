import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pages_module/dto/page_dto.dart';
import 'package:dio/dio.dart';

part 'controller_state.dart';

class ControllerCubit extends Cubit<ControllerState> {
  ControllerCubit(this._dioInstance) : super(ControllerInitial());

  static ControllerCubit get(context) => BlocProvider.of(context);
  final dynamic _dioInstance;
  List<PageDto>? pages;

  Future<void> fetchPages() async {
    emit(PagesLoading());
    try {
      final value = await _dioInstance.getData('pages');
      if (value is Response) {
        final pages = value.data as List;
        this.pages = pages.map((page) => PageDto.fromJson(page)).toList();
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
}
