~usesoftsynths = false;

Quarks.update("SuperDirt");
include("SuperDirt");

s.options.memSize = 8192 * 16;
s.options.numBuffers = 1024 * 16;
s.options.maxNodes = 1024 * 64;

s.options.numOutputBusChannels = 2;
s.options.numInputBusChannels = 2;
s.options.device = "BlackHole 2ch";

// Debug msgs
o = OSCFunc({ |msg| ("msg: " + msg).postln; }, '/play', s.addr);

~tidalctrl = NetAddr.new("localhost", 6010);
// OSCdef(\controltidal, { arg msg; msg.postln; ~tidalctrl.sendMsg("/ctrl", *msg); }, '/ctrl', NetAddr.localAddr );

(
~synths =
  [ [\reface, "reface CP", "reface CP MIDI 1", "Bus 2"]
  , [\mm, "MicroMonsta", "MicroMonsta MIDI 1", "Bus 3"]
  , [\tr, "TR-8S", "TR-8S", "Bus 4"]
  , [\trcc, "TR-8S", "TR-8S CTRL", "Bus 5"]
  , [\mc, "Elektron Model:Cycles", "Elektron Model:Cycles MIDI 1", "Bus 6"]
  // , [\onyx, "Onyx Producer 2-2", "Onyx Producer 2-2 MIDI 1", "Bus 1"]
  // , [\axo, "Axoloti Core", "Axoloti Core MIDI 1", "Bus 1"]
  // , [\mxd1, "minilogue xd", "minilogue xd MIDI 1", "Bus 1"]
  // , [\mxd2, "minilogue xd", "minilogue xd MIDI 2", "Bus 1"]
  , [\loopback, "LOOPBACK", "Bus 1", "Bus 1"]
  ];
);


s.waitForBoot {
  ~dirt = SuperDirt(2, s);
  s.sync;
    ~dirt.start(57120, [0]);
	MIDIClient.init( verbose: true );

  // Function for safely declaring midi devices to tidal
  ~tidalMidiOut = { |tidal_name, device_name, channel_name, bypass_bus_name|
    ~dirt.soundLibrary.addMIDI(tidal_name, MIDIOut.newByName("LOOPBACK", "Bus 2").latency = 0.04);
    if (MIDIOut.findPort(device_name, channel_name) != nil, {
      ("Connecting" + tidal_name).postln;
      ~dirt.soundLibrary.addMIDI(tidal_name, MIDIOut.newByName(device_name, channel_name).latency = 0.04);
    });
  };

  ~synths.do({ |item|
    ~tidalMidiOut.value(item[0], item[1], item[2]);
  });

  // Load Additional Scripts (if any)
  (
    ~bootscripts = PathName("~/.config/SuperCollider/").files;
    ~bootscripts.do({ |file|
      ~script = file.fullPath;
      if(~script.endsWith(".scd") && ~script.contains("startup.scd").not, {
        ("Including: " + ~script).postln;
          ~script.load;
        });
      });
  );

  [MIDIOut.findPort("TR-8S", "TR-8S CTRL"), MIDIOut.findPort("TR-8S", "TR-8S")].do({ |device|
    if (device != nil, {
      (
        "Setting up input from TR8S midi".postln;
        ~deviceid = device.uid;

        ~deviceid.postln;

        ~send_slots = [];
        ~cycles_kbd_offset = 1 - 52;
        MIDIFunc.cc({ |val,num,chan,src|
          [val, num, chan, src].join(" ").postln;
          if(src == ~deviceid, {
            ~send_slots.do({ |slotnum|
              ~dest = ["slot", slotnum, num].join("_");
              ~tidalctrl.sendMsg("/ctrl", ~dest, val);
              [~dest, " = ", val].postln; // TODO: If Debug
            });
          });
        });
        MIDIFunc.noteOn( { |val,num,chan,src|
          if(src == ~deviceid, {
            ("pushing"   + num).postln;
            ~send_slots = (~send_slots ++ [~cycles_kbd_offset + num]).as(Set).as(Array).sort;
          });
        });
        MIDIFunc.noteOff( { |val,num,chan,src|
          if(src == ~deviceid, {
            ("pushing"   + num).postln;
            ~send_slots = ~send_slots.replace(~cycles_kbd_offset + num, nil).as(Set).as(Array).sort;
          });
        });
      );
		});
  });
};

s.latency = 0;
