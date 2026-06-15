cask "tertius" do
  version "0.1.1"
  sha256 "4b6cbcddd0633d43b124ad80736b01e13eaaa88e570ef4c60920f5af15618aa9"

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
