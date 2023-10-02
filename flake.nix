{
 description = "mstpierre NixOS Flake";
 inputs = {
   nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
   home-manager = {
     url = "github:nix-community/home-manager/master";
     inputs.nixpkgs.follows = "nixpkgs";
   };
   
   nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

   helix.url = "github:helix-editor/helix/23.05";
   
 };
 outputs = {self, nixpkgs, home-manager, nix-vscode-extensions, ...} @inputs: {
   nixosConfigurations = {
       "nixos" = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
           ./hosts/nixos-vm
           home-manager.nixosModules.home-manager
             {
               home-manager.useGlobalPkgs = true;
               home-manager.useUserPackages = true;
               home-manager.extraSpecialArgs = inputs;
               home-manager.users.mstpierre = import ./home;
             } 
         ];
     };
   };
 };
}
