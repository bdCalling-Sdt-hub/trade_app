import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class GeneralController extends GetxController implements GetxService {
  RxBool isEnglish = true.obs;

  // List<String> languages = [
  //   AppStrings.english,
  //   AppStrings.arabic,
  // ];

  /// ========================= Picked Date =======================

  RxString pickedDate = "".obs;

  Future<String> pickDate(BuildContext context) async {
    // Show Date Picker
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      // Format the date to "25 Aug 2024"
      String formattedDate = DateFormat('d MMM y').format(date);

      // debugPrint("Picked Date ----->>>>>> $pickedDate");
      return pickedDate.value = formattedDate;
    }

    return "";
  }

  RxString pickedTime = "".obs;
  /// ========================= Picked Tine =======================
  Future<String> pickTime(BuildContext context) async {
    // Show Time Picker
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      // Convert to 12-hour format
      final hours = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
      final minutes = time.minute.toString().padLeft(2, '0');
      final period = time.period == DayPeriod.am ? "AM" : "PM";

      String formattedTime = "$hours:$minutes $period";

      // Update the observable variable with the formatted time
      return pickedTime.value = formattedTime;
    }

    // Return an empty string if no time is selected
    return "";
  }

  /// =========================== Pop Up Loader ===========================
  showPopUpLoader({required BuildContext context}) {
    return showDialog(
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 70,
            child: AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: Lottie.asset('assets/lottie/screenLoadingAni.json',height: 100.h,width: 100.w,fit: BoxFit.contain),
            ),
          );
        });
  }

  ///========================== Pick Image ========================
  Rx<File> imageFile = File("").obs;
  RxString imagePath = "".obs;
  Future<String> selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    refresh();
    if (getImages != null) {
      imageFile.value = File(getImages.path);
      imagePath.value = getImages.path;

      return imagePath.value;
    }

    return "";
  }
  String? _savedVideoUrl;
  YoutubePlayerController? youtubeController;
  bool isPlaying = true;

  void togglePlayPause() {
    if (youtubeController != null) {
      if (isPlaying) {
        youtubeController?.pause();
      } else {
        youtubeController?.play();
      }
      isPlaying =! isPlaying;
      update();
    }else{
      print("object");
    }
  }
  // Load the saved URL from SharedPreferences
  Future<void> loadSavedUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _savedVideoUrl = prefs.getString('youtube_url');
    if (_savedVideoUrl != null) {
      _initializePlayer(_savedVideoUrl!);
    }
  }


  // Initialize the YouTube player for audio playback
  void _initializePlayer(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    if (videoId != null) {
      // _youtubeController?.dispose(); // Dispose the previous controller if any
      youtubeController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          hideThumbnail: true, // Hide thumbnail to avoid showing visuals
          controlsVisibleAtStart: false, // Hide video controls
          disableDragSeek: true, // Disable seeking
          loop: true, // Enable looping video
          showLiveFullscreenButton: false, // Disable fullscreen button
          enableCaption: false, // Disable captions
        ),
      );
      isPlaying =false;
      update();
    }
  }

  late final AudioPlayer _player;

  // @override
  // Future<void> onStart(Map<String, dynamic>? params) async {
  //   _player = AudioPlayer();
  //   await _player.setUrl('https://www.youtube.com/watch?v=dQw4w9WgXcQ'); // Replace with YouTube audio URL or stream URL
  //   _player.play();
  //   _player.positionStream.listen((position) {
  //     playbackState.add(playbackState.value.copyWith(
  //       position: position,
  //       bufferedPosition: _player.bufferedPosition,
  //       playing: _player.playing,
  //     ));
  //   });
  // }

  @override
  void onInit() {
     loadSavedUrl();
    super.onInit();
  }
}
