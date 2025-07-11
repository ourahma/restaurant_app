import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/models.dart';
import 'package:restaurant_app/utils/colors.dart';
import '../utils/dishes.dart';
import '../utils/theme_provider.dart';
import 'package:provider/provider.dart';

import 'dish_details.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = 'Tous';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Dish> getFilteredDishes() {
    if (selectedCategory == 'Tous') {
      return dishes;
    } else if (selectedCategory == 'Vos plats préférés') {
      List<Dish> likedDishes = dishes.where((dish) => dish.likes > 0).toList();
      likedDishes.sort((a, b) => b.likes.compareTo(a.likes));
      return likedDishes;
    }
    return dishes.where((dish) => dish.category == selectedCategory).toList();
  }

  void _showDishDetails(BuildContext context, Dish dish) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return DishDetailsDialog(
          dish: dish,
          onLike: () => _onLike(dish),
          onDislike: () => _onDislike(dish),
          onAddComment: (comment) => _onAddComment(dish, comment),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil",
            style: Theme.of(context).textTheme.bodyLarge),
        actions: [
          Switch.adaptive(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),
    ]
      ),
      body: Column(
        children: [
          // Barre des catégories avec noms centrés (sans tabAlignment)
          Container(
            color: Colors.transparent,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 60,
                width: double.infinity,
                child: Center(
                  child: TabBar(
                    indicator: BoxDecoration(
                      color : AppColors.yellow,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: themeProvider.isDarkMode ? AppColors.textLight : AppColors.textDark,
                    unselectedLabelColor: (themeProvider.isDarkMode ? AppColors.textLight : AppColors.textDark).withOpacity(0.7),
                    indicatorColor: AppColors.yellow,
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
                    tabs: categories.map((category) => Tab(text: category)).toList(),
                    onTap: (index) {
                      setState(() {
                        selectedCategory = categories[index];
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          // Contenu principal
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: categories.map((category) {
                List<Dish> filteredDishes = category == 'Tous'
                    ? dishes
                    : category == 'Vos plats préférés'
                    ? getFilteredDishes()
                    : dishes.where((dish) => dish.category == selectedCategory).toList();

                return Container(
                  padding: EdgeInsets.all(16),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 cartes par ligne comme dans l'image de référence
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.85, // Ratio similaire à l'image de référence
                    ),
                    itemCount: filteredDishes.length,
                    itemBuilder: (context, index) {
                      return ReferenceDishCard(
                        dish: filteredDishes[index],
                        onTap: () => _showDishDetails(context, filteredDishes[index]),
                        onLike: () => _onLike(filteredDishes[index]),
                        onDislike: () => _onDislike(filteredDishes[index]),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _onLike(Dish dish) {
    setState(() {
      dish.likes++;
    });
  }

  void _onDislike(Dish dish) {
    setState(() {
      dish.dislikes++;
    });
  }

  void _onAddComment(Dish dish, String commentText) {
    setState(() {
      dish.comments.add(Comment(
        author: 'Utilisateur',
        text: commentText,
        date: DateTime.now(),
      ));
    });
  }
}

// Widget pour les cartes selon l'image de référence
class ReferenceDishCard extends StatelessWidget {
  final Dish dish;
  final VoidCallback onTap;
  final VoidCallback onLike;
  final VoidCallback onDislike;

  ReferenceDishCard({
    required this.dish,
    required this.onTap,
    required this.onLike,
    required this.onDislike,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Container(
                  width: double.infinity,
                  child: Image.asset(
                    dish.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.restaurant,
                          size: 40,
                          color: Colors.grey[600],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Infos du plat
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    dish.description,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${dish.price.toInt()} DH',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: onLike,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.thumb_up,
                                    size: 14,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '${dish.likes}',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          GestureDetector(
                            onTap: onDislike,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.thumb_down,
                                    size: 14,
                                    color:Theme.of(context).primaryColor,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '${dish.dislikes}',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

