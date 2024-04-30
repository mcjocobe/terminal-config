{pkgs, ...}: let
in {
  nix.buildMachines = [
    {
      hostName = "192.168.99.129";
      system = "x86_64-linux";
      protocol = "ssh-ng";
      systems = ["x86_64-linux"];
      maxJobs = 1;
      sshUser = "tiko";
      sshKey = "/Users/joseluiscolomer/.ssh/id_ed25519";
      speedFactor = 2;
      supportedFeatures = ["nixos-test" "benchmark" "big-parallel" "kvm"];
      mandatoryFeatures = [];
    }
  ];
  nix.distributedBuilds = true;
  # optional, useful when the builder has a faster internet connection than yours
  nix.extraOptions = ''
    builders-use-substitutes = true
  '';
}
