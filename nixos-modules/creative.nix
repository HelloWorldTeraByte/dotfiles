{
  config,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    inkscape
    blender
    kdePackages.kdenlive
    godot
  ];
}
