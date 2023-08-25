class Libslack < Formula
  desc "UNIX/C library of general utilities for programmers with Slack"
  homepage "https://libslack.org/"
  url "https://github.com/raforg/libslack/releases/download/v0.7.5/libslack-0.7.5.tar.gz"
  sha256 "10561805042cf6c28476af110b886c4b695b4f38a119390acbb63996170b1cac"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?libslack[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-mail-test"
    system "make"
    system "make", "install"
  end

  test do
    system "/bin/sh", "-c", "echo '#include <slack/lib.h>\nint main() { prog_init(); return 0; }' > app.c"
    system "/bin/sh", "-c", "cc -o app app.c `#{bin}/libslack-config --cflags --libs`"
    system "./app"
  end
end

# vi: set et ts=2 sw=2:
