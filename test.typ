#import "style.typ": *
#import "add_style.typ": *
#set text(lang: "ja")
//拡張環境
#import"@preview/equate:0.1.0": equate//複数行の数式を個別に番号付け
#show: equate
//==================================================
//                    DOCUMENT
//==================================================
#show: maketitle.with(
  title: [タイトル],
  authors: (
    (
      name: "author 1",
      email: "",
      affiliation: "",
    ),
    (
      name: "author 2",
      email: "",
      affiliation: "",
    ),
  ),
  date:"on",
  tableofcontents:"on",
  abstract: "ここに概要を記述します．概要を記述しない場合は，\" \"の中に何も記述しなければ良いです．このときは，Abstractの文字も自動的に消えます．日付の表示を消したい場合には，date:\"off\"などと記述すれば，消えます．同様にして，目次のon, offも，tableofcontentsによって行うことができます．"
)




= セクション名

セクションを記述するには，=を使用します．
```typst
= セクション名
```
細かいセクションにするには，
```typst
== サブセクション名
```
とすれば，深い階層のセクションを作成できます．\ \

また，次のように\$マークを用いることで，数式を記述することもできます．
```typst
$ y = sin(x) $
```
上の数式は，
$ y = sin(x) $
のように表示されます．
このように，ディスプレイ数式を用いる場合には\$マーク間の数式にスペースを入れる必要があります．
文章中に表示させたい場合は，
```typst
$y = sin(x)$
```
のようにスペースを削除すれば，$y = sin(x)$のようにできます．


== サブセクション

深い階層に行ったとき，番号付けは自動的に行われます．
また，画像は@water のように参照することができ，画像の記述は，
```typst
#figure(
  image("figure/water.jpg", width: 50%),
  caption: [figure title],
) <water>
```
のようにすれば，
#figure(
  image("figure/water.jpg", width: 50%),
  caption: [figure title],
) <water>
と表示できます．
同様にして，tableについても
```typst
#figure(
  table(
    columns: 4,
    [t], [1], [2], [3],
    [y], [0.3s], [0.4s], [0.8s],
  ),
  caption: [Timing results],
)
```
のように記述すれば，
#figure(
  table(
    columns: 4,
    [t], [1], [2], [3],
    [y], [0.3s], [0.4s], [0.8s],
  ),
  caption: [Timing results],
)
となります．\

また，参考文献は，bibtexを使用できます．
この場合，キー「tsukahara2023」に対し，
```typst
#cite(<tsukahara2023>)
```

と記述すれば，参考文献#cite(<tsukahara2023>)を参照できます．

= add_style環境

add_style環境では，上記の基本的な機能に加えて，様々な拡張機能を提供します．

== 定義環境

定義環境は，次のように記述します．
```typst
#teigi("平均情報量の定義", [
  平均情報量は，以下で定義する．
  $ H(X) &= E[-log_2 p (x)]\
    &= sum_x -p(x) log_2 p(x)
  $
])
```
これによって，次のように表示されます．
#teigi("平均情報量の定義", [
  平均情報量は，以下で定義する．
  $ H(X) &= E[-log_2 p (x)]\
    &= sum_x -p(x) log_2 p(x)
  $
])

== 定理環境

定理環境も，定義と同様にして記述します．
```typst
#teiri("同時エントロピーの可換性", [
  同時エントロピーは，一般に以下の可換性がある．
  $ H(X, Y) = H(Y, X) $
])
```
これによって，次のように表示されます．
#teiri("同時エントロピーの可換性", [
  同時エントロピーは，一般に以下の可換性がある．
  $ H(X, Y) = H(Y, X) $
])

== 証明環境

証明環境は，次のように記述します．
```typst
#shoumei[
  同時確率分布の可換性 $p(x, y)=p(y, x)$ を利用すれば，
  $ H(X, Y) &= -sum_x sum_y p(x,y) log_2 p(x,y)\
  &= -sum_x sum_y p(y,x) log_2 p(y,x)\
  &= H(Y, X)
  $
]
```
これによって，次のように表示されます．
#shoumei[
  同時確率分布の可換性 $p(x, y)=p(y, x)$ を利用すれば，
  $ H(X, Y) &= -sum_x sum_y p(x,y) log_2 p(x,y)\
  &= -sum_x sum_y p(y,x) log_2 p(y,x)\
  &= H(Y, X)
  $
]

== 枠組環境

単なる灰色背景の枠組みは，以下のように記述します．
```typst
#graybox[
  同時エントロピーは，一般に以下の非負性を持つ．
  $ H(X, Y) >= 0 $
]
```
これによって，次のように表示されます．
#graybox[
  同時エントロピーは，一般に以下の非負性を持つ．
  $ H(X, Y) >= 0 $
]



#bibliography("refs.bib")
