import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/shared/components/components.dart';
import 'package:newapp/shared/cubit/app_news_state.dart';
import 'package:newapp/shared/cubit/cubit.dart';

class SportNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, AppNewsState>(
      builder: (context, state) {
        var list = NewsCubit.get(context).sport!;
        return list.length > 0
            ? ListView.separated(
                itemBuilder: (context, index) =>
                    buildArticleItem(list[index], context),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: list.length)
            : Center(child: CircularProgressIndicator());
      },
      listener: (context, state) {},
    );
  }
}
