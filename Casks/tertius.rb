cask "tertius" do
  version "0.1.2"
  sha256 "e10f7746c8288db315f9e6698b6cc59aa7f4acbbe2d9e3de39261da888d4b687"

  url "https://github.com/realgarit/tertius/releases/download/v#{version}/Tertius.zip"
  name "Tertius"
  desc "Middle-mouse drag (orbit/pan) on the trackpad via Option + two-finger glide"
  homepage "https://github.com/realgarit/tertius"

  depends_on macos: :tahoe

  app "Tertius.app"

  zap trash: [
    "~/Library/Preferences/io.github.realgarit.tertius.plist",
  ]
end
