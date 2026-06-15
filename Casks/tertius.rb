cask "tertius" do
  version "0.1.3"
  sha256 "bb3a9126285848bdeca94ee1b4e8e27c5da667675d3362d4b0f6678a237422db"

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
