class Magmascript < Formula
  include Language::Python::Virtualenv

  desc "Scripting toolkit with domain-first subcommands"
  homepage "https://magmacrunch.com/ware/magmascript/"
  url "https://files.pythonhosted.org/packages/0c/a7/da106b721fcacc02252bb894cc4ed71576ed095e39a026f2ed00a5971e74/magmascript-3.2.1.tar.gz"
  sha256 "4e440aa7b42c19e3f9881c4ccfa296b106fac476fb14691512189868746fdf55"
  license "MIT"

  bottle do
    root_url "https://github.com/magmacrunch-media/homebrew-tap/releases/download/magmascript-3.2.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "ddf2dc3a695cf2a34b3ddf1558774b763622683f9d626bfdd6b3c18fcbaa52d6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9f5f7e398de06e67442ee9e95875191d3a9665b037657b6e5a14b0a438e6cbca"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "b6e78b212b02f74d834ebb4091cb4ab0efd9f326248edd49ab1a537949b869f5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "66af049350de84a30787ba61762963b5f53f138e1ce16bfd7f5ed26d844f7e7f"
  end

  depends_on "python@3.13"

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/61/cc/a381afa6efea9f496eff839d4a6a1aed3bfafc7b3ab4b0d1b243a12573dd/anyio-4.14.2.tar.gz"
    sha256 "cfa139f3ed1a23ee8f88a145ddb5ac7605b8bbfd8592baacd7ce3d8bb4313c7f"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a/certifi-2026.7.22.tar.gz"
    sha256 "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb/httpcore-1.0.9.tar.gz"
    sha256 "6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/5f/f7/abb373e5757eaec4b922b92f97ec8d6d7e057cf06778247604fbc4e7c3f3/idna-3.19.tar.gz"
    sha256 "5e0811a4383b21dc5838069f801c4fb62113b7447663d2530d2bd6e77b49bf15"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/7d/ea/39b988c938f75cb75d7045b5c69f8bfed47ee2152c8837fb403de29d6fb8/prompt_toolkit-3.0.53.tar.gz"
    sha256 "9ec8a0ad96d5c56148b3f914aa79c1564c3fde5d2e6b876e7bc327e353cf8fa6"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/36/57/ed58088fafdf4c55a0ad6bde846502567645424d7ebf325230b9237f4085/wcwidth-0.8.3.tar.gz"
    sha256 "d128512515fbf4612e0ff21fd6380399210318b7b54a9af59dff8454cf9730eb"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # --help prints usage and the domain list, never a version, so it can only
    # prove the console script runs. Assert the version against the package.
    assert_match "domain-first subcommands", shell_output("#{bin}/magmascript --help")

    output = shell_output("#{libexec}/bin/python -c 'import magmascript; print(magmascript.__version__)'")
    assert_match version.to_s, output
  end
end
