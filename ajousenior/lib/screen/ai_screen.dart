import 'package:ajousenior/models/chat_model.dart';
import 'package:ajousenior/services/gpt_service.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  SpeechToText speechToText = SpeechToText();
  var text = "버튼을 누르면서 말해주세요";
  var isListening = false;

  final List<ChatMessage> messages = [];

  var scrollController = ScrollController();

  scrollMethod() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: isListening,
        duration: const Duration(milliseconds: 2000),
        glowColor: Theme.of(context).colorScheme.secondaryContainer,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListening) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  speechToText.listen(
                    onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                      });
                    },
                  );
                });
              }
            }
          },
          onTapUp: (details) async {
            setState(() {
              isListening = false;
            });
            speechToText.stop();

            messages.add(ChatMessage(text: text, type: ChatMessageType.user));
            var msg = await GptService.sendMessage(text);

            setState(() {
              messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
            });
          },
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            radius: 35,
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        leading: const Icon(
          Icons.sort_rounded,
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Voice Assistant',
          style: GoogleFonts.notoSansKannada(
            fontSize: 40,
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.secondaryContainer,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Text(
              text,
              style: GoogleFonts.notoSansKannada(
                fontSize: 30,
                color: isListening ? Colors.black : Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      var chat = messages[index];

                      return chatBubble(chattext: chat.text, type: chat.type);
                    }),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Developed by babadevs",
              style: GoogleFonts.notoSansKannada(
                fontSize: 30,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              )),
            ),
          ],
        ),
      ),
    );
  }
}

Widget chatBubble({required chattext, required ChatMessageType? type}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        backgroundColor: Colors.amber.shade50,
        child: const Icon(
          Icons.person,
          color: Color.fromARGB(255, 145, 91, 10),
        ),
      ),
      const SizedBox(
        width: 12,
      ),
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(
            color: Color.fromARGB(75, 155, 95, 18),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12)),
          ),
          child: Text(
            "$chattext",
            style: GoogleFonts.notoSansKannada(
              fontSize: 15,
              color: const Color.fromARGB(172, 0, 0, 0),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ],
  );
}
