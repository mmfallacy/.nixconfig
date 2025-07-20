{ pkgs, ... }:
{
  xdg.desktopEntries = {
    chatgpt = {
      name = "ChatGPT";
      genericName = "LLM PWA";
      exec = "chromium --app=https://chatgpt.com/";
      terminal = false;
      categories = [
        "Network"
        "Chat"
      ];
    };
  };

}
