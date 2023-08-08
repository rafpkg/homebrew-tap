class Mved < Formula
  desc "Carefully rename multiple files and directories"
  homepage "https://raf.org/mved/"
  url "https://web.archive.org/web/20230616064807/https://raf.org/mved/download/mved-3.0.tar.gz"
  sha256 "f8e01e9fee847e01cd2ee3a7e621c97e49c8f7c52e472b3efacfeb1029a5ff31"
  license "GPL-2.0-or-later"

  livecheck do
    url :homepage
    regex(/href=.*?mved[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    touch "a.c"
    touch "b.c"
    system "#{bin}/mved", "=.c", "=.d"
    system "/bin/sh", "-c", "[ \"`echo *.d`\" = 'a.d b.d' ]"
  end
end

# vi: set et ts=2 sw=2:
