class Daemon < Formula
  desc "Turns other processes into daemons"
  homepage "https://libslack.org/daemon/"
  url "https://github.com/raforg/daemon/releases/download/v0.8.4/daemon-0.8.4.tar.gz"
  sha256 "fa28859ad341cb0a0b012c11c271814f870482013b49f710600321d379887cd1"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?daemon[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  on_linux do
    depends_on "systemd" # For --bind (./configure --enable-logind)
  end

  def install
    config_args = ["--prefix=#{prefix}", "--disable-mail-test"]
    config_args += ["--enable-logind"] if OS.linux?
    system "./configure", *config_args
    system "make"
    system "make", "install"
    system "make", "install-daemon-conf" # For /etc/daemon.d /etc/daemon.conf.d/
  end

  test do
    system "/bin/sh", "-c", "case \"`#{bin}/daemon --version`\" in daemon-*) exit 0;; *) exit 1;; esac"
    system "/bin/sh", "-c", "#{bin}/daemon --help | grep -q .--bind" if OS.linux?
  end
end

# vi: set et ts=2 sw=2:
