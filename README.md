# terraform-learning

Terraform 学習

## 環境構築

各種ツールのバージョン管理に asdf を使用する

プラグインのインストール

```bash
awk '{system("asdf plugin-add " $1)}' .tool-versions
```

terraform の指定バージョンをインストール

```bash
asdf install
```

## プロバイダー

各種プロバイダーを使用してリソースを管理する

### Docker

Docker プロバイダーを使用してコンテナを管理することができる