class Storygrafter < Formula
  desc "Review guides: the story of a code change, told next to every changed line"
  homepage "https://github.com/nevyn/StoryGrafter"
  url "https://github.com/nevyn/StoryGrafter/releases/download/v0.1.0/storygrafter-0.1.0-macos-universal.tar.gz"
  sha256 "585a3120a945bdecb162fdaca7b4819f1dfe1fe7324519bfa0019301437bd132"
  license "MIT"

  depends_on macos: :sonoma

  def install
    # The resource bundles must sit beside the real executable; bin gets a symlink.
    libexec.install "storygrafter", Dir["*.bundle"]
    bin.install_symlink libexec/"storygrafter"
    doc.install "licenses"
  end

  test do
    assert_match "# Story format", shell_output("#{bin}/storygrafter format")
  end
end
