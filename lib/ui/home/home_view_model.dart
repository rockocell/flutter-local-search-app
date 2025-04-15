import 'package:flutter_local_search_app/data/model/local.dart';
import 'package:flutter_local_search_app/data/repository/local_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  HomeState({required this.locals});
  List<Local>? locals;
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(locals: null);
  }

  Future<void> search(String query) async {
    LocalRepository localRepository = LocalRepository();
    state = HomeState(locals: await localRepository.search(query));
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
