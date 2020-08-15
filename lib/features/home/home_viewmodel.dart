import 'package:dailyaww/features/list/content_list_viewmodel.dart';

class HomeViewModel {
  final ContentListViewModel contentViewModel;

  refresh() {
    contentViewModel.setRefresh(true);
  }

  /// forced to set the content list view model
  HomeViewModel(this.contentViewModel);

  showSaved() {
    contentViewModel.showSavedContent(true);
  }

  showNew() {
    contentViewModel.showSavedContent(false);
  }
}
