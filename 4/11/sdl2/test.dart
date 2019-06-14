import 'dart:ffi';
import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform, exit;

class Arena {
  Arena();

  List<Pointer<Void>> _allocations = [];

  /// Bound the lifetime of [ptr] to this [Arena].
  T scoped<T extends Pointer>(T ptr) {
    _allocations.add(ptr.cast());
    return ptr;
  }

  /// Frees all memory pointed to by [Pointer]s in this arena.
  void finalize() {
    for (final ptr in _allocations) {
      ptr.free();
    }
  }

  /// The last [Arena] in the zone.
  factory Arena.current() {
    return Zone.current[#_currentArena];
  }
}

/// Bound the lifetime of [ptr] to the current [Arena].
T scoped<T extends Pointer>(T ptr) => Arena.current().scoped(ptr);

class RethrownError {
  dynamic original;
  StackTrace originalStackTrace;
  RethrownError(this.original, this.originalStackTrace);
  toString() => """RethrownError(${original})
${originalStackTrace}""";
}

R runArena<R>(R Function(Arena) body) {
  Arena arena = Arena();
  try {
    return runZoned(() => body(arena),
        zoneValues: {#_currentArena: arena},
        onError: (error, st) => throw RethrownError(error, st));
  } finally {
    arena.finalize();
  }
}

/// Represents a String in C memory, managed by an [Arena].
class CString extends Pointer<Uint8> {
  /// Allocates a [CString] in the current [Arena] and populates it with
  /// [dartStr].
  factory CString(String dartStr) => CString.inArena(Arena.current(), dartStr);

  /// Allocates a [CString] in [arena] and populates it with [dartStr].
  factory CString.inArena(Arena arena, String dartStr) =>
      arena.scoped(CString.allocate(dartStr));

  /// Allocate a [CString] not managed in and populates it with [dartStr].
  ///
  /// This [CString] is not managed by an [Arena]. Please ensure to [free] the
  /// memory manually!
  factory CString.allocate(String dartStr) {
    List<int> units = Utf8Encoder().convert(dartStr);
    Pointer<Uint8> str = allocate(count: units.length + 1);
    for (int i = 0; i < units.length; ++i) {
      str.elementAt(i).store(units[i]);
    }
    str.elementAt(units.length).store(0);
    return str.cast();
  }

  /// Read the string for C memory into Dart.
  static String fromUtf8(CString str) {
    if (str == null) return null;
    int len = 0;
    while (str.elementAt(++len).load<int>() != 0);
    List<int> units = List(len);
    for (int i = 0; i < len; ++i) units[i] = str.elementAt(i).load();
    return Utf8Decoder().convert(units);
  }
}

class WindowPointer extends Pointer<Void> {}

class SurfacePointer extends Pointer<Void> {}

class RectPointer extends Pointer<Void> {}

typedef Init_native_t = Int32 Function(Uint32 flags);

typedef Init = int Function(int flags);

typedef CreateWindow_native_t = WindowPointer Function(
    CString title, Int32 x, Int32 y, Int32 w, Int32 h, Uint32 flags);

typedef WindowPointer CreateWindow(
    CString title, int x, int y, int w, int h, int flags);

typedef GetWindowSurface_native_t = SurfacePointer Function(WindowPointer wp);

typedef GetWindowSurface = SurfacePointer Function(WindowPointer wp);

typedef FillRect_native_t = Int32 Function(
    SurfacePointer dst, RectPointer rect, Uint32 color);

typedef FillRect = int Function(
    SurfacePointer dst, RectPointer rect, int color);

typedef UpdateWindowSurface_native_t = Int32 Function(WindowPointer window);

typedef UpdateWindowSurface = int Function(WindowPointer window);

typedef Delay_native_t = Void Function(Uint32 ms);

typedef Delay = void Function(int ms);

typedef DestroyWindow_native_t = Void Function(WindowPointer window);

typedef DestroyWindow = void Function(WindowPointer window);

typedef Quit_native_t = Void Function();

typedef Quit = void Function();

class Init_Flags {
  static const int TIMER = 0x00000001;
  static const int AUDIO = 0x00000010;
  static const int VIDEO = 0x00000020;
  static const int JOYSTICK = 0x00000200;
  static const int HAPTIC = 0x00001000;
  static const int GAMECONTROLLER = 0x00002000;
  static const int EVENTS = 0x00004000;
  static const int SENSOR = 0x00008000;
  static const int NOPARACHUTE = 0x00100000;
}

String _platformPath(String name, {String path}) {
  if (path == null) path = "";
  if (Platform.isLinux || Platform.isAndroid)
    return path + "lib" + name + ".so";
  if (Platform.isMacOS) return path + "lib" + name + ".dylib";
  if (Platform.isWindows) return path + name + ".dll";
  throw Exception("Platform not implemented");
}

DynamicLibrary dlopenPlatformSpecific(String name, {String path}) {
  String fullPath = _platformPath(name, path: path);
  return DynamicLibrary.open(fullPath);
}

main(List<String> args) {
  var sdl2_binding = dlopenPlatformSpecific("SDL2");
  var sdl_init = sdl2_binding.lookupFunction<Init_native_t, Init>("SDL_Init");
  var sdl_create_window = sdl2_binding
      .lookupFunction<CreateWindow_native_t, CreateWindow>("SDL_CreateWindow");
  var sdl_get_win_surface =
      sdl2_binding.lookupFunction<GetWindowSurface_native_t, GetWindowSurface>(
          "SDL_GetWindowSurface");
  var sdl_fillrect =
      sdl2_binding.lookupFunction<FillRect_native_t, FillRect>("SDL_FillRect");
  var sdl_update_win_surface = sdl2_binding.lookupFunction<
      UpdateWindowSurface_native_t,
      UpdateWindowSurface>("SDL_UpdateWindowSurface");
  var sdl_delay =
      sdl2_binding.lookupFunction<Delay_native_t, Delay>("SDL_Delay");
  var sdl_des_win =
      sdl2_binding.lookupFunction<DestroyWindow_native_t, DestroyWindow>(
          "SDL_DestroyWindow");
  var sdl_quit = sdl2_binding.lookupFunction<Quit_native_t, Quit>("SDL_Quit");

  runArena((area) {
    const width = 600;
    const height = 400;

    WindowPointer wp;
    SurfacePointer sp;

    if (sdl_init(Init_Flags.VIDEO) < 0) {
      print("error");
      exit(-1);
    }
    var title = area.scoped(CString.allocate("hello dart"));

    wp = sdl_create_window(title, 200, 200, width, height, 0x00000004);

    sp = sdl_get_win_surface(wp);

    sdl_fillrect(sp, null, 0x336699);

    sdl_update_win_surface(wp);

    sdl_delay(10000);

    sdl_des_win(wp);

    sdl_quit();
  });

  return 0;
}
