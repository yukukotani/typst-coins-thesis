#import "template.typ": *

#show: project.with(
  title: "筑波大学情報科学類の卒業論文テンプレート",
  author: "筑波 太郎",
  advisor: "セリヌンティウス",
  major: "パソコン主専攻",
  year: "2023",
)

#abstract[
この文書は筑波大学情報学群情報科学類の卒業研究論文のサンプルである。このファイルを書き換えて、このサンプルと同様の書式の論文を作成できる。

本サンプルはGitHubリポジトリ @repo-typst-coins-thesis で配布されている。
]

#outline(indent: auto, fill: box(width: 1fr, repeat[．]))

// start page number
#set page(numbering: "1", number-align: center)
#counter(page).update(1)

= いろいろな例

ここでは、論文の表紙および本体の記述方法について述べる。

== 表

表を描画する例を @figure_table に示す。

#figure(
  table(
    columns: 2,
    [*西暦*], [*和暦*],
    [2023年], [令和5年],
    [2024年], [令和6年],
  ),
  caption: [表の例],
) <figure_table>

== 脚注

本テンプレートはTypst #footnote[https://typst.app/] 用に作られている。

#heading(numbering: none)[謝辞]

ありがとうございます

#[
  #set text(lang: "en")
  #bibliography(title: "参考文献", style:"ieee", "bib.yaml")
]
