# Setup

手元で環境を作る方法
```
docker-compose build
docker-compose run --rm bash
bundle install
bundle exec rails db:setup
```

開発環境を動かす方法
```
docker-compose up
```
上記のあと、`localhost:3000` にブラウザからアクセスする。
