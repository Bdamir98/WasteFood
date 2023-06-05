import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_food_management/src/core/entities/food_post_model.dart';
import 'package:waste_food_management/src/core/helper_widgets/show_snackbar.dart';

import '../../../bloc/home_bloc.dart';

createPostDialogs(BuildContext context) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bloc = context.read<HomeBloc>();

  String foodName = '';
  String donnerName = '';
  String donnerPhoneNumber = '';
  String description = '';
  int quantity = 0;
  String placeName = '';
  String locationDetails = '';
  String division = '';
  String city = '';
  String image = '';

  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text('Create New Post'),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                BlocListener<HomeBloc, HomeState>(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is ImageUploadSuccessState) {
                      image = state.downloadLink;
                      showSnackBar(context, 'Image Uploaded');
                    }

                    if (state is ImageUploadFailureState) {
                      showSnackBar(context, state.message);
                    }
                    if (state is CreatePostSuccessState) {
                      Navigator.pop(context);
                      showSnackBar(context, state.message);
                      bloc.add(const GetAllPostEvent());
                    }
                  },
                  child: ImageWidget(
                    onSelectedImage: (xFile) {
                      bloc.add(UploadImageEvent(xFile: xFile));
                    },
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  decoration: const InputDecoration(labelText: 'Food Name'),
                  onChanged: (value) {
                    foodName = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Food Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Donor Name'),
                  onChanged: (value) {
                    donnerName = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  onChanged: (value) {
                    donnerPhoneNumber = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Number";
                    } else if (!RegExp(r'(^(\+88)?(01){1}[3456789]{1}(\d){8})$')
                        .hasMatch(value)) {
                      return "Please Enter Valid Phone Number";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Food Description'),
                  onChanged: (value) {
                    description = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Description";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Possible to serve person'),
                  onChanged: (value) {
                    quantity = int.parse(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Quantity";
                    } else if (!RegExp(r'^[1-9][0-9]*$').hasMatch(value)) {
                      return "Please Enter Valid Quantity (greater than 0)";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Place name'),
                  onChanged: (value) {
                    placeName = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Location";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // _buildPhotoFieldWithIcon(),
                // TextFormField(
                //   decoration: const InputDecoration(labelText: 'Division'),
                //   onChanged: (value) {
                //     division = value;
                //   },
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'City'),
                  onChanged: (value) {
                    city = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Location";
                    }
                    return null;
                  },
                ),

                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Location details'),
                  onChanged: (value) {
                    locationDetails = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Location";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Choose Division'),
                  items: [
                    'Chattagram',
                    'Rajshahi',
                    'Khulna',
                    'Barisal',
                    'Sylhet',
                    'Dhaka',
                    'Rangpur',
                    'Mymensingh'
                  ].map((String division) {
                    return DropdownMenuItem<String>(
                      value: division,
                      child: Text(division),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    division = value!;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Submit'),
            onPressed: () {
              // Handle form submission
              if (_formKey.currentState!.validate()) {
                bloc.add(CreatePostEvent(
                    foodPostModel: FoodPostModel(
                  foodName: foodName,
                  division: division,
                  image: image,
                  city: city,
                  description: description,
                  donnerName: donnerName,
                  donnerPhoneNumber: donnerPhoneNumber,
                  placeName: placeName,
                  quantity: quantity,
                  locationDetails: locationDetails,
                )));
              }
            },
          ),
        ],
      );
    },
  );
}

class ImageWidget extends StatefulWidget {
  final Function(XFile xFile) onSelectedImage;

  const ImageWidget({
    required this.onSelectedImage,
    super.key,
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  final picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        image = await picker.pickImage(source: ImageSource.gallery);

        widget.onSelectedImage(image!);
        setState(() {});
      },
      child: Container(
        height: 150,
        width: 150,
        color: Colors.black45,
        child: image != null
            ? Image.network(
                image!.path,
                fit: BoxFit.cover,
              )
            : const Icon(
                Icons.image,
                size: 45,
              ),
      ),
    );
  }
}
