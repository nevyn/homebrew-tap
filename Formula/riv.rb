# Lives in github.com/nevyn/homebrew-tap as Formula/riv.rb; the release workflow rewrites
# url and sha256 on every tag.
class Riv < Formula
  desc "Writer for the Rivulets board over Claude Code sessions"
  homepage "https://rivulets.d.nevyn.dev"
  url "https://github.com/nevyn/homebrew-tap/releases/download/v0.4.1/riv-0.4.1-macos-universal.tar.gz"
  sha256 "a20c0b37916fecf02072313941d367b72a51ba4aaaea9db8b269cb435627d3fb"

  depends_on macos: :sonoma

  def install
    bin.install "riv"
  end

  # `riv poll` runs one pass and exits, so launchd starts it on an interval.
  service do
    run [opt_bin/"riv", "poll"]
    run_type :interval
    interval 120
    log_path var/"log/riv-poll.log"
    error_log_path var/"log/riv-poll.err.log"
    environment_variables PATH: std_service_path_env
  end

  test do
    assert_match "Rivulets", shell_output("#{bin}/riv --help")
    # The release workflow stamps the tag into the binary, and rewrites url, hence version, to match.
    assert_equal version.to_s, shell_output("#{bin}/riv --version").strip
  end
end
