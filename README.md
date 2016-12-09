#ChatSpaceのDB設計


##必要なテーブルとカラム

1. users テーブル

    column      type        restriction

     name       string      null, unique
     email      string      null, unique
     password   string      null
     group_id   integer

2. messages テーブル

    column      type        restriction

     body       text        null
     image      string
     group_id   integer     null
     user_id    integer     null


3. groups テーブル

    column      type        restriction

    groupname   string      null, unique       index

