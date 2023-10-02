{
    config,
    pkgs,
    ...
}: {
    imports = [
        ./browsers.nix
        ./common.nix
    ];
}