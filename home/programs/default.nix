{
    config,
    pkgs,
    ...
}: {
    imports = [
        ./browsers.nix
        ./spotify.nix
        ./common.nix
    ];
}