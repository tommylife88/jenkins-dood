# Dockerで動くJenkinsから他のコンテナを操作する（Docker outside of Docker）

Dockerコンテナ内で動くJenkinsから、ホスト側のDockerを使って他のDockerコンテナを動かす、いわゆるDocker outside of Docker(DooD)を構築する。


## 前提

* JenkinsもDockerコンテナで動く
* Jenkinsコンテナのユーザーはjenkins（root以外）とする
* 各Dockerコンテナは同一ホスト内で動く
* 複数のDockerコンテナが動くためdocker-composeを利用する

## .env

``DOCKER_GROUP_ID``をホストのdockerグループIDにする。

```
chmod +x set_env.sh
./set_env.sh
```

## 起動

```
docker-compose up -d
```
