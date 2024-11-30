use NativeCall;

class PJInfo is repr('CStruct') {
  has int32 $.major;
  has int32 $.minor;
  has int32 $.patch;
  has Str $.release;
  has Str $.version;
  has Str $.searchpath;
  has Pointer $.paths;
  has size_t $.path_count;
}

class PJContext is repr('CPointer') { }

sub proj_context_create() returns PJContext is native('proj') is export { * }
sub proj_info( PJContext ) returns PJInfo is native('proj') is export { * }


