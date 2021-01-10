# gatsby docker-compose

## 使い方

### docker-compose 立ち上げ

```sh
docker-compose up -d --build
docker-compose exec gatsby /bin/sh
```

### サイト作成(例：blog）

```sh
cd /apps/sites
sudo /apps/docker/gatsby_new_wrapper.sh blog https://github.com/andykenward/gatsby-starter-default-typescript
cd blog
gatsby develop --host 0.0.0.0
```
> ブラウザで http://localhost:8000 へアクセス
> ctrl+c で終了

### ２回目以降

```sh
docker-compose -f docker-compose.yml -f docker/docker-compose-gatsby-develop-blog.yml up -d
```
もしくは
```sh
cp docker/docker-compose-gatsby-develop-blog.yml docker-compose.override.yml
docker-compose up -d
```
> ブラウザで http://localhost:8000 へアクセス

### ログを見る

```sh
docker-compose logs [-f]
```

### 終了する

```sh
docker-compose down
```

