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

  ~synths.do({ |item| ~tidalMidiOut.value(item[0], item[1], item[2]); });

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

  MIDIIn.connectAll;
  ~send_slots = [0];
  MIDIFunc.cc({ |val,num,chan,src|
      ~param = num;
      ~send = [9,71];
      if(~param == 9, {~param = "shuffle"});
      if(~param == 71, {~param = "accent"});
      ~dest = ["tr", ~param].join("_");
      
      ~tidalctrl.sendMsg("/ctrl", ~dest, val);
      [~dest, " = ", val].postln;
    });

  MIDIFunc.sysex({ |val,src|
      ~param = val[11];
      ~val = val[12..15];
      ~ignore = [54,59];
      ~send = [54,59];
      
      if(~ignore.includes(~param) == false, {

        // section = 65
        if(~param == 65, {
          ~param = "section";
          if(~val[1] == 1, { ~val = "a" });
          if(~val[1] == 2, { ~val = "b" });
          if(~val[1] == 4, { ~val = "c" });
          if(~val[1] == 8, { ~val = "d" });
          if(~val[0] == 1, { ~val = "e" });
          if(~val[0] == 2, { ~val = "f" });
          if(~val[0] == 4, { ~val = "g" });
          if(~val[0] == 8, { ~val = "h" });
        });

        // tempo = 16 / 57
        if(~param == 16, {
          ~val.postln;
          ~param = "tempo";
          ~val = ~val[1]*16 + ~val[2]*16 + ~val[3];
        });

        ~dest = ["tr", ~param ].join("_");
        ~tidalctrl.sendMsg("/ctrl", ~dest, ~val);
        [~dest, " = ", ~val].postln;
      })
    });
};

s.latency = 0;









