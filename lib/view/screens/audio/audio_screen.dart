import 'package:audio_service/audio_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_app/global/general_controller/general_controller.dart';
import 'package:trade_app/utils/ToastMsg/toast_message.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../components/custom_text_field/custom_text_field.dart';

/*class AudioScreen extends StatefulWidget {
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

  final GeneralController generalController = Get.find<GeneralController>();

  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _audioPlayer = AudioPlayer();
      _loadSavedAudioPath(); // Load saved audio path from SharedPreferences
    });
  }

  String? _savedVideoUrl;

  late AudioPlayer _audioPlayer;
  bool _isInitialized = false;
  var isPlaying = false;
  var currentPosition = Duration.zero;
  var totalDuration = Duration.zero;
  Duration bufferedPosition = Duration.zero;
  String? selectedFilePath;
  String? selectedFileName;



  Future<void> _loadSavedAudioPath() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFilePath = prefs.getString('audioFilePath');

    if (savedFilePath != null) {
      selectedFilePath = savedFilePath;
      selectedFileName = savedFilePath.split('/').last;
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
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  Future<void> _saveUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('youtube_url', _urlController.text);
    setState(() {
      _savedVideoUrl = _urlController.text;
      _urlController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        appBarContent: 'YouTube Player',
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
        child: CustomButton(
          onTap: () {
            if (_urlController.text.isNotEmpty) {
              _saveUrl();
              toastMessage(message: 'Video Added Successfully');
            }
          },
          title: 'Save',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if (selectedFileName != null)
              Text(
                'Selected File: $selectedFileName',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 8.h,),
            SizedBox(
              width: double.infinity, // Full-width button
              child: ElevatedButton(
                onPressed: _pickAudioFile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Transparent background
                  foregroundColor: Colors.black, // Text color (matches border color)
                  side: const BorderSide(color: Colors.black, width: 1), // Border color and width
                  padding: const EdgeInsets.symmetric(vertical: 12), // Vertical padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  elevation: 0, // Remove shadow
                ),
                child: const Text(
                  'Add Audio',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),


            // Text(
            //   'Current Position: ${_formatDuration(currentPosition)} / ${_formatDuration(totalDuration)}',
            // ),
             SizedBox(height: 8.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isInitialized ? () async => await _audioPlayer.play() : null,
                  child: const Text('Play',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Transparent background
                    padding: const EdgeInsets.symmetric(vertical: 2), // Vertical padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    elevation: 0, // Remove shadow
                  ),
                ),
                SizedBox(width: 8.w,),
                ElevatedButton(
                  onPressed: _isInitialized ? () async => await _audioPlayer.pause() : null,
                  child: const Text('Pause',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Transparent background
                    padding: const EdgeInsets.symmetric(vertical: 2), // Vertical padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    elevation: 0, // Remove shadow
                  ),
                ),
              ],
            ),





            SizedBox(height: 24.h,),





            CustomText(
              text: 'Upload YouTube Link',
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              textEditingController: _urlController,
              hintText: 'Enter youtube video url',
            ),
            SizedBox(
              height: 24.h,
            ),
            generalController.youtubeController != null
                ? SizedBox(
              height: 0,
              child: YoutubePlayer(
                controller: generalController.youtubeController!,
                showVideoProgressIndicator: false,

                bottomActions: [], // Hide all bottom actions
              ),
            )
                : Center(
                child:
                SizedBox())
          ],
        ),
      ),
    );
  }
}
