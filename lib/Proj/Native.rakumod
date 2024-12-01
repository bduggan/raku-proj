use NativeCall;

class PJContext is repr('CPointer') { }
sub proj_context_create() returns PJContext is native('proj') is export { * }

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

sub proj_info( PJContext ) returns PJInfo is native('proj') is export { * }

class PJ_XYZT is repr('CStruct') { has num64 $.x; has num64 $.y; has num64 $.z; has num64 $.t; }
class PJ_UVWT is repr('CStruct') { has num64 $.u; has num64 $.v; has num64 $.w; has num64 $.t; }
class PJ_LPZT is repr('CStruct') { has num64 $.lam; has num64 $.phi; has num64 $.z; has num64 $.t; }
class PJ_OPK is repr('CStruct') { has num64 $.o; has num64 $.p; has num64 $.k; }
class PJ_ENU is repr('CStruct') { has num64 $.e; has num64 $.n; has num64 $.u; }
class PJ_GEOD is repr('CStruct') { has num64 $.s; has num64 $.a1; has num64 $.a2; }
class PJ_UV is repr('CStruct') { has num64 $.u; has num64 $.v; }
class PJ_XY is repr('CStruct') { has num64 $.x; has num64 $.y; }
class PJ_LP is repr('CStruct') { has num64 $.lam; has num64 $.phi; }
class PJ_XYZ is repr('CStruct') { has num64 $.x; has num64 $.y; has num64 $.z; }
class PJ_UVW is repr('CStruct') { has num64 $.u; has num64 $.v; has num64 $.w; }
class PJ_LPZ is repr('CStruct') { has num64 $.lam; has num64 $.phi; has num64 $.z; }

class vals is repr('CStruct') {
  has num64 $.v0;
  has num64 $.v1;
  has num64 $.v2;
  has num64 $.v3;
}

class PJCoord is repr('CUnion') {
  # HAS CArray[num64] $.v; # does not work:
  HAS vals $.v;
  HAS PJ_XYZT $.xyzt;
  HAS PJ_UVWT $.uvwt;
  HAS PJ_LPZT $.lpzt;
  HAS PJ_GEOD $.geod;
  HAS PJ_OPK $.opk;
  HAS PJ_ENU $.enu;
  HAS PJ_XYZ $.xyz;
  HAS PJ_UVW $.uvw;
  HAS PJ_LPZ $.lpz;
  HAS PJ_XY $.xy;
  HAS PJ_UV $.uv;
  HAS PJ_LP $.lp;
}

sub proj_coord(PJContext, num64, num64, num64, num64) returns PJCoord is native('proj') is export { * }
