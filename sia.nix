{pkgs ? import ./nix/nixpkgs.nix {}}:

pkgs.buildGoModule rec {
  pname = "sia";
  version = "1.5.0";
  src = pkgs.fetchFromGitLab {
    owner = "NebulousLabs";
    repo = "Sia";
    rev = "492f9b29366ed35889c2800cbe4349cc833611ec";
    sha256 = "sha256:1y8ya663hnhj5f5jgx3vb0bg3gk7j824xmp5f1pcvvqmlxn6pj3d";
  };
  patches = [./rename_vendor_override.patch];
  doCheck = false;
  vendorSha256 = "sha256:0x6pn0d2xvf9bd4dizfnfkzip6zpbx00s2jff1liyyjch3hsq6d3";
  subPackages = ["cmd/siac" "cmd/siad" ];
}