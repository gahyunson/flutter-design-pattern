// Laptop laptop = Laptop();
// Pad pad = Pad();
// On on = On();
// Off off = Off();
// Saving saving = Saving();
// pad.powerPush();
// pad.setPowerState(on);
// pad.powerPush();
// pad.setPowerState(off);
// pad.powerPush();
class Pad {
  PowerState _powerState;

  Pad() : _powerState = Off();

  void setPowerState(PowerState powerState) {
    _powerState = powerState;
  }

  void powerPush(Pad pad) {
    _powerState.powerPush(pad);
  }
}

abstract class PowerState {
  void powerPush(Pad pad);
}

class On implements PowerState {
  @override
  void powerPush(Pad pad) {
    print("power OFF");
    pad.setPowerState(Saving());
  }
}

class Off implements PowerState {
  @override
  void powerPush(Pad pad) {
    print("power ON");
    pad.setPowerState(On());
  }
}

class Saving implements PowerState {
  @override
  void powerPush(Pad pad) {
    print("power SAVING");
    pad.setPowerState(Off());
  }
}

// Laptop laptop = Laptop();
// laptop.powerPush();
// laptop.setPowerState(Laptop.ON);
// laptop.powerPush();
class Laptop {
  static String ON = "on";
  static String OFF = "off";
  static String SAVING = "saving";
  String _powerState = "";

  Laptop() {
    _powerState = OFF;
  }
  void setPowerState(String powerState) {
    _powerState = powerState;
  }

  void powerPush() {
    if (_powerState == "on") {
      print("Power off");
    } else if (_powerState == "saving") {
      print("Power on");
    } else {
      print("Saving mode");
    }
  }
}
