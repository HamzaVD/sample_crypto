import 'package:crypton/crypton.dart';
import 'package:flutter/material.dart';
import 'package:sample_crypto/widgets/action_button.dart';
import 'package:sample_crypto/widgets/disabled_message_field.dart';
import 'package:sample_crypto/widgets/header_text.dart';
import 'package:sample_crypto/widgets/message_field.dart';

class RSADemo extends StatefulWidget {
  RSADemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RSADemoState createState() => _RSADemoState();
}

class _RSADemoState extends State<RSADemo> {
  RSAKeypair clientRsaKeypair, serverRsaKeypair;

  final _clientReceiveController = TextEditingController();
  final _clientSendController = TextEditingController();
  final _serverReceiveController = TextEditingController();
  final _serverSendController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _clientReceiveController.dispose();
    _serverSendController.dispose();
    _serverReceiveController.dispose();
    _clientSendController.dispose();
  }

  @override
  void initState() {
    super.initState();
    clientRsaKeypair = RSAKeypair.fromRandom(keySize: 2048);
    serverRsaKeypair = RSAKeypair.fromRandom(keySize: 2048);
  }

  void sendMessage(TextEditingController _sender,
      TextEditingController _receiver, RSAKeypair _keypair) {
    if (_sender.text.isNotEmpty) {
      try {
        _receiver.text = RSAPublicKey.fromString(_keypair.publicKey.toString())
            .encrypt(_sender.text);
      } catch (error) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
  }

  void decryptMessage(TextEditingController _receiver, RSAKeypair _keypair) {
    if (_receiver.text.isNotEmpty) {
      try {
        _receiver.text =
            RSAPrivateKey.fromString(_keypair.privateKey.toString())
                .decrypt(_receiver.text);
      } catch (error) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeaderText('Client'),
                MessageField(
                  text: 'Write message',
                  textEditingController: _clientSendController,
                ),
                ActionButton(
                  function: () => sendMessage(_clientSendController,
                      _serverReceiveController, serverRsaKeypair),
                  text: 'Send message',
                ),
                DisabledMessageField(
                  text: 'Text',
                  textEditingController: _clientReceiveController,
                ),
                ActionButton(
                  function: () => decryptMessage(
                      _clientReceiveController, clientRsaKeypair),
                  text: 'Decrypt',
                ),
                SizedBox(
                  height: 20,
                ),
                HeaderText('Server'),
                MessageField(
                  text: 'Write message',
                  textEditingController: _serverSendController,
                ),
                ActionButton(
                  function: () => sendMessage(_serverSendController,
                      _clientReceiveController, clientRsaKeypair),
                  text: 'Send message',
                ),
                DisabledMessageField(
                  text: 'Text',
                  textEditingController: _serverReceiveController,
                ),
                ActionButton(
                  function: () => decryptMessage(
                      _serverReceiveController, serverRsaKeypair),
                  text: 'Decrypt',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
