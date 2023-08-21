class BroadbandUsage < Formula
  desc "Home broadband usage meter for SNMP-enabled modem/routers"
  homepage "https://raf.org/broadband-usage/"
  url "https://github.com/raforg/broadband-usage/releases/download/v0.2/broadband-usage-0.2.tar.gz"
  sha256 "6a1b215c0d86259ee8fb250b11c436eae0b9429fe4b617465987e798d033c0c7"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?broadband-usage[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  def install
    # NOTE: Syslog (or something) will need to send log messages to here
    inreplace "broadband-usage", "/var/log/broadband", "#{var}/log/broadband"
    inreplace "broadband-usage-log", "/var/log/broadband", "#{var}/log/broadband"
    system "make", "prefix=#{prefix}", "logdir=#{var}/log/broadband", "install"
  end

  test do
    system "#{bin}/broadband-usage", "--help"
  end
end

# vi: set et ts=2 sw=2:
