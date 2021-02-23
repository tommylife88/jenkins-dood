# Dockerで動くJenkinsから他のコンテナを操作する（Docker outside of Docker）

Dockerコンテナ内で動くJenkinsから、ホスト側のDockerを使って他のDockerコンテナを動かす、いわゆるDocker outside of Docker(DooD)を構築する。

## 前提

* ホストにDockerインストール済みで正常に動作している状態
* JenkinsもDockerコンテナで動く
* Jenkinsコンテナのユーザーはjenkins（root以外）とする
* 各Dockerコンテナは同一ホスト内で動く

## .env

`DOCKER_GROUP_ID`をホストのdockerグループIDにする。

```shell
chmod +x set_env.sh
./set_env.sh
```

## 起動

```shell
docker-compose up -d
```
