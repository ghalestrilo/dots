(
  ~addr = NetAddr.new("127.0.0.1", 3333);
  OSCdef(\tidalplay2, {
    arg msg;
    ~addr.sendMsg("/play2", *msg);
  }, '/play2', n);
)