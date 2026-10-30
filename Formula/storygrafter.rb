class Storygrafter < Formula
  desc "Review guides: the story of a code change, told next to every changed line"
  homepage "https://github.com/nevyn/StoryGrafter"
  url "https://github.com/nevyn/StoryGrafter/releases/download/v0.4.0/storygrafter-0.4.0-macos-universal.tar.gz"
  sha256 "3f1e7f5baed8efa3f60cc3d20afd296635364bc1e556757e14f9643bc95979b8"
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
