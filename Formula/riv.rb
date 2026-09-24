# Lives in github.com/nevyn/homebrew-tap as Formula/riv.rb; the release workflow rewrites
# url and sha256 on every tag.
class Riv < Formula
  desc "Writer for the Rivulets board over Claude Code sessions"
  homepage "https://rivulets.d.nevyn.dev"
  url "https://github.com/nevyn/Rivulets/releases/download/v0.1.0/riv-0.1.0-macos-universal.tar.gz"
  sha256 "0b4163f34817da69eb37091ab1ab5cd5a2654c29174910ca15895403163fb729"

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
  end
end
