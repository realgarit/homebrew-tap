cask "tertius" do
  version "0.1.4"
  sha256 "d7e1d80ad8426c1925ecc9637c6221301066b1e9b0cb83cc86ff6e38c1410670"

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
