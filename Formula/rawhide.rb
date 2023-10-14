class Rawhide < Formula
  desc "(rh) find files using pretty C expressions"
  homepage "https://raf.org/rawhide/"
  url "https://github.com/raforg/rawhide/releases/download/v3.3/rawhide-3.3.tar.gz"
  sha256 "a51a1360ce4763838b29a548a8e49dcf47a93a922bf1df05c8b7d50ecb9ab09d"
  license "GPL-3.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?rawhide[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  depends_on "pkg-config" => :build
  depends_on "libmagic"
  depends_on "pcre2"
  on_linux do
    depends_on "acl"
    depends_on "e2fsprogs"
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "ETCDIR=#{etc}", "rh", "install"
  end

  test do
    system "/bin/sh", "-c", "mkdir testdir; cd testdir; touch f; mkdir d"
    system "/bin/sh", "-c", "[ \"`#{bin}/rh -m1 testdir f`\" = testdir/f ]"
    system "/bin/sh", "-c", "[ \"`#{bin}/rh -m1 testdir d`\" = testdir/d ]"
  end
end

# vi: set et ts=2 sw=2:
