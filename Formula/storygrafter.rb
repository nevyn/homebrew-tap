class Storygrafter < Formula
  desc "Review guides: the story of a code change, told next to every changed line"
  homepage "https://github.com/nevyn/StoryGrafter"
  url "https://github.com/nevyn/StoryGrafter/releases/download/v0.3.0/storygrafter-0.3.0-macos-universal.tar.gz"
  sha256 "4525c32f8475f241c690b81266e257b2f6664105846c91f42b774867146ce091"
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
