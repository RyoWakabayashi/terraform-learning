# Docker 基本

## 初期化

terraform の初期化処理

```bash
terraform init
```

実行結果

```bash
Initializing the backend...
Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "~> 3.0.1"...
- Installing kreuzwerker/docker v3.0.2...
- Installed kreuzwerker/docker v3.0.2 (self-signed, key ID BD080C4571C6104C)
Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html
Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

`required_providers` で指定したプロバイダが `.terraform` ディレクトリ配下にインストールされる

`version = "~> 3.0.1"` というようにバージョンを指定した場合、
`3.0.1` 以上 `4.0.0` 未満のバージョンのうち最新のものがインストールされる

`.terraform.lock.hcl` が存在しない場合は作成され、インストールされたバージョンが記録される

`.terraform.lock.hcl` が存在する場合、その中で指定されたバージョンがインストールされる

## コンテナ起動

リソースを作成する

```bash
terraform apply
```

プラン表示

```bash
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "tutorial"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8000
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "nginx:latest"
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
```

`yes` と入力するとリソースが作成される

```bash
docker_image.nginx: Creating...
docker_image.nginx: Creation complete after 9s [id=sha256:195245f0c79279e8b8e012efa02c91dad4cf7d0e44c0f4382fea68cd93088e6cnginx:latest]
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=b0b3cb9fee6ed41ba46490de1327c9a4b8d9d111b67c738b2a5e2bf49172c9b5]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

`terraform.tfstate` に状態が保存される

## 状態確認

リソースの状態を確認する

```bash
terraform show
```

## コンテナ変更

`docker_container.nginx` の `name` を変更してから再度 `terraform apply` を実行する

変更差分がプランとして表示され、実行すると変更が適用される

`terraform.tfstate` に変更後の状態が保存され、 `terraform.tfstate.backup` に変更前の状態が保存される

## コンテナ削除

リソースを削除する

```bash
terraform destroy
```

## 部分的なリソースの作成

`--target` オプションで特定のリソースのみ作成する

```bash
terraform apply --target=docker_image.nginx
```

## 部分的なリソースの削除

`--target` オプションで特定のリソースのみ削除する

```bash
terraform destroy --target=docker_image.nginx
```