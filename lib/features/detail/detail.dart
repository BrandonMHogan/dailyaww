import 'package:dailyaww/common/routes.dart';
import 'package:dailyaww/features/detail/detail_content.dart';
import 'package:dailyaww/features/detail/detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class DetailWidget extends StatefulWidget {
  final DetailViewModel viewModel;

  DetailWidget({@required this.viewModel});

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  void initState() {
    super.initState();

    widget.viewModel.validateIfSaved();

    widget.viewModel.popBackstack.listen((event) {
      if (event) Routes.pop(context);
    });

    widget.viewModel.saved.listen((event) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => widget.viewModel, child: DetailContent());
  }
}
