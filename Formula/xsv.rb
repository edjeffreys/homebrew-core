class Xsv < Formula
  desc "Fast CSV toolkit written in Rust."
  homepage "https://github.com/BurntSushi/xsv"
  url "https://github.com/BurntSushi/xsv/archive/0.12.0.tar.gz"
  sha256 "72f791d4903fd56fed83295679f599025491d970d825351f5364a617c9bb5f11"
  head "https://github.com/BurntSushi/xsv.git"

  bottle do
    sha256 "6f7fd81033e00cfb8736e24450a87d98e1f7fc28185644b64a8331ffe0ff6df8" => :sierra
    sha256 "4be9b4e5af53e4e22c8dbafb83befaaacaf382c0ae24dfcf4a815a91974b6025" => :el_capitan
    sha256 "eef4f40a15ea50c5526b6efd2c26d97ba103db2fe6fad4050792d41469cd7f37" => :yosemite
  end

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"

    bin.install "target/release/xsv"
  end

  test do
    (testpath/"test.csv").write("first header,second header")
    system "#{bin}/xsv", "stats", "test.csv"
  end
end
