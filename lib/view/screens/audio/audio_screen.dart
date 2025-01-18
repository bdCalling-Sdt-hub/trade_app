import 'package:audio_service/audio_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


import '../../components/custom_text_field/custom_text_field.dart';
/*
class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late AudioPlayer _audioPlayer;
  bool _isInitialized = false;
  var isPlaying = false;
  var currentPosition = Duration.zero;
  var totalDuration = Duration.zero;
  Duration bufferedPosition = Duration.zero;
  String? selectedFilePath;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSavedAudioPath(); // Load saved audio path from SharedPreferences
    });
  }

  Future<void> _loadSavedAudioPath() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFilePath = prefs.getString('audioFilePath');

    if (savedFilePath != null) {
      selectedFilePath = savedFilePath;
      await _initializeAudio(); // Initialize audio with the saved file path
    }
  }

  Future<void> _saveAudioPath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('audioFilePath', path);
  }

  Future<void> _initializeAudio() async {
    if (selectedFilePath == null) return;

    try {
      // Configure the audio session for background playback
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.music());

      // Define the audio source with MediaItem for background playback
      final audioSource = AudioSource.file(
        selectedFilePath!,
        tag: MediaItem(
          id: '1',
          album: 'Sample Album',
          title: 'Sample Song',
          artUri: Uri.parse('https://example.com/sample.jpg'), // Artwork URI
        ),
      );

      // Set the audio source
      await _audioPlayer.setAudioSource(audioSource);

      setState(() {
        _isInitialized = true;
      });

      // Listen for processing state changes to restart on completion
      _audioPlayer.processingStateStream.listen((state) {
        if (state == ProcessingState.completed) {
          // Restart the audio playback
          _audioPlayer.seek(Duration.zero); // Reset to the beginning
          _audioPlayer.play();
          setState(() {});
        }
      });

      // Listen to player state
      _audioPlayer.playerStateStream.listen((state) {
        isPlaying = state.playing;
        setState(() {});
      });

      // Listen to position and duration updates
      _audioPlayer.positionStream.listen((pos) {
        currentPosition = pos;
        setState(() {});
      });

      _audioPlayer.durationStream.listen((dur) {
        if (dur != null) totalDuration = dur;
        setState(() {});
      });
    } catch (e) {
      print('Error initializing audio: $e');
    }
  }

  Future<void> _pickAudioFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
      );

      if (result != null && result.files.single.path != null) {
        String filePath = result.files.single.path!;
        print('Selected File Path: $filePath');

        selectedFilePath = filePath;

        await _initializeAudio();

        // Save the selected file path to SharedPreferences
        await _saveAudioPath(filePath);

        setState(() {
          selectedFilePath = filePath;
        });
      } else {
        // User canceled the picker
        print('No file selected');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        appBarContent: 'Audio',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Now Playing: ${selectedFilePath != null ? 'Sample Song' : 'No Audio Selected'}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickAudioFile,
              child: const Text('Add Audio'),
            ),
            Text(
              'Current Position: ${_formatDuration(currentPosition)} / ${_formatDuration(totalDuration)}',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isInitialized ? () async => await _audioPlayer.play() : null,
              child: const Text('Play'),
            ),
            ElevatedButton(
              onPressed: _isInitialized ? () async => await _audioPlayer.pause() : null,
              child: const Text('Pause'),
            ),
            ElevatedButton(
              onPressed: _isInitialized ? () async => await _audioPlayer.stop() : null,
              child: const Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$minutes:$seconds';
  }
}*/

class YouTubeVideoApp extends StatefulWidget {
  @override
  _YouTubeVideoAppState createState() => _YouTubeVideoAppState();
}

class _YouTubeVideoAppState extends State<YouTubeVideoApp> {
  final TextEditingController _urlController = TextEditingController();
  String? _savedVideoUrl;
  YoutubePlayerController? _youtubeController;

  @override
  void initState() {
    super.initState();
    _loadSavedUrl();
  }

  // Load the saved URL from SharedPreferences
  Future<void> _loadSavedUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedVideoUrl = prefs.getString('youtube_url');
      if (_savedVideoUrl != null) {
        _initializePlayer(_savedVideoUrl!);
      }
    });
  }

  // Save the URL to SharedPreferences
  Future<void> _saveUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('youtube_url', _urlController.text);
    setState(() {
      _savedVideoUrl = _urlController.text;
    });
  }

  // Initialize the YouTube player for audio playback
  void _initializePlayer(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    if (videoId != null) {
     // _youtubeController?.dispose(); // Dispose the previous controller if any
      _youtubeController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          hideThumbnail: true, // Hide thumbnail to avoid showing visuals
          controlsVisibleAtStart: false, // Hide video controls
          disableDragSeek: true, // Disable seeking
          loop: true, // Enable looping video
          showLiveFullscreenButton: false, // Disable fullscreen button
          enableCaption: false, // Disable captions
        ),
      );
      setState(() {}); // Update the state to reflect the new controller
    }
  }

  // @override
  // void dispose() {
  //   _youtubeController?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        appBarContent: 'YouTube Player',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            SizedBox(height: 24.h,),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    textEditingController: _urlController,
                    hintText: 'Enter youtube video url',
                  ),
                ),
                SizedBox(width: 10),


                ElevatedButton(
                  onPressed: () {
                    if (_urlController.text.isNotEmpty) {
                      _saveUrl();
                    }
                  },
                  child: Text("Save"),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                if (_savedVideoUrl != null) {
                  _initializePlayer(_savedVideoUrl!);
                } else if (_urlController.text.isNotEmpty) {
                  _initializePlayer(_urlController.text);
                }
                print(_savedVideoUrl);
                print(_urlController.text);
              },
              child: Text("Load and Play Audio"),
            ),

          SizedBox(height: 24.h,),

            if (_savedVideoUrl != null && _youtubeController != null)
              Expanded(
                child: Column(

                  children: [
                    YoutubePlayer(
                      controller: _youtubeController!,
                      showVideoProgressIndicator: false,
                      bottomActions: [], // Hide all bottom actions
                    ),
                    SizedBox(height: 20),
                    // Play and Pause Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_youtubeController != null) {
                              _youtubeController!.play(); // Play the video
                            }
                          },
                          child: Text("Play"),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (_youtubeController != null) {
                              _youtubeController!.pause(); // Pause the video
                            }
                          },
                          child: Text("Pause"),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            else
              Expanded(
                child: Center(
                  child: Text("No audio selected. Please enter a URL."),
                ),
              ),
          ],
        ),
      ),
    );
  }
}





