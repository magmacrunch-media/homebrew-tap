class Texastoast < Formula
  include Language::Python::Virtualenv

  desc "Python RPG engine with I2C hardware abstraction for magmacrunch game systems"
  homepage "https://github.com/magmacrunch-media/texastoast"
  url "https://files.pythonhosted.org/packages/ca/f3/adec4ee6ebca0eaf1c7e20411c482b8900eebd635666120f599ea4de3d51/texastoast-0.11.3.tar.gz"
  sha256 "701f3734e37a89ce3acedac2c5ef9df049765ba135758891472a6a5a3cca1291"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/magmacrunch-media/homebrew-tap/releases/download/texastoast-0.11.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "57764b53712af6ff6113b3fc2df28e984141045175269bb6e4a81a4d332b71da"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1d60bb3a2520a370c2479fd242aca6463017a039eaea74b9467fd065c7d57579"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "0604f6f53a99344c872f7845fb0a71d8724651aa44c4a48c3027fe1fd3e10407"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d2a1bac19e5d5ed091965d9b7caec84a20c2923f4e8e496bf1bbb103f57daebc"
  end

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    # The virtualenv's own interpreter, not bin/. virtualenv_install_with_resources
    # builds the venv under libexec and links only console scripts into bin, so
    # there is no bin/python3.12 here to run this with.
    output = shell_output("#{libexec}/bin/python -c 'import texastoast; print(texastoast.__version__)'")
    assert_match version.to_s, output
  end
end
