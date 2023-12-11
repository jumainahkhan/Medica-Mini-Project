import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medica/constants/routes.dart';
import 'package:medica/screens/add_manually/add_manually_screen.dart';
import 'package:medica/main.dart';

class ScanScreenBody extends StatefulWidget {
  const ScanScreenBody({super.key});

  @override
  State<ScanScreenBody> createState() => _ScanScreenBodyState();
}

class _ScanScreenBodyState extends State<ScanScreenBody> {
  late CameraController cameraController;
  bool flashOn = false;
  XFile? imageFile;
  @override
  void initState() {
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            debugPrint('User denied camera access.');
            break;
          default:
            debugPrint('Handle other errors.');
            break;
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double previewAspectRatio = 1.3;
    if (!cameraController.value.isInitialized) {
      return Container();
    }
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        topBar(),
        cameraPreview(previewAspectRatio),
        const Spacer(),
        cameraButtons(cameraController),
        const Spacer(),
      ],
    ));
  }

  Future<XFile?> takePicture(cameraController) async {
    if (cameraController == null || !cameraController.value.isInitialized) {
      debugPrint("1");
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      debugPrint("2");
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  cameraButtons(cameraController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 100,
        ),
        GestureDetector(
          onTap: () async {
            try {
              await takePicture(cameraController).then((XFile? file) {
                if (mounted) {
                  setState(() {
                    imageFile = file;
                  });
                  if (file != null) {
                    showInSnackBar('Picture saved to ${file.path}');
                    Navigator.pushNamed(context, Routes.addManually,
                        arguments: file.path);
                  }
                }
              });
            } catch (e) {
              debugPrint("Error: ${e.toString()}");
            }
          },
          child: Stack(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: HexColor('#6d69f0'), shape: BoxShape.circle),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        color: Colors.transparent,
                        shape: BoxShape.circle),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddManuallyScreen(),
                ));
          },
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              border: Border.all(color: HexColor('#6d69f0'), width: 2),
            ),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.upload,
                  color: HexColor('#6d69f0'),
                ),
                Text(
                  "Manually",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: HexColor('#6d69f0')),
                ),
              ],
            )),
          ),
        ),
      ],
    );
  }

  AspectRatio cameraPreview(double previewAspectRatio) {
    return AspectRatio(
      aspectRatio: 1 / previewAspectRatio,
      child: ClipRect(
        child: Transform.scale(
          scale: cameraController.value.aspectRatio / previewAspectRatio,
          child: Center(
            child: CameraPreview(cameraController),
          ),
        ),
      ),
    );
  }

  Row topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 60,
        ),
        Text(
          "Scan Prescription",
          style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: HexColor('#6d69f0')),
        ),
        SizedBox(
          width: 60,
          child: IconButton(
            onPressed: () {
              if (flashOn) {
                setState(() {
                  cameraController.setFlashMode(FlashMode.off);
                  flashOn = false;
                });
              } else {
                setState(() {
                  cameraController.setFlashMode(FlashMode.torch);
                  flashOn = true;
                });
              }
              setState(() {});
            },
            icon: Icon(
                flashOn ? Icons.flash_on_outlined : Icons.flash_off_outlined),
          ),
        ),
      ],
    );
  }
}
