import 'package:configurator/build_config.dart';
import 'package:configurator/models/each_key_config.dart';
import 'package:configurator/models/error_serial_device.dart';
import 'package:configurator/models/keycode.dart';
import 'package:configurator/models/key_config.dart';
import 'package:configurator/models/serial_device.dart';

class Globals {
  String currentLocale = 'kr';

  late KeyConfig keyConfig;
  late KeyConfig updatedKeyConfig;
  late String currentSerialDevicePort;
  late Map<String, SerialDevice> _serialDevices;

  bool get keyConfigUpdated {
    return !(keyConfig == updatedKeyConfig);
  }

  static Globals instance = Globals._privateConstructor();

  factory Globals() {
    return instance;
  }

  Globals._privateConstructor() {
    KeyConfig loaded = KeyConfig(
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false),
        EachKeyConfig(keycode: Keycode.undefined, enabled: false));
    // Load from Arduino
    keyConfig = BuildConfig.defaultKeyConfig;
    updatedKeyConfig = KeyConfig.clone(keyConfig);
    _serialDevices = Map<String, SerialDevice>();
    return;
    keyConfig = KeyConfig(
        loaded.esc.keycode != Keycode.undefined
            ? loaded.esc
            : BuildConfig.defaultKeyConfig.esc,
        loaded.enter.keycode != Keycode.undefined
            ? loaded.enter
            : BuildConfig.defaultKeyConfig.enter,
        loaded.tab.keycode != Keycode.undefined
            ? loaded.tab
            : BuildConfig.defaultKeyConfig.tab,
        loaded.space.keycode != Keycode.undefined
            ? loaded.space
            : BuildConfig.defaultKeyConfig.space,
        loaded.speedUp.keycode != Keycode.undefined
            ? loaded.speedUp
            : BuildConfig.defaultKeyConfig.speedUp,
        loaded.speedDown.keycode != Keycode.undefined
            ? loaded.speedDown
            : BuildConfig.defaultKeyConfig.speedDown,
        loaded.rewind.keycode != Keycode.undefined
            ? loaded.rewind
            : BuildConfig.defaultKeyConfig.rewind,
        loaded.leftShift.keycode != Keycode.undefined
            ? loaded.leftShift
            : BuildConfig.defaultKeyConfig.leftShift,
        loaded.rightShift.keycode != Keycode.undefined
            ? loaded.rightShift
            : BuildConfig.defaultKeyConfig.rightShift,
        loaded.arrowUp.keycode != Keycode.undefined
            ? loaded.arrowUp
            : BuildConfig.defaultKeyConfig.arrowUp,
        loaded.arrowDown.keycode != Keycode.undefined
            ? loaded.arrowDown
            : BuildConfig.defaultKeyConfig.arrowDown,
        loaded.arrowLeft.keycode != Keycode.undefined
            ? loaded.arrowLeft
            : BuildConfig.defaultKeyConfig.arrowLeft,
        loaded.arrowRight.keycode != Keycode.undefined
            ? loaded.arrowRight
            : BuildConfig.defaultKeyConfig.arrowRight,
        loaded.tuneLeftSide.keycode != Keycode.undefined
            ? loaded.tuneLeftSide
            : BuildConfig.defaultKeyConfig.tuneLeftSide,
        loaded.tuneS.keycode != Keycode.undefined
            ? loaded.tuneS
            : BuildConfig.defaultKeyConfig.tuneS,
        loaded.tuneD.keycode != Keycode.undefined
            ? loaded.tuneD
            : BuildConfig.defaultKeyConfig.tuneD,
        loaded.tuneF.keycode != Keycode.undefined
            ? loaded.tuneF
            : BuildConfig.defaultKeyConfig.tuneF,
        loaded.tuneC.keycode != Keycode.undefined
            ? loaded.tuneC
            : BuildConfig.defaultKeyConfig.tuneC,
        loaded.tuneM.keycode != Keycode.undefined
            ? loaded.tuneM
            : BuildConfig.defaultKeyConfig.tuneM,
        loaded.tuneJ.keycode != Keycode.undefined
            ? loaded.tuneJ
            : BuildConfig.defaultKeyConfig.tuneJ,
        loaded.tuneK.keycode != Keycode.undefined
            ? loaded.tuneK
            : BuildConfig.defaultKeyConfig.tuneK,
        loaded.tuneL.keycode != Keycode.undefined
            ? loaded.tuneL
            : BuildConfig.defaultKeyConfig.tuneL,
        loaded.tuneRightSide.keycode != Keycode.undefined
            ? loaded.tuneRightSide
            : BuildConfig.defaultKeyConfig.tuneRightSide,
        loaded.emoticon1.keycode != Keycode.undefined
            ? loaded.emoticon1
            : BuildConfig.defaultKeyConfig.emoticon1,
        loaded.emoticon2.keycode != Keycode.undefined
            ? loaded.emoticon2
            : BuildConfig.defaultKeyConfig.emoticon2,
        loaded.emoticon3.keycode != Keycode.undefined
            ? loaded.emoticon3
            : BuildConfig.defaultKeyConfig.emoticon3,
        loaded.emoticon4.keycode != Keycode.undefined
            ? loaded.emoticon4
            : BuildConfig.defaultKeyConfig.emoticon4,
        loaded.emoticon5.keycode != Keycode.undefined
            ? loaded.emoticon5
            : BuildConfig.defaultKeyConfig.emoticon5);
  }

  SerialDevice get currentSerialDevice {
    if (_serialDevices.containsKey(currentSerialDevicePort)) {
      return _serialDevices[currentSerialDevicePort]!;
    }
    _serialDevices[currentSerialDevicePort] =
        SerialDevice(currentSerialDevicePort);
    return _serialDevices[currentSerialDevicePort]!;
  }

  Future<bool> checkCurrentSerialDeviceIsValid() async {
    SerialDevice current = currentSerialDevice;
    return await current.checkDeviceIsValid();
  }

  Future<KeyConfig> _getCurrentSerialDeviceConfig() async {
    SerialDevice current = currentSerialDevice;
    return await current.requestLoadKeyConfiguration();
  }

  void loadCurrentSerialDeviceConfig() async {
    /// Load device's keyconfig data
    ///
    /// Below errors must be handled:
    /// - SerialPortNotInstantiatedWell
    /// - SerialPortCannotOpen
    /// - StreamControllerNotInstantiatedWell
    /// - TimeoutException
    /// - SerialPortCommunicationDoneIncompleted
    keyConfig = await _getCurrentSerialDeviceConfig();
    updatedKeyConfig = KeyConfig.clone(keyConfig);
  }

  void saveCurrentSerialDeviceConfig() async {
    // await request..
    keyConfig = KeyConfig.clone(updatedKeyConfig);
  }
  void revertCurrentSerialDeviceConfig() async {
    // await request..
    updatedKeyConfig = KeyConfig.clone(keyConfig);
  }
}
