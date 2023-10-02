{
 description = "mstpierre NixOS Flake";
 inputs = {
   nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
   home-manager = {
     url = "github:nix-community/home-manager/master";
     inputs.nixpkgs.follows = "nixpkgs";
   };
   helix.url = "github:helix-editor/helix/23.05";
   
 };
 outputs = {self, nixpkgs, home-manager, ...} @inputs: {
   nixosConfigurations = {
       "nixos" = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         specialArgs = inputs;
         modules = [
           ./configuration.nix
           home-manager.nixosModules.home-manager
             {
               home-manager.useGlobalPkgs = true;
               home-manager.useUserPackages = true;

               home-manager.users.mstpierre = import ./home.nix;
             } 
         ];
     };
   };
 };
}
