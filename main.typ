#import "style.typ": *
#set text(lang: "ja")
//==================================================
//                    DOCUMENT
//==================================================
#show: maketitle.with(
  title: [],
  authors: (
    (
      name: "",
      email: "",
      affiliation: "",
    ),
  ),
  date:"on",
  tableofcontents:"on",
  abstract: ""
)
