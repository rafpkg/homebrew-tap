class Libslack < Formula
  desc "UNIX/C library of general utilities for programmers with Slack"
  homepage "https://libslack.org/"
  url "https://github.com/raforg/libslack/releases/download/v0.7.4/libslack-0.7.4.tar.gz"
  sha256 "094f2ae8d45cbcd678bfba60e47fabceed27fb00dc77c25a63235de9cafc0da6"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?libslack[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  def install
    system "./configure", "--prefix=#{prefix}"
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
