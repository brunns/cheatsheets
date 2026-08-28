#let brand-color = rgb("#1e3a8a")  // Deep navy for titles/accents
#let header-bg   = rgb("#f1f5f9")  // Soft gray for table headers
#let stripe-bg   = rgb("#f8fafc")  // Very light gray for alternating rows
#let border-color = rgb("#e2e8f0") // Subtle gray for table rules
#let text-dark   = rgb("#0f172a")  // Off-black for high contrast reading

#set page(
  paper: "a4",
  flipped: true,
  margin: (x: 0.8cm, y: 0.8cm),
  columns: 3,
)

#set columns(gutter: 12pt)

#set text(
  font: "Noto Sans",
  size: 8pt,
  fill: text-dark,
)

#set par(leading: 0.5em, justify: false)

#show heading.where(level: 1): it => block(
  width: 100%,
  fill: brand-color,
  inset: (x: 6pt, y: 4pt),
  radius: 3pt,
  above: 8pt,
  below: 4pt,
  [
    #set text(fill: white, weight: "bold", size: 14pt)
    #align(center)[#upper(it.body)]
  ]
)

#show heading.where(level: 2): it => block(
  width: 100%,
  stroke: (bottom: 1pt + brand-color),
  inset: (bottom: 2pt),
  above: 8pt,
  below: 4pt,
  [
    #set text(fill: brand-color, weight: "bold", size: 12pt)
    #it.body
  ]
)

#show heading.where(level: 3): it => block(
  above: 6pt,
  below: 2pt,
  [
    #set text(fill: text-dark, weight: "bold", size: 10pt)
    #it.body
  ]
)

#show table: it => {
  if it.has("label") and it.label == <full-width> {
    return it
  }

  let fields = it.fields()
  let children = fields.remove("children", default: ())

  if "columns" in fields {
    let cols = fields.columns
    let col-count = if type(cols) == int {
      cols
    } else if type(cols) == array {
      cols.len()
    } else {
      1
    }

    if col-count == 2 {
      fields.columns = (auto, 1fr)
    } else if col-count == 3 {
      fields.columns = (auto, 1fr, auto)
    } else if type(cols) == array {
      fields.columns = cols.map(c => if c == auto { 1fr } else { c })
    } else {
      fields.columns = (1fr,) * col-count
    }
  }

  fields.inset = (x: 5pt, y: 3.5pt)
  fields.align = (col, row) => left + horizon

  fields.stroke = (x, y) => if y == 0 {
    (bottom: 1pt + brand-color)
  } else {
    (bottom: 0.5pt + border-color)
  }

  fields.fill = (x, y) => if y == 0 {
    header-bg
  } else if calc.even(y) {
    stripe-bg
  } else {
    none
  }

  [
    #show table.cell.where(x: 0): cell => layout(size => context {
      let max-w = size.width * 50% - 10pt
      if measure(cell.body).width > max-w {
        let cell-fields = cell.fields()
        let body = cell-fields.remove("body", default: none)
        table.cell(..cell-fields, block(width: max-w, body))
      } else {
        cell
      }
    })
    #table(..fields, ..children) <full-width>
  ]
}

$body$
