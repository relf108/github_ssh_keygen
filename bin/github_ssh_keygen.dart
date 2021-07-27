#! /usr/bin/env dcli

import 'dart:io';
import 'package:dcli/dcli.dart';

void main(List<String> arguments) {
  var HOME = Platform.environment['HOME'];
  var email = ask(green('Enter your github email: \n'));
  'ssh-keygen -t ed25519 -C \"$email\" -f "$HOME/.ssh/id_ed25519"'.start();
  'ssh-agent -s'.start();
  'ssh-add ~/.ssh/id_ed25519'.start();
  print(green('SSH public key:\n'));
  File('$HOME/.ssh/id_ed25519.pub').readAsLines().then((value) => {
        value.forEach((element) {
          print('$element\n');
        })
      });
}
