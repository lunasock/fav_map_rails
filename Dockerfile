# Node.jsダウンロード用ビルドステージ
FROM ruby:2.7.1 AS nodejs

# 作業用（working）ディレクトリを指定
WORKDIR /tmp

# Node.jsのダウンロード
RUN curl -LO https://nodejs.org/dist/v12.18.4/node-v12.18.4-linux-x64.tar.xz
RUN tar xvf node-v12.18.4-linux-x64.tar.xz
RUN mv node-v12.18.4-linux-x64 node

# railsのインストール
FROM ruby:2.7.1

# node.jsをコピー
COPY --from=nodejs /tmp/node /opt/node
ENV PATH /opt/node/bin:$PATH

# yarnのインストール
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
ENV PATH /root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:$PATH

# ruby2.7以上でエラーにならないよう、bundlerを最新までアップデート
RUN gem install bundler

# 作業用（working）ディレクトリを指定
WORKDIR /app

RUN bundle config set path vendor/bundle

# 実行時、コマンド指定がない場合に実行されるコマンド
CMD ["bash"]