import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:diabets/view/pages/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mime/mime.dart'; // Untuk menentukan jenis konten file

// Pastikan ResultPage didefinisikan dengan benar, berikut hanya contoh

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraPage({super.key, required this.cameras});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  FlashMode _currentFlashMode = FlashMode.off;

  bool _isLoading = false; // Variabel untuk melacak status loading

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.cameras[0], ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid; // Mengambil userId (uid) pengguna yang sedang login
    } else {
      return null;  // Jika pengguna tidak login
    }
  }

  Future<void> _pickImageFromGallery() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final Uint8List imageBytes = await pickedFile.readAsBytes();
        await _uploadPhoto(imageBytes, pickedFile.name);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No image selected.")),
        );
      }
    } catch (e) {
      print("Error selecting or uploading photo: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to select or upload photo.")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _captureAndUploadPhoto() async {
    try {
      await _initializeControllerFuture;

      setState(() {
        _isLoading = true;
      });

      final XFile photo = await _controller.takePicture();
      final Uint8List imageBytes = await File(photo.path).readAsBytes();

      await _uploadPhoto(imageBytes, photo.name);
    } catch (e) {
      print('Error capturing or uploading photo: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _uploadPhoto(Uint8List imageBytes, String fileName) async {
    final userId = getCurrentUserId(); // Dapatkan userId

    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No user is logged in.")),
      );
      return;
    }

    final url = Uri.parse("http://10.1.76.165:3000/detect");

    try {
      final request = http.MultipartRequest("POST", url)
        ..fields["userId"] = userId  // Kirim userId sebagai parameter
        ..files.add(
          http.MultipartFile.fromBytes(
            "photo",
            imageBytes,
            filename: fileName,
            contentType: MediaType("image", "jpeg"),  // Tentukan jenis konten file
          ),
        );

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        print("Response: $responseData");

        final parsedData = jsonDecode(responseData);

        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(resultData: parsedData, userId: userId,),
            ),
          );
        }
      } else {
        print("Failed to upload photo: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to upload photo. Please try again.")),
        );
      }
    } catch (e) {
      print("Error during upload: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred during upload.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return WillPopScope(
                  onWillPop: () async {
                    Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                    return false;
                  },
                  child: Stack(
                    children: [
                      CameraPreview(_controller),
                      Positioned(
                        top: 40,
                        left: 20,
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                          },
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: 20,
                        child: IconButton(
                          icon: Icon(
                            _currentFlashMode == FlashMode.off
                                ? Icons.flash_off
                                : Icons.flash_on,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            try {
                              FlashMode newFlashMode =
                              _currentFlashMode == FlashMode.off ? FlashMode.torch : FlashMode.off;
                              await _controller.setFlashMode(newFlashMode);
                              setState(() {
                                _currentFlashMode = newFlashMode;
                              });
                            } catch (e) {
                              print("Error setting flash mode: $e");
                            }
                          },
                        ),
                      ),
                      Positioned(
                        bottom: -20,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.photo, color: Colors.black),
                                onPressed: _pickImageFromGallery,
                              ),
                              SizedBox(width: 40),
                              IconButton(
                                icon: Icon(Icons.circle, size: 70, color: Colors.green),
                                onPressed: _captureAndUploadPhoto,
                              ),
                              SizedBox(width: 40),
                              IconButton(
                                icon: Icon(Icons.refresh, color: Colors.black),
                                onPressed: () {
                                  // Implement refresh if needed
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
