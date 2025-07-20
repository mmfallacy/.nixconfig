{ pkgs, ... }:
{
  xdg.desktopEntries = {
    gemini = {
      name = "Gemini";
      genericName = "LLM PWA";
      exec = "chromium --app=https://gemini.google.com/";
      terminal = false;
      categories = [
        "Network"
        "Chat"
      ];
    };
  };

}
