class Storygrafter < Formula
  desc "Review guides: the story of a code change, told next to every changed line"
  homepage "https://github.com/nevyn/StoryGrafter"
  url "https://github.com/nevyn/StoryGrafter/releases/download/v0.3.2/storygrafter-0.3.2-macos-universal.tar.gz"
  sha256 "7d2225836fc4f5a4cb974eb7d1e859a703331779397fde7c5337394bedf9c216"
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
