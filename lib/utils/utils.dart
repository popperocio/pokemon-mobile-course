String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String getAssetImage(String type, String name) {
  return "assets/${type}_types/$name.png";
}