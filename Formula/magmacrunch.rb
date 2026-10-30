class Magmacrunch < Formula
  include Language::Python::Virtualenv

  desc "Terminal arcade - a card grid of every installed cabinet"
  homepage "https://github.com/magmacrunch-media/magmacrunch"
  url "https://files.pythonhosted.org/packages/b3/b9/77fead1c28d9afd82790b01e1b43c3b576ad325fea516ea17ca9f10357cd/magmacrunch-0.18.0.tar.gz"
  sha256 "fccbfdbb57c3f9ae09054c1a036d9cc4f1f1ede0f93b79eb11f8a0d361d2660a"
  # Not an open-source licence. The engine underneath (texastoast) is
  # Apache-2.0; the arcade and the games it seats are not, and a package cannot
  # be more permissive than what it depends on.
  license "PolyForm-Noncommercial-1.0.0"

  bottle do
    root_url "https://github.com/magmacrunch-media/homebrew-tap/releases/download/magmacrunch-0.18.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "87e7b0be86a6300faa3637bb846e0f05b8148e27da7050ea99da189f6d78382f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9e602210d4bdd57d78d068f5f782f6ad607156e53df5ee8b251e111e8adab69c"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "dcee90ba5bcd54fab426512205b3b2cd2823ed735125f3b04998c79c45ac940b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "dbe1981a9059dba34ca77c3a257c5fbe054be9a555583f948d704d43265ce194"
  end

  depends_on "python@3.12"

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/45/98/7a1a5f31fd5c7ba93e963b168e244b8e3dd705b3d2a718e3c3307583bf57/linkify_it_py-2.2.0.tar.gz"
    sha256 "907acd2d17ac1fbb9ddb62c8957ccbd6158cac602231a15c3b0cd1e215f03cee"
  end

  resource "magmacrunch-backgammon" do
    url "https://files.pythonhosted.org/packages/0d/46/36e5570f6de39cb75ea15c499d279c89f317291411ae23d38675691de566/magmacrunch_backgammon-0.1.2.tar.gz"
    sha256 "ea9b34ad2966f899d265b2789a5fada62046b6daba119f5f5afb3685b3816930"
  end

  resource "magmacrunch-caldera" do
    url "https://files.pythonhosted.org/packages/07/e8/c8df1a16669f83c504bfa3e7faed96f97201f45dcc118618b90bfe0f6169/magmacrunch_caldera-0.1.2.tar.gz"
    sha256 "be2386bec3b52a092d2c1ca81bef2e6aedf7059bc83bb42f563dbd0db63dc8de"
  end

  resource "magmacrunch-checkers" do
    url "https://files.pythonhosted.org/packages/8a/81/a1e9ce0dafcaad6d25f4f7ee4a0a94ff49f1d946d7267c7bd21231411466/magmacrunch_checkers-0.1.2.tar.gz"
    sha256 "a44d8cd937807c2963eab66e89c5576b5c8e7cb13cb0db6172359234f43a99c3"
  end

  resource "magmacrunch-chess" do
    url "https://files.pythonhosted.org/packages/cc/bd/85d48baf948d53a0884605d7a129300fdd5f904e79d575d4045e2bc4d5e4/magmacrunch_chess-0.1.3.tar.gz"
    sha256 "feb939714b62479375b834c48bec26124d627af18bd8607ebbe61f58eb406980"
  end

  resource "magmacrunch-chinese-checkers" do
    url "https://files.pythonhosted.org/packages/01/35/eb9eaa4d389ec09004f6e48587a4b6cf6dca649fea4fb84613911012bfc2/magmacrunch_chinese_checkers-0.1.2.tar.gz"
    sha256 "0c04d8e3d3f4a3f51e8e753c9fca0638c21077309478726dac4649d8b3e5e950"
  end

  resource "magmacrunch-cribbage" do
    url "https://files.pythonhosted.org/packages/a4/0e/b34c786bf4273f852d46ae58b8733d9431ebc9e2f1cca416637ab3639d8c/magmacrunch_cribbage-0.1.2.tar.gz"
    sha256 "8ee0ce1ec953186101015f359c89f6365dbee534a7deee717bb0d493ae83bb26"
  end

  resource "magmacrunch-fifteen-puzzle" do
    url "https://files.pythonhosted.org/packages/5e/b4/7a60606fba5e654f75ec049fc99cd8fc0028b4b6b799eb9f2a5fb95f530d/magmacrunch_fifteen_puzzle-0.1.2.tar.gz"
    sha256 "188e2b7273b4a483eeecb1dadc2554e82f6fc73c2729accdd2c49f0aefdffba6"
  end

  resource "magmacrunch-george-boole" do
    url "https://files.pythonhosted.org/packages/86/5e/4c8789cbddb0654de43d6a5ff6950886e969dbcecec494ffc0169a8cd378/magmacrunch_george_boole-0.5.5.tar.gz"
    sha256 "9e986be5768f9dd038c2f21d2e797b0510d43813d78b273dba5daa3c47860ea9"
  end

  resource "magmacrunch-jhc" do
    url "https://files.pythonhosted.org/packages/d1/ee/cd571bf238d2db426672ae09e6dbb4d1b77dd5cc0f03da5c4025b525dc1e/magmacrunch_jhc-0.1.2.tar.gz"
    sha256 "93060f429c4b89a30950ae4b4a2fbcfc6f65c0ae272a45043eb65177b792980f"
  end

  resource "magmacrunch-moonlight-drift" do
    url "https://files.pythonhosted.org/packages/35/86/f81909906ca7dde68aecc0d44184e01fa5acf007b3d4c646bf32b4f2e871/magmacrunch_moonlight_drift-0.5.4.tar.gz"
    sha256 "d282e8548274a4d871d7d0364bc4bf0bd3f0888aa2161efd7e65d326bdcb2f8b"
  end

  resource "magmacrunch-nelikko" do
    url "https://files.pythonhosted.org/packages/03/d2/30aa66304081f082c9e09490a67d0cb8ff84b967c452a7e4ce4fff2acf34/magmacrunch_nelikko-0.1.2.tar.gz"
    sha256 "52a342b4b33507083f26634117791a7f354b61de17ea2c107502448ad04a0520"
  end

  resource "magmacrunch-roderick-tron" do
    url "https://files.pythonhosted.org/packages/b4/b5/35c816b60425b308815140c8b0d46e6fc6d5d0f54ed30d182415a2b66b42/magmacrunch_roderick_tron-0.1.1.tar.gz"
    sha256 "eda5d2e859f0040a5e66b8e27f88fcc277168adb2db3dbf7328b44090f65dc80"
  end

  resource "magmacrunch-scandinavian-stud" do
    url "https://files.pythonhosted.org/packages/f0/8f/16d19c7f5ec1f2f428209639f2cb9dfecc4cb553b74047c86cbd48d24850/magmacrunch_scandinavian_stud-0.1.1.tar.gz"
    sha256 "614a1cdd1131574732454a6468ceb355550aec455b2dac5881aa5fdc0ce91959"
  end

  resource "magmacrunch-solitaire" do
    url "https://files.pythonhosted.org/packages/22/e0/d57330db56265be71242e76e5b2fc8901b84e14c87b9a019460779f5a385/magmacrunch_solitaire-0.1.1.tar.gz"
    sha256 "152f5a0475205eeedfdcf40646d8d857fdf4992b3552bc25c147d97902fdde08"
  end

  resource "magmacrunch-tarot" do
    url "https://files.pythonhosted.org/packages/55/87/4d92cfc5db9872fe419a6c13a50663b6c71f36fef1a0d860f07626ba21aa/magmacrunch_tarot-0.1.2.tar.gz"
    sha256 "82bb54ce9c481ef839c2200ede80146d6c574863a6e3fc50ba867edd33d8c86a"
  end

  resource "magmacrunch-thld" do
    url "https://files.pythonhosted.org/packages/59/69/b813e307a6bc3a6a48b6c3a040bdbfb869ca1ea5163a8aacee9b1c2fa672/magmacrunch_thld-0.5.4.tar.gz"
    sha256 "ac6b68bb1e5eb1d2902c0df6c41f7ae7bc8d758480d69939d6c3a2e5fd2a5f81"
  end

  resource "magmacrunch-threes" do
    url "https://files.pythonhosted.org/packages/27/32/a2ef044ed92ea7d4e683fa1911c9816e7edcbb9477de364c0b9f4f3a4034/magmacrunch_threes-0.2.2.tar.gz"
    sha256 "d3ee5fe9e430f31c6e4f0319c27a12d8dab09973d631fe2275c47028efe10d2a"
  end

  resource "magmacrunch-two-to-the-n" do
    url "https://files.pythonhosted.org/packages/dd/d1/bd0f9178ca8e512a216bd578f89373be32b4a29028e0bb7fcbe99d298d37/magmacrunch_two_to_the_n-0.1.2.tar.gz"
    sha256 "02c98883d0b2f7e0f159ce3872e014fdd980e8571f06aa7e6b0ac08071dc7f05"
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
    url "https://files.pythonhosted.org/packages/35/e9/bf409046a91b6a9ca652e9b0ac3c39481674f6774e23e58b52315516099a/platformdirs-4.13.7.tar.gz"
    sha256 "f7f351c027d6632c30471124e1fdb6ac0fef9ccc5cbac1b34cb333431b1fc3e1"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "textual" do
    url "https://files.pythonhosted.org/packages/00/21/39a76b01bd5eea82a04baaca7580e105d8c59450df03998345bb2cfb307b/textual-8.2.8.tar.gz"
    sha256 "3f106a9fbc73e39dd266c9712432087de78a6d644084c7c241d6a25c3169115b"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
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
