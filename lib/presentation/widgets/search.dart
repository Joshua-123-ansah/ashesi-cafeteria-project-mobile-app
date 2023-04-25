
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/food_model.dart';
import '../../providers/food_provider.dart';
import 'foodcard.dart';

class Search extends SearchDelegate<void> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
      IconButton(
        icon: const Icon(Icons.mic),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<FoodModel> searchedItems =
        context.read<FoodProvider>().searchList(query);

    return ListView.builder(
      itemCount: searchedItems.length,
      itemBuilder: (context, index) {
        return FoodCard(
          food: searchedItems[index],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<FoodModel> searchedItems =
        context.read<FoodProvider>().searchList(query);

    return ListView.builder(
      itemCount: searchedItems.length,
      itemBuilder: (context, index) {
        return FoodCard(
          food: searchedItems[index],
        );
      },
    );
  }
}
