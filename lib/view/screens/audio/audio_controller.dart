import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:trade_app/service/api_service.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_const/app_const.dart';

// class AudioController extends GetxController{
//   final audioPlayer = AudioPlayer();
//
//   // Observables
//   var isPlaying = false.obs;
//   var currentPosition = Duration.zero.obs;
//   var totalDuration = Duration.zero.obs;
//   Rx<Duration> bufferedPosition = Duration.zero.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     audioPlayer.processingStateStream.listen((state) {
//       if (state == ProcessingState.completed) {
//        // playNext();
//       }
//     });
//
//     audioPlayer.playerStateStream.listen((state) {
//       isPlaying.value = state.playing;
//     });
//
//     audioPlayer.bufferedPositionStream.listen((buffered) {
//       bufferedPosition.value = buffered;
//     });
//
//     audioPlayer.positionStream.listen((pos) {
//       currentPosition.value = pos;
//     });
//
//     audioPlayer.durationStream.listen((dur) {
//       if (dur != null) totalDuration.value = dur;
//     });
//   }
// }

