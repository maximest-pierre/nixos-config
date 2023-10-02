{
  pkgs,
  config,
  ...
}: {
  programs = {
    chromium = {
      enable = true;
    };
    firefox = {
      enable = true;
      profiles.mstpierre = {};
    };
  };
}