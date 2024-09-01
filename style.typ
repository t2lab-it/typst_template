// Workaround for the lack of an `std` scope.
#let std-bibliography = bibliography

// Set the Fonts
#let gothic = ("MS PGothic", "Hiragino Kaku Gothic Pro", "IPAexGothic", "Noto Sans CJK JP")
#let mincho = ("MS PMincho", "Hiragino Mincho Pro", "IPAexMincho", "Noto Serif CJK JP")
#let english = ("Times New Roman", "New Computer Modern")

#let nowdate = {
  [#datetime.today().year()年#datetime.today().month()月#datetime.today().day()日]
}

//add_style.typのためのカウンター
#let teirinum = counter("teirinum")
#let teiginum = counter("teiginum")
// ソースコードを表示するための関数 -----
//https://zenn.dev/higumachan/scraps/1619ad8dc0e776

#let pad_int(i, N: 2) = {
  // pad an integer with leading zeros
  let s = str(i)
  let n_pads = N - s.len() - 1
  for _ in range(n_pads) {
    s = "0" + s
  }
  [#s]
}

#let get_line_num((i, body)) = {
  pad_int(i)
}

#let number_content(text_input) = {
  text_input.split("\n").enumerate(start: 1).map(get_line_num).join("\n")
}

#let code_content_block(it) = block(
  fill: luma(230),
  inset: 8pt,
  width: 100%,
  text(fill: black, it),
  radius: (
    right: 4pt
  )
)

#let num_content_block(it) = block(
  fill: luma(210),
  inset: 8pt,
  text(fill: luma(120), number_content(it)),
  radius: (
    left: 4pt
  )
)

// ソースコードを表示するための関数 -----


#let maketitle(
  title: "",
  abstract: [],
  keywords: (),
  authors: (),
  date: "on" ,
  tableofcontents: "on",
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 30mm),
    numbering: "1",
    number-align: center,
  )
  //数式の設定
  show math.equation: set text(weight: 400)
  show math.equation: set block(spacing: 0.65em)
  set math.equation(numbering: "(1)")
  //セクションの設定
  set heading(numbering: "1.1")
  show heading : set text(font: gothic)
  //文章全体のフォント設定
  set text(font: mincho, size: 10pt)
  //参考文献の設定
  show raw.where(block: true): it =>{
      grid(
    columns: 2,
    gutter: 0pt,
    num_content_block(it.text),
    code_content_block(it),
  )
  }
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  //節番号ごとに数式・図の番号をつける
  //https://github.com/typst/typst/issues/1896#issuecomment-2122449629
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    teirinum.update(0)
    teiginum.update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    it
  }
  set math.equation(numbering: num =>
    "(" + (str(counter(heading).get().at(0)) + "." + str(num)) + ")"
  )
  set figure(numbering: num =>
    str(counter(heading).get().at(0)) + "." + str(num)
  )
  set figure.caption(separator: [ ])
  //目次の設定
  //set outline(title : "目次")

  // Set run-in subheadings, starting at level 4.
  show heading: it => {
    // H1 and H2
    if it.level == 1 {
      pad(
        bottom: 10pt,
        it
      )
    }
    else if it.level == 2 {
      pad(
        bottom: 8pt,
        it
      )
    }
    else if it.level > 3 {
      text(11pt, weight: "bold", it.body + " ")
    } else {
      it
    }
  }

  //line(length: 100%, stroke: 2pt)
  // Title row.
  pad(
    bottom: 4pt,
    top: 4pt,
    align(center)[
      #set text(font: mincho)
      #block(text(weight: 500, 1.75em, title))
      #v(1em, weak: true)
    ]
  )
 // line(length: 100%, stroke: 2pt)

  // Author information.
  pad(
    top: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        #author.name
        #author.email \
        #author.affiliation
      ]),
    ),
  )
  // 日付の表示
  if date == "on"{
    align(center)[#nowdate]
  }

  // Abstract.
  if abstract != "" {

    pad(
      x: 3em,
      top: 1em,
      bottom: 0.4em,
      align(center)[
          #heading(
            outlined: false,
            numbering: none,
            text(0.85em, emph(smallcaps[Abstract]), font: english),
          )
          #set par(justify: true)
          #set text(hyphenate: false)

          #abstract
      ],
    )

    // 目次の表示
    if tableofcontents == "on"{
      v(0.5cm)
      line(length: 100%, stroke: 0.5pt)
      par(leading: 15pt,outline())
      pagebreak()
    }
 }



  // Keywords
  if keywords.len() > 0 {
      [*_Keywords_* #h(0.3cm)] + keywords.map(str).join(" · ")
  }
  v(1cm)
  // Main body.
  set par(justify: true)
  set text(hyphenate: false)

  body
}
