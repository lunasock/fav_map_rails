# Node.jsダウンロード用ビルドステージ
FROM ruby:2.7.1 AS nodejs

WORKDIR /tmp

# Node.jsのダウンロード
RUN curl -LO https://nodejs.org/dist/v12.14.1/node-v12.14.1-linux-x64.tar.xz
RUN tar xvf node-v12.14.1-linux-x64.tar.xz
RUN mv node-v12.14.1-linux-x64 node

# railsのインストール
FROM ruby:2.7.1

# node.jsをコピー
COPY --from=nodejs /tmp/node /opt/node
ENV PATH /opt/node/bin:$PATH

# 開発環境用の追加に伴い削除
# ーーーーーーーーーーーーーーーーーーーーーーーーーーー
# # アプリケーション起動用のユーザーを追加
# RUN useradd -m -u 1000 rails
# RUN mkdir /app && chown rails /app
# USER rails
# ーーーーーーーーーーーーーーーーーーーーーーーーーーー

# yarnのインストール
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
# 開発環境用の追加に伴い削除
# ENV PATH /home/rails/.yarn/bin:/home/rails/.config/yarn/global/node_modules/.bin:$PATH
# 開発環境用
ENV PATH /root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:$PATH

# ruby2.7以上でエラーにならないよう、bundlerを最新までアップデート
RUN gem install bundler

WORKDIR /app

# 開発環境用の追加に伴い削除
# ーーーーーーーーーーーーーーーーーーーーーーーーーーー
# # Dockerのビルドステップキャッシュを利用するため、先にGemfileを転送し、bundle installする
# COPY --chown=rails Gemfile Gemfile.lock package.json yarn.lock /app/

# RUN bundle install
# RUN yarn install

# COPY --chown=rails . /app

# RUN bin/rails assets:precompile

# VOLUME /app/public

# # 実行時、コマンド指定がない場合に実行されるコマンド
# CMD ["bin/rails", "s", "-b", "0.0.0.0"]
# ーーーーーーーーーーーーーーーーーーーーーーーーーーー

# 開発環境用
# ーーーーーーーーーーーーーーーーーーーーーーーーーーー
RUN bundle config set path vendor/bundle

# 実行時、コマンド指定がない場合に実行されるコマンド
CMD ["bash"]
# ーーーーーーーーーーーーーーーーーーーーーーーーーーー