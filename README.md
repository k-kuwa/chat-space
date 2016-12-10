#ChatSpaceのDB設計


##必要なテーブルとカラム

1. users テーブル

|column|type|restriction||
|name|string|null false, unique true|index|
|----|------|-------------||
|email|string|null false, unique true||
|------|------|------------||
|password|string|null false||
|------|------|----------||

####Association
-user has_many :messages
-user has_many :group_users


2. messages テーブル

|column|type|restriction|
|------|-----|----------|
|body|text|null false|
|------|-----|----------|
|image|string | |
|------|------|--------|
|group_id |integer|null false|
|-------|------|-------|
|user_id|integer|null false|

####Association
messages belongs_to :user
messages belongs_to :group


3. groups テーブル

|column|type|restriction|
|------|-----|----------|
|name|string|null false, unique true|
|---------|-------|-----------|

####Association
-group has_many :messages
-group has_many :group_users


4. group_users テーブル

|column|type|restriction|
|------|-----|----------|
|user_id|integer|null false|
|---------|-------|-----------|
|group_id|integer|null false|

####Association
-group_user belongs_to :user
-group_user belongs_to :group








