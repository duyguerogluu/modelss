import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:modelss/components/post_card.dart';
import 'package:modelss/models/user_model.dart';
import 'package:modelss/riverpod/riverpod_management.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int firstLikeValue = 0;
  late int lastLikeValue;
  bool situation = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: home.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : FutureBuilder<UserModel?>(
                future: home.getData(),
                builder: (context, snapshot) {
                  print("Connection State: ${snapshot.connectionState}");
                  print("Has Error: ${snapshot.hasError}");
                  print("Has Data: ${snapshot.hasData}");
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Hata: ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text("Veri bulunamadı."),
                    );
                  } else {
                    UserModel user = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: Color.fromARGB(255, 200, 137, 226),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Column(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 36,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        "4.5/5",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          user.data?.username ?? "",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 255, 181, 71),
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 4.0,
                                            color: situation
                                                ? const Color.fromARGB(
                                                    255, 245, 196, 124)
                                                : Colors.transparent,
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://twia.cloud/api/@/cdn/uploads/${user.data?.photo}" ??
                                                  "https://icon-library.com/images/default-user-icon/default-user-icon-8.jpg"),
                                          radius: 50,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Column(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 36,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        "3000",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          //buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 0, sigmaY: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                                0.5), // Kare arkaplan rengi
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 119, 194, 255),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(
                                                    0, 3), // Gölge konumu
                                              ),
                                            ],
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              _makePhoneCall(
                                                  "+90${user.data?.phone ?? ""}");
                                            },
                                            icon: const Icon(
                                              Icons.phone,
                                              color: Color.fromARGB(
                                                  255, 54, 165, 255),
                                              size: 28,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 0, sigmaY: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                                0.5), // Kare arkaplan rengi
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 250, 134, 240),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(
                                                    0, 3), // Gölge konumu
                                              ),
                                            ],
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              likeButton(lastLikeValue);
                                              firstLikeValue = lastLikeValue;
                                            },
                                            icon: const Icon(
                                              Icons.favorite,
                                              color: Color.fromARGB(
                                                  255, 250, 59, 234),
                                              size: 28,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 0, sigmaY: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                                0.5), // Kare arkaplan rengi
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 255, 174, 67),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(
                                                    0, 3), // Gölge konumu
                                              ),
                                            ],
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              likeButton(lastLikeValue);
                                              firstLikeValue = lastLikeValue;
                                            },
                                            icon: const Icon(
                                              Icons.chat,
                                              color: Color.fromARGB(
                                                  255, 255, 145, 0),
                                              size: 28,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 0, sigmaY: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                                0.5), // Kare arkaplan rengi
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 166, 150, 165),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(
                                                    0, 3), // Gölge konumu
                                              ),
                                            ],
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              likeButton(lastLikeValue);
                                              firstLikeValue = lastLikeValue;
                                            },
                                            icon: const Icon(
                                              Icons.create,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              size: 28,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //posts
                          postCard(),
                        ],
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

likeButton(int value) {
  value = value + 1;
  print(value);
  return value;
}
