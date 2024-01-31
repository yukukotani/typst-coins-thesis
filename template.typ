#let textL = 1.8em
#let textM = 1.6em

#let project(title: "", author: "", major: "", advisor: none, year: none, body) = {
  set document(author: author, title: title)

  // Font
  set text(font: ("Noto Sans", "Noto Sans CJK JP"), lang: "ja")

  // Heading
  set heading(numbering: (..nums) => {
    if nums.pos().len() > 1 {
      nums.pos().map(str).join(".") + " "
    } else {
      text(cjk-latin-spacing: none)[第 #str(nums.pos().first()) 章]
      h(1em)
    }
  })
  show heading.where(level: 1): it => {
    pagebreak()
    set text(weight: "bold", size: 1.4em)
    pad(top: 3em, bottom: 2.5em)[
      #it
    ]
  }
  show heading.where(level: 2): it => pad(top: 1em, bottom: 0.6em, it)

  // Figure
  show figure: it => pad(y: 1em, it)
  show figure.caption: it => pad(top: 0.6em, it)

  // Outline
  show outline.entry.where(
    level: 1
  ): it => {
    v(0.2em)
    strong(it)
  }

  align(center)[
    #v(6em)
    
    #block(text(textM)[#year 年度])
    #v(2em)
    #block(text(textM, "筑波大学情報学群情報科学類"))
    #v(2em)
    #block(text(textM, "卒業研究論文"))

    // Title row.
    #align(horizon)[
      #block(text(textL, "題目"))
      #v(0.4em)
      #block(text(textL,  underline(offset: 0.2em, title)))
    ]

    #v(16em)

    // Author information.
    #block(text(textM)[#underline(offset: 0.2em)[主専攻 #major]])
    #v(2em)
    #block(text(textL)[#underline(offset: 0.2em)[著者 #author]])
    #if advisor != none [
      #v(0.6em)
      #block(text(textM)[#underline(offset: 0.2em)[指導教員 #advisor]])
    ]
  ]

  pagebreak(weak: true)

  set par(justify: true)
  body
}

#let abstract(body) = {
  v(180pt)
  
  align(center)[
    #text(size: textM, tracking: 2em, weight: "bold")[要旨]
  ]

  v(2em)

  set par(first-line-indent: 1em)
  body
  pagebreak(weak: true)
}