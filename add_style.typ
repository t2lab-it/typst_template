#import "style.typ": *


// 定理環境
#let teiri(title, it) = {
  teirinum.step()

  let num = context(str(counter(heading).get().at(0))) + "." + teirinum.display()

  grid(
    columns: 1,
    gutter: 0pt,
    block(
      width: 100%,
      fill: luma(160),
      stroke: luma(160),
      inset: 5pt,
      text(font: gothic, fill: white, "　定理 " + num + "  " + title)
    ),
    block(
      width: 100%,
      inset: 15pt,
      stroke: luma(160),
      it
    )
  )
}

//定義環境
#let teigi(title, it) = {
  teiginum.step()

  let num = context(str(counter(heading).get().at(0))) + "." + teiginum.display()

  grid(
    columns: 1,
    gutter: 0pt,
    block(
      width: 100%,
      fill: luma(100),
      stroke: luma(100),
      inset: 5pt,
      text(font: gothic, fill: white, "　定義 " + num + "  " + title)
    ),
    block(
      width: 100%,
      inset: 15pt,
      stroke: luma(100),
      it
    )
  )
}

//証明環境
#let shoumei(it) = {
  grid(
    columns: 2,
    text(font: gothic, "証明"),
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
