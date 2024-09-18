# Docker 変数

外部変数を使用する

`variables` ブロックを使用して外部変数を定義する

## 初期化

```bash
terraform init
```

## コンテナ起動

```bash
terraform apply
```

変数を指定しない場合、以下のように入力を求められる

```bash
var.image_tag
  The tag of the image

  Enter a value:
```

`var.image_tag` に値を入力するとリソースが作成される

`--var` オプションで変数を指定することもできる

```bash
terraform apply --var 'image_tag=latest'
```

`.tfvars.sample` ファイルをコピーして `.tfvars` ファイルを作成し、変数を記述することもできる

`--var-file` オプションで変数ファイルを指定する

```bash
terraform apply --var-file=.tfvars
```