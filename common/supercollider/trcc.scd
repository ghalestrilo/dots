MIDIIn.connectAll;
~send_slots = [0];
~device = MIDIIn.findPort("TR-8S", "TR-8S");
// ~device = MIDIIn.findPort("TR-8S", "TR-8S CTRL");
// [MIDIIn.findPort("TR-8S", "TR-8S")].do({ |device| MIDIIn.connect(0, ~device); });

// ~device.postln;

if(~device != nil, {
  ~tidalctrl = NetAddr.new("localhost", 6010);

  ~tidalSendValue = { |key, value|
    ~dest = ["tr", key].join("_");
    ~tidalctrl.sendMsg("/ctrl", ~dest, value);
    // [~dest, " = ", value].join(" ").postln;
  };

  MIDIFunc.cc({ |val,num,chan,src|
    // [val,num,chan,src].postln;
    ~param = num;
    // ~send = [9,71];
    ~send = (~param == 9).or(~param == 71);
    // ~send.includes(~param).postln;
    if(~send, {
      if(~param == 9, {~param = "shuffle"});
      if(~param == 71, {~param = "accent"});
      ~tidalSendValue.value(~param, val);
    })
  });

  MIDIFunc.sysex({ |val,src|
    // [val,src].postln;
    ~param = val[11];
    ~val = val[12..15];
    // ~ignore = [54,59];
    // ~send = [65,16,57];
    // ~send = (~param == 65).or(~param == 16).or(~param == 57);

    // ~send.includes(~param).postln;

    // if(~send.includes(~param), {

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
      ~tidalSendValue.value(~param, ~val);
    });

    // tempo = 16 / 57
    if((~param == 16).or(~param == 57), {
      // ~val.postln;
      ~param = "tempo";
      ~val = ~val[1]*16 + ~val[2]*16 + ~val[3];
      ~tidalSendValue.value(~param, ~val);
    });

  });
});
