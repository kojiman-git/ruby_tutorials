# ベースイメージとしてRubyを使用
FROM ruby:3.2

# 作業ディレクトリの設定
WORKDIR /usr/src/app

# プロジェクトファイルをコンテナにコピー
COPY . /usr/src/app

# コンテナ起動時に何も指定しない場合、デフォルトのシェルを開く
CMD ["bash"]


