import 'package:contacts_app_server/server.dart' as server;
import 'package:contacts_app_server/courseserver.dart' as c_server;
import 'package:contacts_app_server/internserver.dart' as i_server;
import 'package:contacts_app_server/wsserver.dart' as ws_server;

void main(List<String> arguments) {
  server.start();
  // c_server.start();
  // i_server.start();
  // ws_server.start();
}
