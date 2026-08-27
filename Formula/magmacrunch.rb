class Magmacrunch < Formula
  include Language::Python::Virtualenv

  desc "Terminal arcade - a card grid of every installed cabinet"
  homepage "https://github.com/magmacrunchmedia/magmacrunch"
  url "https://files.pythonhosted.org/packages/be/1f/6b5a27157d2915bb54149dbb54e3a7b8be540ac5f5d362a76925ec08a2e9/magmacrunch-0.1.1.tar.gz"
  sha256 "c60543e8576ef264272f8f019052b10805f1e6014ee044d51e7e2e4e96b047fb"
  # Not an open-source licence. The engine underneath (texastoast) is
  # Apache-2.0; the arcade and the games it seats are not, and a package cannot
  # be more permissive than what it depends on.
  license "PolyForm-Noncommercial-1.0.0"

  bottle do
    root_url "https://github.com/magmacrunchmedia/homebrew-tap/releases/download/magmacrunch-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "f955c92335f06fc2e8eea1fa4222c4a5f1e955ec669611f691f2f1d0ffbb3752"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e927c48ecbe337f759a0bb279499c4cda38d6e4a1b3397200dbf02e8b1073c8d"
  end

  depends_on "python@3.12"

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/53/3e/79f35b8c31a1881893b7e62be80b2573f06e38db47c33065749293ee1b97/linkify_it_py-2.1.1.tar.gz"
    sha256 "a78f40fee177eb912e9d2375074108378523c38d3fde5d3ee804f465b6cfbfee"
  end

  resource "magmacrunch-george-boole" do
    url "https://files.pythonhosted.org/packages/91/01/9dd51c405bdcf7ebe531da2460cd482ece6e13b0d97b64cfbc0e00bb58cc/magmacrunch_george_boole-0.1.0.tar.gz"
    sha256 "7f54fa993598583b1d9f2afb28b05e6c556504fa0d977eb4cdbe49ad6949b789"
  end

  resource "magmacrunch-moonlight-drift" do
    url "https://files.pythonhosted.org/packages/ab/86/bb48c7f210b5f6aaca096d786bddffc67a34d1e24e2aaa2b485af7217d56/magmacrunch_moonlight_drift-0.1.0.tar.gz"
    sha256 "c2f71ad97603d85d605eb78896612f47fd26d2a6f2725bf98a9a1952dddb6941"
  end

  resource "magmacrunch-thld" do
    url "https://files.pythonhosted.org/packages/5f/73/31a105a322f2d67b173b485c748344a8cc9ae896afd5d602c258174fdd29/magmacrunch_thld-0.1.0.tar.gz"
    sha256 "58bf71b183c7f7f0b47d9406d5d0c0046857682e4f290121dd95ddc1ad418b68"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "mdit-py-plugins" do
    url "https://files.pythonhosted.org/packages/59/fc/f8d0863f8862f25602c0404d75568e89fb6b4109804645e5cdfb1be5cf56/mdit_py_plugins-0.6.1.tar.gz"
    sha256 "a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/50/bb/ebc6636e1ae41314f796ebb7215fd28febb45f9aac72f2b04cb74b5071dc/platformdirs-4.11.4.tar.gz"
    sha256 "f3373be828247211d0febabea97e238c3dfde8a60b3c90c32756fb52cb21556d"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "texastoast" do
    url "https://files.pythonhosted.org/packages/22/fb/6dc531af6bfb9c6767402f05304b820abfdd7b1d0f4208aa7668e65ee2ac/texastoast-0.10.0.tar.gz"
    sha256 "8125c67e6885e22ee1e4224520d6029bc06ea1878e614a8bc97a44903c0e5570"
  end

  resource "textual" do
    url "https://files.pythonhosted.org/packages/00/21/39a76b01bd5eea82a04baaca7580e105d8c59450df03998345bb2cfb307b/textual-8.2.8.tar.gz"
    sha256 "3f106a9fbc73e39dd266c9712432087de78a6d644084c7c241d6a25c3169115b"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  resource "uc-micro-py" do
    url "https://files.pythonhosted.org/packages/78/67/9a363818028526e2d4579334460df777115bdec1bb77c08f9db88f6389f2/uc_micro_py-2.0.0.tar.gz"
    sha256 "c53691e495c8db60e16ffc4861a35469b0ba0821fe409a8a7a0a71864d33a811"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # --list enumerates the magmacrunch.games entry point group, so this
    # exercises the seam the arcade is built on rather than just proving the
    # module imports: a cabinet that failed to install shows up as a missing
    # line here.
    output = shell_output("#{bin}/magmacrunch --list")
    assert_match "george-boole", output
    assert_match "thld", output
    assert_match "moonlight-drift", output
  end
end
