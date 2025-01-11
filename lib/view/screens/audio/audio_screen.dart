import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:audio_session/audio_session.dart';

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
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
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

  // @override
  // void dispose() {
  //   // Dispose the audio player when the widget is disposed
  //   _audioPlayer.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Now Playing: Sample Song'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                _pickAudioFile();
              },
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
}


