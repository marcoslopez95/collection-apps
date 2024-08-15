import 'dart:async';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/main.dart';
import 'package:access_maketicket/workingApps/chatGPT/utils/constant.dart';
import 'package:access_maketicket/workingApps/chatGPTMailGeneration/components/common_app_icon_button.dart';
import 'package:access_maketicket/workingApps/chatGPTMailGeneration/models/email_generate_model.dart';
import 'package:access_maketicket/workingApps/chatGPTMailGeneration/utils/images.dart';
import 'package:share_plus/share_plus.dart';

import '../../../main/utils/AppColors.dart';

class GeneratedEmailScreen extends StatefulWidget {
  final String question;

  GeneratedEmailScreen({required this.question});

  @override
  _GeneratedEmailScreenState createState() => _GeneratedEmailScreenState();
}

class _GeneratedEmailScreenState extends State<GeneratedEmailScreen> {
  ChatGpt chatGpt = ChatGpt(apiKey: getStringAsync(CHAT_GPT_API_KEY));

  ///
  ScrollController scrollController = ScrollController();
  final List<EmailGenerateModel> questionAnswers = [];
  StreamSubscription<StreamCompletionResponse>? streamSubscription;

  String answer = '';

  bool isLoading = false;
  bool isLoseConnection = false;
  bool isScroll = false;

  int selectedChatGPTModel = 0;

  @override
  void initState() {
    super.initState();
    afterBuildCreated(() {
      setStatusBarColor(appStore.isDarkModeOn ? context.scaffoldBackgroundColor : appColorPrimaryLight, statusBarIconBrightness: Brightness.dark);
    });

    init();
  }

  void init() async {
    questionAnswers.clear();
    sendMessage();
  }

  void sendMessage() async {
    isLoading = true;
    questionAnswers.insert(0, EmailGenerateModel(question: widget.question, answer: StringBuffer()));
    ChatCompletionRequest testRequest = ChatCompletionRequest(
      stream: true,
      maxTokens: 4000,
      messages: [Message(role: Role.user.name, content: widget.question)],
      model: selectedChatGPTModel == 0 ? ChatGptModel.gpt35Turbo.modelName : ChatGptModel.gpt4.modelName,
    );

    await _chatStreamResponse(testRequest);

    isLoading = false;
    setState(() {});
  }

  Future<dynamic> _chatStreamResponse(ChatCompletionRequest request) async {
    streamSubscription?.cancel();

    try {
      log('ChatGPT Api Key==== ${chatGpt.apiKey}');
      final stream = await chatGpt.createChatCompletionStream(request);
      log("request ${request.messages.map((e) => "${e.role} : : ${e.content}")}");

      streamSubscription = stream?.listen((event) async {
        isLoseConnection = false;
        setState(() {
          if (event.streamMessageEnd) {
            streamSubscription?.cancel();
            isScroll = true;
          } else {
            isScroll = false;
            questionAnswers.first.answer!.write(event.choices?.first.delta?.content);
          }
        });
      })
        ?..onError((error) {
          if (error.toString().contains('Connection closed')) {
            isLoseConnection = true;
          }
          setState(() {});
          log('Error occurred: $error');
        });
    } catch (error) {
      if (error.toString().contains('SocketException')) {
        isLoseConnection = true;
      } else {
        questionAnswers.first.answer!.write("Too many requests please try again");
      }
      setState(() {});
      log("Error occurred: $error");
    }
  }

  void shareMail(BuildContext context, {String? result, RenderBox? box}) {
    Share.share(result.validate(), sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : appColorPrimaryLight);
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        '',
        elevation: 0,
        color: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : appColorPrimaryLight,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              hideKeyboard(context);
              if (selectedChatGPTModel != value) {
                selectedChatGPTModel = value;
                setState(() {});
              }
            },
            icon: Icon(Icons.more_vert, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 0,
                  child: SettingItemWidget(
                    title: 'GPT-3.5',
                    titleTextStyle: primaryTextStyle(color: selectedChatGPTModel == 0 ? appColorPrimary : null),
                    subTitle: 'Fastest',
                    subTitleTextStyle: secondaryTextStyle(color: selectedChatGPTModel == 0 ? appColorPrimary : null),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    leading: Image.asset(
                      ic_gpt3turboModel,
                      height: 20,
                      width: 20,
                      color: selectedChatGPTModel == 0
                          ? appColorPrimary
                          : appStore.isDarkModeOn
                              ? Colors.white
                              : Colors.black,
                    ),
                    trailing: Icon(Icons.check, size: 18, color: appColorPrimary).visible(selectedChatGPTModel == 0),
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: SettingItemWidget(
                    title: 'GPT-4',
                    titleTextStyle: primaryTextStyle(color: selectedChatGPTModel == 1 ? appColorPrimary : null),
                    subTitle: 'Smart and fast',
                    subTitleTextStyle: secondaryTextStyle(color: selectedChatGPTModel == 1 ? appColorPrimary : null),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    leading: Image.asset(
                      ic_gpt4Model,
                      height: 22,
                      width: 22,
                      color: selectedChatGPTModel == 1
                          ? appColorPrimary
                          : appStore.isDarkModeOn
                              ? Colors.white
                              : Colors.black,
                    ),
                    trailing: Icon(Icons.check, size: 18, color: appColorPrimary).visible(selectedChatGPTModel == 1),
                  ),
                )
              ];
            },
          ),
        ],
      ),
      body: Container(
        height: context.height(),
        width: context.width(),
        color: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : appColorPrimaryLight,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Generated Email', style: boldTextStyle(size: 20)),
            20.height,
            Container(
              height: context.height(),
              width: context.width(),
              decoration: boxDecorationDefault(color: appStore.isDarkModeOn ? appSecondaryBackgroundColor : Colors.white, borderRadius: radius(defaultRadius)),
              child: Stack(
                children: [
                  if (isLoseConnection)
                    Text('No Internet Connection', style: primaryTextStyle(size: 15)).center()
                  else if (isLoading && questionAnswers.first.answer!.isEmpty)
                    SpinKitFadingCircle(color: appColorPrimary).center()
                  else if (questionAnswers.first.answer!.isNotEmpty && !isLoading)
                    ListView.builder(
                      padding: EdgeInsets.all(16),
                      controller: scrollController,
                      itemCount: questionAnswers.length,
                      itemBuilder: (_, index) {
                        EmailGenerateModel data = questionAnswers[index];

                        answer = data.answer.toString().trim();

                        if (isScroll) {
                          scrollController.animToBottom(milliseconds: 100);
                        }

                        return Text(answer, style: primaryTextStyle(size: 15));
                      },
                    ).paddingBottom(70),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonAppIconButton(
                          icon: ic_refresh,
                          text: 'Regenerate',
                          onPressed: () async {
                            init();
                            setState(() {});
                          },
                        ).expand(),
                        16.width,
                        isIOS
                            ? Builder(builder: (context) {
                                return CommonAppIconButton(
                                  icon: ic_share,
                                  text: 'Share',
                                  onPressed: () {
                                    final box = context.findRenderObject() as RenderBox?;
                                    shareMail(context, result: answer, box: box);
                                  },
                                ).expand();
                              })
                            : CommonAppIconButton(
                                icon: ic_share,
                                text: 'Share',
                                onPressed: () {
                                  final box = context.findRenderObject() as RenderBox?;
                                  shareMail(context, result: answer, box: box);
                                },
                              ).expand()
                      ],
                    ),
                  ),
                ],
              ),
            ).expand(),
          ],
        ),
      ),
    );
  }
}
