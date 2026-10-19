cask "ramback" do
  version "1.0"
  sha256 "174194f4519afc91190292228e524d0001a1f00b4e89137de144c3a8083d9579"

  url "https://ramback.app/download/Ramback-#{version}.dmg"
  name "Ramback"
  desc "Menu bar app that shows and stops simulators, emulators, daemons and dev servers"
  homepage "https://ramback.app/"

  livecheck do
    url "https://ramback.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Ramback.app"
  # The CLI and MCP server ship inside the app.
  binary "#{appdir}/Ramback.app/Contents/Helpers/ramback"

  uninstall quit: "app.ramback.mac"

  # The trial start date lives in the Keychain, which zap doesn't touch.
  zap trash: [
    "~/Library/Application Support/Ramback",
    "~/Library/Caches/app.ramback.mac",
    "~/Library/HTTPStorages/app.ramback.mac",
    "~/Library/Preferences/app.ramback.mac.plist",
  ]
end
