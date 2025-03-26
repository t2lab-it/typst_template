#import "style.typ": *

// 定理環境
#let teiri(title, it, label: none) = {

  let num = context(counter(figure.where(kind: "teiri")).display())

  [#figure(
    [
      #set align(left)
      #stack(
        dir: ttb,
        block(
          width: 100%,
          fill: luma(160),
          stroke: luma(160),
          inset: 5pt,
          text(font: gothic, fill: white, "　定理 " + num + h(1.5em) + title, weight: "regular")
        ),
        block(
          width: 100%,
          inset: 15pt,
          stroke: luma(160),
          it
        )
      )
    ],
    kind: "teiri",
    supplement: [定理]
  )#label]
}

//定義環境
#let teigi(title, it, label: none) = {

  let num = context(counter(figure.where(kind: "teigi")).display())

  [#figure(
    [
      #set align(left)
      #stack(
        dir: ttb,
        block(
          width: 100%,
          fill: luma(100),
          stroke: luma(100),
          inset: 5pt,
          text(font: gothic, fill: white, "　定義 " + num + h(1.5em) + title, weight: "regular")
        ),
        block(
          width: 100%,
          inset: 15pt,
          stroke: luma(100),
          it
        )
      )
    ],
    kind: "teigi",
    supplement: [定義]
  )#label]
}

//証明環境
#let shoumei(it) = {
  grid(
    columns: 2,
    text(font: gothic, "証明", weight: "regular"),
    {v(4pt)
    line(stroke: (dash: ("dot", 3pt), paint: luma(140), thickness: 1.5pt), end: (100%, 0%), start: (2.5%, 0%))}
  )
  block(
      width: 100%,
      inset: 10pt,
      it
  )
  line(stroke: (dash: ("dot", 3pt), paint: luma(140), thickness: 1.5pt), end: (100%, 0%), start: (0%, 0%))}
}

//枠組環境
#let graybox(it) = block(
  fill: luma(230),
  width: 100%,
  inset: 10pt,
  it
)
#let framebox(it) = block(
  stroke: black,
  width: 100%,
  inset: 10pt,
  it
)

//数式番号の臨時的なカスタム
#let eqcustom(eq, number, step : false, labelstr : "") = [
  #math.equation(block: true, numbering: num => number, eq)

  // ラベルの追加
  #if label != "" {
    label(labelstr)
  }

  // 数式番号をカウントしない
  #if step == false {
    counter(math.equation).update(n => n - 1)
  }
]

//インデント関係

#let indent = context {
  //現在の位置を取得
  let now = here().position().x

  //marginを取得
  let page-set = page.margin
  if page-set == auto{//marginが自動で設定されている場合
    let small-length = calc.min(page.width, page.height)
    page-set = small-length * 2.5/21
  }
  else{//marginが手動設定されている場合は，左側の余白を取得
    page-set = page-set.left
  }

  //first-line-indentの量を取得
  let par-first-indent = par.first-line-indent.amount

  //位置が一番左のとき　かつ　インデント量が0でないとき
  if now == page-set and par-first-indent != 0cm{
    h(par-first-indent)
  }
}

#let noindent = context {
  //現在の位置を取得
  let now = here().position().x

  //marginを取得
  let page-set = page.margin
  if page-set == auto{//marginが自動で設定されている場合
    let small-length = calc.min(page.width, page.height)
    page-set = small-length * 2.5/21
  }
  else{//marginが手動設定されている場合は，左側の余白を取得
    page-set = page-set.left
  }

  //first-line-indentの量を取得
  let par-first-indent = par.first-line-indent.amount

  //位置が一番左のとき　かつ　インデント量が0でないとき
  if now == page-set and par-first-indent != 0cm{
    h(- par-first-indent)
  }
}
