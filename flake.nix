{
  inputs.dream2nix.url = "github:nix-community/dream2nix";
  outputs = { self, dream2nix }:
  rec { packages.aarch64-linux.default = self.packages.aarch64-linux.potree; overlays.default = (self: super: { potree = packages.aarch64-linux.default; }); } //
    dream2nix.lib.makeFlakeOutputs {
      systems = ["aarch64-linux"];
      config.projectRoot = ./.;
      source = ./.;
      projects = ./projects.toml;
    };
}
