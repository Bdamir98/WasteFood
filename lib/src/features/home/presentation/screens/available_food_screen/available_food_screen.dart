import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waste_food_management/src/core/helper_widgets/show_snackbar.dart';

import '../../../../../core/static_db.dart';
import '../../../../../injection/injection_container.dart';
import '../../../../food_details/presentation/pages/food_details_page.dart';
import '../../bloc/home_bloc.dart';
import 'components/food_card.dart';
import 'dialogs/create_post_dialog.dart';

class AvailableFoodScreen extends StatelessWidget {
  const AvailableFoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? currentUsers = FirebaseAuth.instance.currentUser;
    final bloc = context.read<HomeBloc>();
    bloc.add(const GetAllPostEvent());

    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          'Featured Available Food',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color(0xffFB8500),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    currentUsers != null &&
                            currentUsers.phoneNumber != null &&
                            currentUser!.role == 'Donner'
                        ? InkWell(
                            onTap: () {
                              createPostDialogs(context);
                            },
                            child: Container(
                              height: 50,
                              width: 190,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Donate Food Now',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: Color(0xff2D2C5C),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : currentUser?.role == 'volunteer'
                            ? Text(
                                'Please Login and Verify your Phone Number\nFor Create new post',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Container(),
                    const SizedBox(
                      height: 50,
                    ),
                    Table(
                      defaultColumnWidth: const FixedColumnWidth(180.0),
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                      children: [
                        TableRow(children: [
                          Column(children: [
                            Text(
                              'CHOOSE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xff2D2C5C),
                              ),
                            ),
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            TextButton(
                              onPressed: () {
                                bloc.add(GetAllPostEvent());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('All Posts'),
                              ),
                            )
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            TextButton(
                              onPressed: () {
                                bloc.add(
                                    GetPostByDivisionEvent(division: 'Dhaka'));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Dhaka'),
                              ),
                            )
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            TextButton(
                              onPressed: () {
                                bloc.add(GetPostByDivisionEvent(
                                    division: 'Chittagong'));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Chittagong'),
                              ),
                            )
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            TextButton(
                              onPressed: () {
                                bloc.add(
                                    GetPostByDivisionEvent(division: 'Khulna'));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Khulna'),
                              ),
                            )
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            TextButton(
                              onPressed: () {
                                bloc.add(GetPostByDivisionEvent(
                                    division: 'Rangpur'));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Rangpur'),
                              ),
                            )
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            TextButton(
                              onPressed: () {
                                bloc.add(GetPostByDivisionEvent(
                                    division: 'Barisal'));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Barisal'),
                              ),
                            )
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            TextButton(
                              onPressed: () {
                                bloc.add(GetPostByDivisionEvent(
                                    division: 'Rajshahi'));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Rajshahi'),
                              ),
                            )
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            TextButton(
                              onPressed: () {
                                bloc.add(GetPostByDivisionEvent(
                                    division: 'Mymensingh'));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Mymensingh'),
                              ),
                            )
                          ]),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                height: MediaQuery.of(context).size.height * 0.7,
                child: Center(
                  child: BlocConsumer<HomeBloc, HomeState>(
                    bloc: bloc,

                    listener: (context, state) {
                      if (state is FailureState) {
                        showSnackBar(context, state.message);
                      }
                    },
                    // buildWhen: (previous, current) => current is GetAllPostState || current is LoadingState,
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const CircularProgressIndicator();
                      }

                      if (bloc.allPosts.isEmpty) {
                        return const Text('No Food found');
                      }

                      return GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5.0,
                        ),
                        itemCount: bloc.allPosts.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, FoodDetailsPage.routeName,
                                  arguments: bloc.allPosts[index]);
                            },
                            child: FoodCard(
                              imagePath: bloc.allPosts[index].image!,
                              foodName: bloc.allPosts[index].foodName!,
                              placeName: bloc.allPosts[index].placeName!,
                              address: bloc.allPosts[index].locationDetails!,
                              foodStatus:
                                  bloc.allPosts[index].quantity != null &&
                                          bloc.allPosts[index].quantity! > 0
                                      ? 'Available'
                                      : 'Not Available',
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
