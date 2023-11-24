import '../../WIDGETS/image_picker/image_picker_logic/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//to change class name = right click on className> Rename symbol
class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(flex: 2, child: _PickImageButton()),
            Flexible(flex: 2, child: _ImagePickerStates())
          ],
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _PickImageButton extends StatelessWidget {
  const _PickImageButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 27, 216, 191)),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  title: const Text('Select one option:'),
                  children: [
                    SimpleDialogOption(
                      child: const Text('Select from gallery'),
                      onPressed: () {
                        BlocProvider.of<ImagePickerBloc>(context)
                            .add(PickGallery_SingleImage_Event());
                        Navigator.pop(context);
                      },
                    ),
                    const Divider(),

                    //
                    SimpleDialogOption(
                      child: const Text('Capture with Camera'),
                      onPressed: () {
                        Navigator.pop(context);

                        BlocProvider.of<ImagePickerBloc>(context)
                            .add(CaptureCamera_singleImage_Event());
                      },
                    ),
                    const Divider(),

                    //
                    SimpleDialogOption(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
        child: const Text(
          "Pick Image",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

class _ImagePickerStates extends StatelessWidget {
  const _ImagePickerStates();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePickerBloc, ImagePickerState>(
      builder: (context, state) {
        if (state is SingleGalleryImage_noImagePicked_state) {
          return const _ImagePickerText(text: 'No image was picked');
        } else if (state is SingleGalleryImage_pickingError_state) {
          return const _ImagePickerText(text: 'Error : couldn\'t pick image');
        } else if (state is SingleGalleryImage_picked_state) {
          return Card(
            child: Image.file(state.pickedImage, width: 80, height: 80),
          );
        } else if (state is SingleCameraImage_noImagePicked_state) {
          return const _ImagePickerText(text: 'No image was captured');
        } else if (state is SingleCameraImage_pickingError_state) {
          return const _ImagePickerText(
              text: 'Error : couldn\'t capture image');
        } else if (state is SingleCameraImage_picked_state) {
          return Card(
            child: Image.file(state.capturedImage, width: 80, height: 80),
          );
        }
        return const _ImagePickerText(text: 'No image selected');
      },
    );
  }
}

class _ImagePickerText extends StatelessWidget {
  final String text;
  const _ImagePickerText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color.fromARGB(255, 167, 167, 167),
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        // fontWeight: FontWeight.bold,
        // fontWeight: FontWeight.w300,
        // fontSize: 20.0,
      ),
    );
  }
}
