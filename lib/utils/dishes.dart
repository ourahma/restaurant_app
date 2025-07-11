import 'models.dart';

List<Dish> dishes = [
  // PIZZAS (7 types)
  Dish(
    name: 'Pizza Margherita',
    description: 'Tomates fraîches, mozzarella di bufala et basilic',
    price: 85.0,
    imageUrl: 'assets/images/pizza.jpg',
    category: 'Pizzas',
    likes: 15,
    dislikes: 2,
    comments: [
      Comment(author: 'Marie', text: 'Délicieuse et authentique!', date: DateTime.now()),
    ],
  ),
  Dish(
    name: 'Pizza Quatre Fromages',
    description: 'Mozzarella, gorgonzola, parmesan et chèvre',
    price: 95.0,
    imageUrl: 'assets/images/pizza_quatre_fromages.jpeg',
    category: 'Pizzas',
    likes: 22,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Pizza Pepperoni',
    description: 'Pepperoni épicé et mozzarella fondante',
    price: 90.0,
    imageUrl: 'assets/images/pizza_pepperoni.jpeg',
    category: 'Pizzas',
    likes: 18,
    dislikes: 3,
    comments: [],
  ),
  Dish(
    name: 'Pizza Végétarienne',
    description: 'Légumes grillés, champignons et olives',
    price: 88.0,
    imageUrl: 'assets/images/pizza_vegetarienne.jpeg',
    category: 'Pizzas',
    likes: 12,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Pizza Fruits de Mer',
    description: 'Crevettes, moules et calamars',
    price: 120.0,
    imageUrl: 'assets/images/pizza_fruits_mer.jpeg',
    category: 'Pizzas',
    likes: 25,
    dislikes: 2,
    comments: [],
  ),
  Dish(
    name: 'Pizza Orientale',
    description: 'Merguez, poivrons et harissa',
    price: 98.0,
    imageUrl: 'assets/images/pizza_orientale.jpg',
    category: 'Pizzas',
    likes: 20,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Pizza Royale',
    description: 'Jambon, champignons et œuf',
    price: 105.0,
    imageUrl: 'assets/images/pizza_royale.jpeg',
    category: 'Pizzas',
    likes: 16,
    dislikes: 0,
    comments: [],
  ),

  // BURGERS (7 types)
  Dish(
    name: 'Burger Classique',
    description: 'Steak de bœuf, salade et tomate',
    price: 75.0,
    imageUrl: 'assets/images/burger.jpg',
    category: 'Burgers',
    likes: 22,
    dislikes: 3,
    comments: [
      Comment(author: 'Paul', text: 'Excellent burger!', date: DateTime.now()),
      Comment(author: 'Sophie', text: 'Très bon rapport qualité-prix', date: DateTime.now()),
    ],
  ),
  Dish(
    name: 'Burger Cheese',
    description: 'Double steak et double fromage',
    price: 85.0,
    imageUrl: 'assets/images/burger_cheese.jpeg',
    category: 'Burgers',
    likes: 28,
    dislikes: 2,
    comments: [],
  ),
  Dish(
    name: 'Burger Chicken',
    description: 'Escalope de poulet grillée',
    price: 70.0,
    imageUrl: 'assets/images/burger_chicken.jpeg',
    category: 'Burgers',
    likes: 19,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Burger Fish',
    description: 'Filet de poisson pané',
    price: 78.0,
    imageUrl: 'assets/images/burger_fish.jpeg',
    category: 'Burgers',
    likes: 14,
    dislikes: 4,
    comments: [],
  ),
  Dish(
    name: 'Burger Végétarien',
    description: 'Steak végétal et avocat',
    price: 68.0,
    imageUrl: 'assets/images/burger_vegetarien.jpg',
    category: 'Burgers',
    likes: 11,
    dislikes: 2,
    comments: [],
  ),
  Dish(
    name: 'Burger BBQ',
    description: 'Steak de bœuf et sauce BBQ',
    price: 88.0,
    imageUrl: 'assets/images/burger_bbq.jpeg',
    category: 'Burgers',
    likes: 24,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Burger Royal',
    description: 'Triple steak, fromage et bacon',
    price: 95.0,
    imageUrl: 'assets/images/burger_royal.jpeg',
    category: 'Burgers',
    likes: 30,
    dislikes: 3,
    comments: [],
  ),

  // TAJINES (6 types)
  Dish(
    name: 'Tajine Poulet aux Olives',
    description: 'Poulet mijoté aux olives vertes',
    price: 110.0,
    imageUrl: 'assets/images/tajine_poulet_olives.jpeg',
    category: 'Tajines',
    likes: 35,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Tajine Agneau aux Pruneaux',
    description: 'Agneau fondant aux pruneaux',
    price: 130.0,
    imageUrl: 'assets/images/tajine_agneau_pruneaux.jpg',
    category: 'Tajines',
    likes: 28,
    dislikes: 2,
    comments: [],
  ),
  Dish(
    name: 'Tajine Bœuf aux Légumes',
    description: 'Bœuf mijoté avec légumes',
    price: 120.0,
    imageUrl: 'assets/images/tajine_boeuf_legumes.jpeg',
    category: 'Tajines',
    likes: 22,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Tajine Poisson aux Légumes',
    description: 'Poisson frais aux légumes',
    price: 125.0,
    imageUrl: 'assets/images/tajine_poisson.jpeg',
    category: 'Tajines',
    likes: 18,
    dislikes: 3,
    comments: [],
  ),
  Dish(
    name: 'Tajine Kefta aux Œufs',
    description: 'Boulettes de viande aux œufs',
    price: 105.0,
    imageUrl: 'assets/images/tajine_kefta.jpeg',
    category: 'Tajines',
    likes: 26,
    dislikes: 2,
    comments: [],
  ),
  Dish(
    name: 'Tajine Végétarien',
    description: 'Légumes de saison mijotés',
    price: 85.0,
    imageUrl: 'assets/images/tajine_vegetarien.jpg',
    category: 'Tajines',
    likes: 15,
    dislikes: 1,
    comments: [],
  ),

  // COUSCOUS (5 types)
  Dish(
    name: 'Couscous Royal',
    description: 'Agneau, poulet et merguez',
    price: 140.0,
    imageUrl: 'assets/images/couscous_royal.JPG',
    category: 'Couscous',
    likes: 42,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Couscous Agneau',
    description: 'Agneau tendre aux légumes',
    price: 125.0,
    imageUrl: 'assets/images/couscous_agneau.jpeg',
    category: 'Couscous',
    likes: 31,
    dislikes: 2,
    comments: [],
  ),
  Dish(
    name: 'Couscous Poulet',
    description: 'Poulet fermier aux légumes',
    price: 115.0,
    imageUrl: 'assets/images/couscous_poulet.jpeg',
    category: 'Couscous',
    likes: 28,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Couscous Végétarien',
    description: 'Légumes variés et pois chiches',
    price: 95.0,
    imageUrl: 'assets/images/couscous_vegetarien.jpg',
    category: 'Couscous',
    likes: 19,
    dislikes: 3,
    comments: [],
  ),


  // BOISSONS (8 types)
  Dish(
    name: 'Eau Minérale Sidi Ali',
    description: 'Eau minérale naturelle (50cl)',
    price: 12.0,
    imageUrl: 'assets/images/eau_sidi_ali.jpg',
    category: 'Boissons',
    likes: 8,
    dislikes: 0,
    comments: [],
  ),
  Dish(
    name: 'Coca-Cola',
    description: 'Boisson gazeuse (33cl)',
    price: 15.0,
    imageUrl: 'assets/images/coca_cola.jpg',
    category: 'Boissons',
    likes: 12,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Jus d\'Orange Frais',
    description: 'Jus d\'orange pressé (25cl)',
    price: 20.0,
    imageUrl: 'assets/images/jus_orange.jpg',
    category: 'Boissons',
    likes: 18,
    dislikes: 0,
    comments: [],
  ),
  Dish(
    name: 'Thé à la Menthe',
    description: 'Thé vert traditionnel',
    price: 18.0,
    imageUrl: 'assets/images/the_menthe.jpeg',
    category: 'Boissons',
    likes: 25,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Café Espresso',
    description: 'Café espresso italien',
    price: 15.0,
    imageUrl: 'assets/images/cafe_espresso.JPG',
    category: 'Boissons',
    likes: 14,
    dislikes: 2,
    comments: [],
  ),
  Dish(
    name: 'Limonade Maison',
    description: 'Limonade artisanale',
    price: 22.0,
    imageUrl: 'assets/images/limonade.jpg',
    category: 'Boissons',
    likes: 16,
    dislikes: 0,
    comments: [],
  ),
  Dish(
    name: 'Smoothie Fruits Rouges',
    description: 'Mélange de fruits rouges (30cl)',
    price: 35.0,
    imageUrl: 'assets/images/smoothie_fruits_rouges.JPG',
    category: 'Boissons',
    likes: 21,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Lassi à la Mangue',
    description: 'Boisson au yaourt et mangue',
    price: 28.0,
    imageUrl: 'assets/images/lassi_mangue.jpeg',
    category: 'Boissons',
    likes: 13,
    dislikes: 2,
    comments: [],
  ),

  // DESSERTS (3 types)
  Dish(
    name: 'Tiramisu',
    description: 'Dessert italien au café',
    price: 45.0,
    imageUrl: 'assets/images/tiramisu.jpg',
    category: 'Desserts',
    likes: 18,
    dislikes: 0,
    comments: [],
  ),
  Dish(
    name: 'Baklava',
    description: 'Pâtisserie orientale aux amandes',
    price: 35.0,
    imageUrl: 'assets/images/baklava.jpeg',
    category: 'Desserts',
    likes: 22,
    dislikes: 1,
    comments: [],
  ),
  Dish(
    name: 'Crème Brûlée',
    description: 'Crème vanillée caramélisée',
    price: 40.0,
    imageUrl: 'assets/images/creme_brulee.jpeg',
    category: 'Desserts',
    likes: 19,
    dislikes: 0,
    comments: [],
  ),
];

List<String> categories = ['Tous', 'Vos plats préférés', 'Pizzas', 'Burgers', 'Tajines', 'Couscous', 'Boissons', 'Desserts'];