default[:altcointip][:coins] = {
  "bitcoin" => {
    :enabled => false,
    :name => "bitcoin",
    :version => "0.8.4",
    :file_name => "bitcoin-0.8.4-linux.tar.gz",
    :file_source_url => "http://sourceforge.net/projects/bitcoin/files/Bitcoin/bitcoin-0.8.4/bitcoin-0.8.4-linux.tar.gz/download",
    :file_sha256sum => "cd746a4ab3b656e41e3f09722a7336fb978eb726bae55591314f1dad60759ecc",
    :file_extract_cmd => "tar --strip-components=1 -zxf",
    :daemon_path => "bin/64/bitcoind",
    :rpcpassword => "bitcoin123",
    :rpcport => "8332"
  },
  "litecoin" => {
    :enabled => false,
    :name => "litecoin",
    :version => "0.8.4.1",
    :file_name => "litecoin-0.8.4.1-linux.tar.xz",
    :file_source_url => "https://litecoin.org/downloads/linux/litecoin-0.8.4.1-linux.tar.xz",
    :file_sha256sum => "f7ba4ad33ba73912a3e097bad6e42452788f69c3ca0af6d57a20dfddb73df2d3",
    :file_extract_cmd => "tar --strip-components=1 -Jxf",
    :daemon_path => "bin/64/litecoind",
    :rpcpassword => "litecoin123",
    :rpcport => "9332"
  },
  "ppcoin" => {
    :enabled => false,
    :name => "ppcoin",
    :version => "0.3.0",
    :file_name => "ppcoin-0.3.0-linux.tar.gz",
    :file_source_url => "http://sourceforge.net/projects/ppcoin/files/0.3.0/ppcoin-0.3.0-linux.tar.gz/download",
    :file_sha256sum => "919bb1c60eeebdd173ddcd4c83264f745bbf2af29410ded062f6c6bfce44f694",
    :file_extract_cmd => "tar --strip-components=1 -zxf",
    :daemon_path => "bin/64/ppcoind",
    :rpcpassword => "ppcoin123",
    :rpcport => "9902"
  },
  "namecoin" => {
    :enabled => false,
    :name => "namecoin",
    :version => "0.3.50",
    :file_name => "namecoin_linux64.tgz",
    :file_source_url => "http://dot-bit.org/files/namecoin_linux64.tgz",
    :file_sha256sum => "2ecd4a17d1c301da3dc60e60af189690a8e7abb1b83fdabbfb4c2951e25bc2ec",
    :file_extract_cmd => "tar -zxf",
    :daemon_path => "namecoind",
    :rpcpassword => "namecoin123",
    :rpcport => "8336"
  },
  "primecoin" => {
    :enabled => false,
    :name => "primecoin",
    :version => "0.1.1",
    :file_name => "primecoin-0.1.1-linux.tar.gz",
    :file_source_url => "http://sourceforge.net/projects/primecoin/files/0.1.1/primecoin-0.1.1-linux.tar.gz/download",
    :file_sha256sum => "e9c2a34ddf6806924139ac5a1294f0e24f7480604773faaf79df58dc394f1594",
    :file_extract_cmd => "tar --strip-components=1 -zxf",
    :daemon_path => "bin/64/primecoind",
    :rpcpassword => "primecoin123",
    :rpcport => "8772"
  }
}
