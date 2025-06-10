# poetry-image

Poetryのインストール済み環境を提供する軽量なDockerイメージです。  
PythonプロジェクトのビルドやCI/CDパイプラインで、Poetryのセットアップを簡単・高速に行いたい場合に便利です。

---

## 特長

- **Poetryプリインストール**  
  指定バージョンのPoetryがすでにセットアップされています。
- **マルチステージビルド対応**  
  必要なPoetry関連ファイルだけを他のイメージに取り込めます。
- **ビルド時間短縮**  
  毎回Poetryをインストールする手間が省けます。

---

## 使い方

あなたのDockerfileに、以下のように記載してください。

```Dockerfile
COPY --from=goegoe0212/poetry-image:latest /root/.local /root/.local
COPY --from=goegoe0212/poetry-image:latest /root/.config /root/.config
```

- `goegoe0212/poetry-image:latest` は任意のバージョンタグ（例: `goegoe0212/poetry-image:2.1.3`）にも置き換え可能です。
- `/root/.local` および `/root/.config` 配下にPoetry本体と設定ファイルが含まれています。

---

## 利用例
```Dockerfile
FROM python:3.13-slim

# Poetry環境をコピー
COPY --from=goegoe0212/poetry-image:latest /root/.local /root/.local
COPY --from=goegoe0212/poetry-image:latest /root/.config /root/.config

# Poetryのパスを追加
ENV PATH="/root/.local/bin:${PATH}"

# 以降、poetryコマンドが利用可能
RUN poetry --version
```

---

## 推奨事項

- プロジェクトで必要なPoetryバージョンがある場合は、`latest` ではなくバージョンタグを指定してください。
- CI/CDや開発環境の一貫性維持に役立ちます。

---

このイメージを使うことで、Poetryのセットアップ作業を大幅に省略でき、開発やデプロイの効率化が図れます。