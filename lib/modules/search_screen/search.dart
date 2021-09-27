import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/shared/components/components.dart';
import 'package:newapp/shared/cubit/app_news_state.dart';
import 'package:newapp/shared/cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  //const SearchScreen({Key? key}) : super(key: key);
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, AppNewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var list = NewsCubit.get(context).search!;
        return Scaffold(
          appBar: AppBar(
            title: Text('Search'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    icon: Icons.search,
                    hint: 'Search',
                    onChange: (String value) {
                      cubit.getSearch(value);
                    }),
              ),
              Expanded(
                child: list.length > 0
                    ? ListView.separated(
                        itemBuilder: (context, index) =>
                            buildArticleItem(list[index], context),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount: list.length)
                    : Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        );
      },
    );
  }
}
