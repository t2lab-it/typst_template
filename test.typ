#import "style.typ": *
#import "add_style.typ": *
//拡張環境
#import"@preview/equate:0.1.0": equate//複数行の数式を個別に番号付け
#show: equate
//==================================================
//                    DOCUMENT
//==================================================
#show: jcls_init
#show: maketitle.with(
  title: [タイトル],
  authors: (
    (
      name: "author 1",
    ),
    (
      name: "author 2",
    ),
  ),
  date: true,
  tableofcontents: true,
  abstract: [ここに概要を記述します．概要を記述しない場合は，`[ ]`の中に何も記述しなければ良いです．このときは，Abstractの文字も自動的に消えます．日付の表示を消したい場合には，`date: false`などと記述すれば，消えます．同様にして，目次もtableofcontentsによって行うことができます．]
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
@tsukahara2023
```

と記述すれば，@tsukahara2023 のように参照できます．
この他にも，
```typst
#citet(<tsukahara2023>)
#citep(<tsukahara2023>)
#citefull(<tsukahara2023>)
```
などとすれば，
- #citet(<tsukahara2023>)
- #citep(<tsukahara2023>)
- #citefull(<tsukahara2023>)
のように引用できます．

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
また，単なる枠線のみにしたい場合，次のように記述します．
```typst
#framebox[
  同時エントロピーは，一般に以下の非負性を持つ．
  $ H(X, Y) >= 0 $
]
```
これによって，次のように表示されます．
#framebox[
  同時エントロピーは，一般に以下の非負性を持つ．
  $ H(X, Y) >= 0 $
]

== 数式番号のカスタム

数式番号をカスタムしたい場合，`eqcustom`関数を使用します．
```typst
#eqcustom($H(X, Y)>= 0$, "(5.f1)")
```
この時，次のように表示されます．
#eqcustom($H(X, Y)>= 0$, "(5.f1)")
この数式の後，通常通りの数式をかけば，数式番号は元に戻ります．
$ H(X, Y) >= 0 $

デフォルトでは，カスタムされた数式は数式番号のカウントに影響されません．
カスタムされた数式もカウントに含める場合，次のように記述します．
```typst
#eqcustom($H(X, Y)>= 0$, "(5.f1)", step: true)
```
これを表示させると，次のようになります．
#eqcustom($H(X, Y)>= 0$, "(5.f1)", step: true)
この後，通常の数式を書くと，上のカスタムされた数式も数式番号のカウントに含まれていることがわかります．
$ H(X, Y) >= 0 $

ラベルをつける際には，次のように書きます．
```typst
#eqcustom($H(X, Y)>= 0$, "(5.f2)", labelstr: "entropy_non")
```
表示は，変化しません．
#eqcustom($H(X, Y)>= 0$, "(5.f2)", labelstr: "entropy_non")
これを参照するには，通常通り`@entropy_non`とかくと，@entropy_non のように参照できます．


#v(2em)
#bibliography-list(
  title: [参考文献],
  ..bib-file(read("refs.bib")),
)

#show: jcls_appendix

= 付録

付録は`jcls_appendix`を使用します．
