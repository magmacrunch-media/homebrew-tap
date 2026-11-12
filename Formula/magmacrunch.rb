class Magmacrunch < Formula
  include Language::Python::Virtualenv

  desc "Terminal arcade - a card grid of every installed cabinet"
  homepage "https://github.com/magmacrunch-media/magmacrunch"
  url "https://files.pythonhosted.org/packages/f0/ea/01ccb80d8193abe2cec03c686e9428a0bdb82168aa9a33625a80e2b53291/magmacrunch-0.19.4.tar.gz"
  sha256 "2deacd33092712b65ed36c5f83eebc31259a94dca6de7edba627d234083eea88"
  # Not an open-source licence. The engine underneath (texastoast) is
  # Apache-2.0; the arcade and the games it seats are not, and a package cannot
  # be more permissive than what it depends on.
  license "PolyForm-Noncommercial-1.0.0"

  depends_on "python@3.12"

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/45/98/7a1a5f31fd5c7ba93e963b168e244b8e3dd705b3d2a718e3c3307583bf57/linkify_it_py-2.2.0.tar.gz"
    sha256 "907acd2d17ac1fbb9ddb62c8957ccbd6158cac602231a15c3b0cd1e215f03cee"
  end

  resource "magmacrunch-backgammon" do
    url "https://files.pythonhosted.org/packages/37/4e/2850f6f2bea779e3f2cdaad072360125dc4a2efbd2f651f4200dad9ec471/magmacrunch_backgammon-0.1.3.tar.gz"
    sha256 "46d4bddd52dbd40736c4eabfa7ab4eefc0b9dbaf979fc525c5cbf35adcdd9c8b"
  end

  resource "magmacrunch-caldera" do
    url "https://files.pythonhosted.org/packages/07/e8/c8df1a16669f83c504bfa3e7faed96f97201f45dcc118618b90bfe0f6169/magmacrunch_caldera-0.1.2.tar.gz"
    sha256 "be2386bec3b52a092d2c1ca81bef2e6aedf7059bc83bb42f563dbd0db63dc8de"
  end

  resource "magmacrunch-checkers" do
    url "https://files.pythonhosted.org/packages/c9/6d/50ed245da658d9bf0cb3ea52d10e0f040d984dce174d2ea5054427d06fc4/magmacrunch_checkers-0.1.3.tar.gz"
    sha256 "61c81cebcc3b576e7da6f9af8a701c7b830b2a2055594d03e03bc5c117ee3c03"
  end

  resource "magmacrunch-chess" do
    url "https://files.pythonhosted.org/packages/57/0c/339519e546650a523dcf179891a56ba3dff0fa08c1b6db568755df22adf4/magmacrunch_chess-0.1.4.tar.gz"
    sha256 "9aafab9bf9262417ba0f4c2bbd5e451cd8bc13a1a43242ae3245bb2a8265ac59"
  end

  resource "magmacrunch-chinese-checkers" do
    url "https://files.pythonhosted.org/packages/d5/ba/4319240f4b6affcad319abaff15ab23eddbb99f0617c55c359d6660e0073/magmacrunch_chinese_checkers-0.1.3.tar.gz"
    sha256 "adcb052ca5e6e9b178ac41704811055f1d5e43ac4af7bbd271652812b96eeefa"
  end

  resource "magmacrunch-cribbage" do
    url "https://files.pythonhosted.org/packages/77/42/c8ce9c8c5bd2d9dc2a39f32931d2f56840cc8ea9d64d53d445b2e1a8f38f/magmacrunch_cribbage-0.1.3.tar.gz"
    sha256 "8d70d568081071637e9fd56060d1ae10627bcbc4806ba1084af5ac1a18583ef1"
  end

  resource "magmacrunch-fifteen-puzzle" do
    url "https://files.pythonhosted.org/packages/ee/b5/4daca33bab1db3529f834ca8f35b9ccb46d1c62497416f128907c8f74d5f/magmacrunch_fifteen_puzzle-0.1.3.tar.gz"
    sha256 "efb702b632add90c97b5d116f3311a6bbd1c5f66d86a314b0d443ca09da22848"
  end

  resource "magmacrunch-george-boole" do
    url "https://files.pythonhosted.org/packages/af/75/78fb9dbd9621a8111ddb9e7b53bf88963a4f3926f03c88cbfc9986bc77f3/magmacrunch_george_boole-0.5.7.tar.gz"
    sha256 "0b16c3c38502e2f31b73ca6cf97650e2e8084e7b7e113cf9344dabaf035daf76"
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
    url "https://files.pythonhosted.org/packages/fa/f3/cc0eb0ac2e688f4c1099c9faaf4990038074f26fe9374d4edec51575ad10/magmacrunch_scandinavian_stud-0.1.2.tar.gz"
    sha256 "e5eeeaacc6beeba1fa52ceee49f7fe90c82ef88a8be1da5e365b15b6371136fb"
  end

  resource "magmacrunch-solitaire" do
    url "https://files.pythonhosted.org/packages/51/1e/3413d1ac4c2167ff4db55734e48f0b851d8433bd9a1a4f172dcd6d9ac7a1/magmacrunch_solitaire-0.1.2.tar.gz"
    sha256 "500560370272af783c5d060c2e3bcb2e59cf7bf461fd77ea3f78204c7b1c3808"
  end

  resource "magmacrunch-tarot" do
    url "https://files.pythonhosted.org/packages/a8/5e/41ad6caaa3ffcf66652a8af694a938d4217699c0ff93940a1c8e3e3dd5f4/magmacrunch_tarot-0.1.3.tar.gz"
    sha256 "8e13406bfa3c4c47654264371b5d1bb583c25c630d31b72f9ea9caca42454aee"
  end

  resource "magmacrunch-thld" do
    url "https://files.pythonhosted.org/packages/ff/5d/3e9557981885034456c5637a3ab685acaad71394921a78c4ea4c21d28b0e/magmacrunch_thld-0.5.5.tar.gz"
    sha256 "ee53865f90dcb04cd06f3576d219618ee2e5795f10927d81ca93df04e63270b1"
  end

  resource "magmacrunch-threes" do
    url "https://files.pythonhosted.org/packages/94/c9/bc196002090bf60d63aac52a837fb3d3e007d70817986df9fd84d1d61564/magmacrunch_threes-0.2.3.tar.gz"
    sha256 "a53c13b2a22ceadcee27259f6be6c8ae6ac7b77bf1a31a5a7fc9f5dc0b916725"
  end

  resource "magmacrunch-two-to-the-n" do
    url "https://files.pythonhosted.org/packages/8e/d3/770f0837c8d8b382259d8a649a82cd92926f773c86691a7fb46ff6ee64a7/magmacrunch_two_to_the_n-0.1.3.tar.gz"
    sha256 "ac188c1f796bffa045def6dfb4ceae50261bbf33f20e36104b03a2545cfecf70"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/16/fc/cee2c45553c9a9bf77d8b0c391560c556d7ed756b1f0bb35eb5d48db09ea/markdown_it_py-4.3.0.tar.gz"
    sha256 "91a58fa5b72c71a40cf7177250fd767480d7a2bb3ac426ccfb76fb90305fdaaa"
  end

  resource "mdit-py-plugins" do
    url "https://files.pythonhosted.org/packages/ad/a4/77a4e1be19fd9b08993c76d5e54979ac836b327754f1f5fecfed1b56cc67/mdit_py_plugins-0.7.0.tar.gz"
    sha256 "26d2179227aaf4d1dc7acffe7a738cbd15cade6b5a61cff0a2cbf9fed93efede"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/d7/9a/8475be631fb33ca1466915e70fd594c42a4e84b512db650eaa14f90fe75d/platformdirs-4.14.5.tar.gz"
    sha256 "32e9921db7385aa8169bee4fe9501923e5715ba9fb7ea3b9c69b0d8e0639f7a1"
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
