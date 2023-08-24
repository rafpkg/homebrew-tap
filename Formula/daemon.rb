class Daemon < Formula
  desc "Turns other processes into daemons"
  homepage "https://libslack.org/daemon/"
  url "https://github.com/raforg/daemon/releases/download/v0.8.3/daemon-0.8.3.tar.gz"
  sha256 "bd6fd870ca4761f43f045d72db0f8a0de81a3eac07264bf449b152d7dd899ac0"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?daemon[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  on_linux do
    depends_on "systemd" # For --enable-logind
  end

  def install
    config_args = ["--prefix=#{prefix}"]
    config_args += ["--enable-logind"] if OS.linux?
    system "./configure", *config_args
    system "make"
    system "make", "install"
    system "make", "install-daemon-conf"
  end

  test do
    system "/bin/sh", "-c", "[ \"`#{bin}/daemon --version`\" = daemon-0.8.3 ]"
    system "/bin/sh", "-c", "#{bin}/daemon --help | grep -q .--bind" if OS.linux?
  end
end

# vi: set et ts=2 sw=2:
