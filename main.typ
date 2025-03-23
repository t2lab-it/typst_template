#import "typst_template/lib.typ": *
#show: jcls_init

#show: maketitle.with(
  title: [タイトル],
  authors: (
    (
      name: [],
      affiliation: [],
      email: "",
    ),
  ),
  date: true,
  tableofcontents: true,
  abstract: []
)


#bibliography-list(
  title: [参考文献],
  ..bib-file(read("ref.bib")),
)
