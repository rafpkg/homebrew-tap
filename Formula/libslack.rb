class Libslack < Formula
  desc "UNIX/C library of general utilities for programmers with Slack"
  homepage "https://libslack.org/"
  url "https://web.archive.org/web/20230605234008/https://libslack.org/download/libslack-0.7.3.tar.gz"
  sha256 "b61ece8b36b902a9a8a9b94dd5e64dffafc49de3d1851ea3c0194b579bedd77f"
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
