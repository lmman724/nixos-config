{ config, pkgs, ... }:

{
  i18n.defaultLocale = "vi_VN.UTF-8";

  i18n.supportedLocales = [
    "vi_VN.UTF-8"
    "en_US.UTF-8"
  ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "vi";
    useXkbConfig = true;
  };

  environment.variables = {
    LANG = "vi_VN.UTF-8";
    LC_ALL = "vi_VN.UTF-8";
  };
}
