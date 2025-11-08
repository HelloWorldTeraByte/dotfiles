{
  config,
  pkgs,
  lib,
  ...
}:
let
  androidBuildToolVersion = "34.0.0";
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    platformVersions = [ "34" ];
    buildToolsVersions = [ androidBuildToolVersion ];
    includeNDK = true;
    ndkVersions = [ "23.2.8568313" ];
    includeCmake = true;
    cmakeVersions = [ "3.10.2" ];
  };
  androidSdkPath = "${androidComposition.androidsdk}/libexec/android-sdk";
in
{
  options = {
    android.sdkPath = lib.mkOption {
      type = lib.types.path;
      default = androidSdkPath;
      description = "The path to the Android SDK directory.";
    };
    android.buildToolVersion = lib.mkOption {
      type = lib.types.str;
      default = androidBuildToolVersion;
      description = "Android build tools version";
    };
  };

  config = {
    nixpkgs.config.android_sdk.accept_license = true;

    programs.adb.enable = true;

    environment.systemPackages = with pkgs; [
      jdk17
      android-studio
      androidComposition.androidsdk
    ];
  };
}
