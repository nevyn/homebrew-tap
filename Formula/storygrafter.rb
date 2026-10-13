class Storygrafter < Formula
  desc "Review guides: the story of a code change, told next to every changed line"
  homepage "https://github.com/nevyn/StoryGrafter"
  url "https://github.com/nevyn/StoryGrafter/releases/download/v0.1.1/storygrafter-0.1.1-macos-universal.tar.gz"
  sha256 "6ee48965375e17cec86c0b884d0406fb3cae81be46e1a0003026c7554dffaa3b"
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
