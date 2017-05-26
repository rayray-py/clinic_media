# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Seed Lists
#   User
#   Prefecture

User.create(email: "info@cliniclist.jp", password: "hogehoge", name: "クリニックリスト運営", status: 2)

prefectures = [
  [1,'北海道','hokkaido',0,'2017-02-07 11:55:56','2017-02-07 12:14:11'],
  [2,'青森県','aomori',0,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [3,'岩手県','iwate',0,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [4,'宮城県','miyagi',0,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [5,'秋田県','akita',0,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [6,'山形県','yamagata',0,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [7,'福島県','fukushima',0,'2017-02-07 11:55:56','2017-02-07 12:15:00'],
  [8,'茨城県','ibaraki',1,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [9,'栃木県','tochigi',1,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [10,'群馬県','gumma',1,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [11,'埼玉県','saitama',1,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [12,'千葉県','chiba',1,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [13,'東京都','tokyoto',1,'2017-02-07 11:55:56','2017-02-07 12:14:11'],
  [14,'神奈川県','kanagawa',1,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [15,'新潟県','nigata',2,'2017-02-07 11:55:56','2017-02-07 12:14:11'],
  [16,'富山県','toyama',2,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [17,'石川県','ishikawa',2,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [18,'福井県','fukui',2,'2017-02-07 11:55:56','2017-02-07 12:15:00'],
  [19,'山梨県','yamanashi',2,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [20,'長野県','nagano',2,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [21,'岐阜県','gifu',3,'2017-02-07 11:55:56','2017-02-07 12:15:00'],
  [22,'静岡県','shizuoka',3,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [23,'愛知県','aichi',3,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [24,'三重県','mie',3,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [25,'滋賀県','shiga',4,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [26,'京都府','kyoto',4,'2017-02-07 11:55:56','2017-02-07 12:14:11'],
  [27,'大阪府','osaka',4,'2017-02-07 11:55:56','2017-02-07 12:14:11'],
  [28,'兵庫県','hyogo',4,'2017-02-07 11:55:56','2017-02-07 12:14:11'],
  [29,'奈良県','nara',4,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [30,'和歌山県','wakayama',4,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [31,'鳥取県','tottori',5,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [32,'島根県','shimane',5,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [33,'岡山県','okayama',5,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [34,'広島県','hiroshima',5,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [35,'山口県','yamaguchi',5,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [36,'徳島県','tokushima',6,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [37,'香川県','kagawa',6,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [38,'愛媛県','ehime',6,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [39,'高知県','kochi',6,'2017-02-07 11:55:56','2017-02-07 12:14:11'],
  [40,'福岡県','fukuoka',7,'2017-02-07 11:55:56','2017-02-07 12:15:00'],
  [41,'佐賀県','saga',7,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [42,'長崎県','nagasaki',7,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [43,'熊本県','kumamoto',7,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [44,'大分県','oita',7,'2017-02-07 11:55:56','2017-02-07 12:14:11'],
  [45,'宮崎県','miyazaki',7,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [46,'鹿児島県','kagoshima',7,'2017-02-07 11:55:56','2017-02-07 12:12:47'],
  [47,'沖縄県','okinawa',7,'2017-02-07 11:55:56','2017-02-07 12:12:47']
]
prefectures.each do |prefecture|
  Prefecture.where(id: prefecture[0], name: prefecture[1], kana: prefecture[2], region: prefecture[3], created_at: prefecture[4], updated_at: prefecture[5]).first_or_create
end

face, skin, body, sensitive = Category.create([{name: "顔"}, {name: "肌"}, {name: "体"}, {name: "デリケートゾーン"}])
eye, nose, face_line, face_else = face.children.create([{name: "目"}, {name: "鼻"}, {name: "顔の輪郭"}, {name: "その他顔の施術"}])
eye.children.create([{name: "埋没法"}, {name: "二重切開"}, {name: "眼瞼下垂"}, {name: "目頭切開"}, {name: "目尻切開"}, {name: "涙袋整形"}, {name: "まぶたの脂肪吸引"}, {name: "目の下のクマ"}, {name: "目のたるみ"}, {name: "その他目の整形"}])
nose.children.create([{name: "隆鼻術"}, {name: "鼻中隔延長"}, {name: "鼻尖縮小"}, {name: "小鼻縮小"}, {name: "その他鼻の整形"}])
face_line.children.create([{name: "エラ削り"}, {name: "エラボトックス"}, {name: "頬骨削り"}, {name: "あご整形"}, {name: "小顔注射"}, {name: "その他輪郭整形"}])
face_else.children.create([{name: "唇整形"}, {name: "アデノイド顔貌"}])

siso, sita, skin_else = skin.children.create([{name: "しみ・そばかす"}, {name: "しわ・たるみ"}, {name: "その他肌の施術"}])
siso.children.create([{name: "フォトフェイシャル"}, {name: "ケミカルピーリング"}])
sita.children.create(name: "サーマクール")
skin_else.children.create([{name: "ほくろ除去"}, {name: "タトゥー除去"}])

ho, si, body_else = body.children.create([{name: "豊胸"}, {name: "脂肪"}, {name: "その他体の施術"}])
ho.children.create(name: "ヒアルロン酸注入")
si.children.create([{name: "脂肪吸引"}, {name: "脂肪溶解注射"}])
body_else.children.create([{name: "陥没乳首"}])

ma, fe = sensitive.children.create([{name: "男性のデリケートゾーン"}, {name: "女性のデリケートゾーン"}])
ma.children.create([{name: "包茎手術"}, {name: "ED治療"}, {name: "ペニス増大"}])
fe.children.create([{name: "クリトリス包茎"}, {name: "小陰唇縮小"}, {name: "すそわきが"}, {name: "不感症"}, {name: "処女膜再生"}])
