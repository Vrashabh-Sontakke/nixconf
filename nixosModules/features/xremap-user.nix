{pkgs, ...}: {
  hardware.uinput.enable = true;
  users.groups.uinput.members = ["vrash"];
  users.groups.input.members = ["vrash"];
}
