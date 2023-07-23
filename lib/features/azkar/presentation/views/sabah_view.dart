import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/app_widgets/custom_arrow_back.dart';
import 'package:muslim_app_2/core/app_widgets/custom_container.dart';
import 'package:muslim_app_2/core/data/data.dart';
import 'package:muslim_app_2/core/utils/styles.dart';
import 'package:muslim_app_2/features/azkar/presentation/views/widgets/azkar_card.dart';
import 'package:muslim_app_2/features/home/presentation/view_models/providers/api_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class SabahView extends StatefulWidget {
  final String name;

  const SabahView({super.key, required this.name});

  @override
  State<SabahView> createState() => _SabahViewState();
}

class _SabahViewState extends State<SabahView> {
  bool isPlaying = false;

  void toggleAudioState() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  final player = AudioPlayer();

  Future<void> playAudio({required String url}) async {
    await player.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<ApiProvider>(context);
    return Scaffold(
      body: FutureBuilder(
        future: api.getAzkarData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List? list = snapshot.data!['أذكار الصباح والمساء'];
            return CustomContainer(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomArrowBack(),
                  AzkarCard(
                    name: widget.name,
                    fun: null,
                    color: const Color.fromARGB(255, 67, 67, 67),
                    textColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      child: ListView.builder(
                    itemCount: list?.length,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  // ignore: avoid_dynamic_calls
                                  '${list?[index]['ARABIC_TEXT']}',
                                  textDirection: TextDirection.rtl,
                                  style: Styles.textStyle20Ar,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(
                                      flex: 2,
                                    ),
                                    CircleAvatar(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.black87,
                                      child: IconButton(
                                          onPressed: () {
                                            Share.share(
                                                // ignore: avoid_dynamic_calls
                                                '${list?[index]['ARABIC_TEXT']}');
                                          },
                                          icon: const Icon(Icons.share)),
                                    ),
                                    const Spacer(),
                                    CircleAvatar(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.black87,
                                      child: IconButton(
                                          onPressed: () {
                                            toggleAudioState();
                                            isPlaying
                                                ? playAudio(
                                                    url: azkarAudioUrls[index])
                                                : player.stop();
                                          },
                                          icon: Icon(isPlaying
                                              ? Icons.stop
                                              : Icons.play_arrow)),
                                    ),
                                    const Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ))
                ],
              ),
            ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
