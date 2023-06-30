import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Main_Appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final mController = Get.put(MainController());
  int _selectedValue = 0;
  TextEditingController controller = TextEditingController();

  bool isSuccess = false;
  String result = "";
  String resultType = "";
  int tab = 0;

  @override
  initState() {
    getData();
    super.initState();
  }

  getData() async {
    print("Checking: " + await NfcManager.instance.isAvailable().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
        currentIndex: tab,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'Write',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Read',
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffebf2fa),
            Color(0xfff4f9fd),
            Color(0xfff4f9fd),
          ],
        )),
        padding: EdgeInsets.all(40),
        child: FutureBuilder<bool>(
          future: NfcManager.instance.isAvailable(),
          builder: (context, ss) => ss.data != true
              ? Center(
                  child: Text(
                  "NFC is not supported on this device :(",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ))
              : SingleChildScrollView(
                  child: tab == 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  child: Radio(
                                    value: 0,
                                    activeColor: Colors.black,
                                    groupValue: _selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedValue = 0;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'Text',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  child: Radio(
                                    value: 1,
                                    activeColor: Colors.black,
                                    groupValue: _selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedValue = 1;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'Link',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Material(
                                elevation: 2,
                                color: Color(0xfff4f9fd),
                                child: TextField(
                                  controller: controller,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 18), hintText: 'Data...', hintStyle: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ),
                            _button(
                              "Write",
                              () => _ndefWrite(),
                            ),
                            if (isSuccess)
                              Container(
                                height: 35,
                                margin: EdgeInsets.only(top: 12),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Colors.green.shade700, Colors.green.shade500],
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                ),
                                child: Center(child: Text("Write successful!", style: TextStyle(color: Colors.white))),
                              ),
                          ],
                        )
                      : Column(
                          children: [
                            _button(
                              "Read",
                              () => _tagRead(),
                            ),
                            if (result != "")
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Material(
                                  elevation: 3,
                                  child: InkWell(
                                    onTap: () async {
                                      if (resultType == "url"){
                                         await launchUrl(Uri.parse("https://www."+result));
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [Colors.green.shade700, Colors.green.shade500],
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(6)),
                                      ),
                                      padding: EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            result,
                                            textAlign: TextAlign.center,

                                            style: TextStyle(color: Colors.white, fontSize: 15),
                                          ),

                                          if (resultType == "url")
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 5),
                                            child: Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.white,),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                ),
        ),
      ),
    );
  }

  void _tagRead() {
    setState(() {
      isSuccess = false;
      result = "";
    });

    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      print(tag.data);
      // print(tag.data["ndef"]["cachedMessage"]["records"][0]["payload"]);

      // List<dynamic> payload = data['ndef']['cachedMessage']['records'][0]['payload'];
      // String payloadString = utf8.decode(payload);
      // print('Payload: $payloadString');

      // String payloadText = String.fromCharCodes(tag.data['ndef']['cachedMessage']['records'][0]['payload']);

      // String url = Uri.decodeFull(String.fromCharCodes(tag.data['ndef']['cachedMessage']['records'][0]['payload']));
      // print(url);

      var type = tag.data['ndef']['cachedMessage']['records'][0]["type"][0];
      print("UGH");
      print(type);

      String payload = String.fromCharCodes(tag.data['ndef']['cachedMessage']['records'][0]['payload']);
      String url = Uri.decodeFull(payload);
      url = url.substring(type == 84
          ? 3
          : type == 85
              ? 1
              : 0);
      print(url);

      setState(() {
        result = url;
        resultType = type == 84 ? "text" : type == 85 ? "url" : "";
      });

      NfcManager.instance.stopSession();
    });
  }

  void _ndefWrite() {
    setState(() {
      isSuccess = false;
      result = "";
    });
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result = 'Tag is not writable';
        NfcManager.instance.stopSession(errorMessage: result);
        return;
      }

      late NdefMessage message;

      if (_selectedValue == 0) {
        message = NdefMessage([
          NdefRecord.createText(controller.text),
          // NdefRecord.createUri(Uri.parse('https://www.onepercent.club')),
          // NdefRecord.createMime('text/plain', Uint8List.fromList('Hello'.codeUnits)),
          // NdefRecord.createExternal('com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
        ]);
      } else {
        message = NdefMessage([
          // NdefRecord.createText('Hello World!'),
          NdefRecord.createUri(Uri.parse(controller.text)),
          // NdefRecord.createMime('text/plain', Uint8List.fromList('Hello'.codeUnits)),
          // NdefRecord.createExternal('com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
        ]);
      }

      try {
        await ndef.write(message);
        // print("MESSAGE");
        // print(message.records.first.payload);
        // print(message.records.first.identifier);
        // print(message.records.first.type);
        // print(message.records.first.typeNameFormat);
        // print(message.records.first.byteLength);
        NfcManager.instance.stopSession();
        setState(() {
          isSuccess = true;
        });
      } catch (e) {
        result = e.toString();
        NfcManager.instance.stopSession(errorMessage: result.toString());
        return;
      }
    });
  }

  Widget _button(String text, onClick) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff111214), Color(0xff23272b).withOpacity(0.9)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          primary: Colors.transparent,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: onClick,
        child: Text(text, style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
