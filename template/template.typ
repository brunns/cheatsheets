#set page(
  paper: "a4",
  flipped: true, // Landscape
  margin: (x: 1cm, y: 1cm),
  columns: 3,
)
#set text(font: "DejaVu Sans", size: 8pt)

#show table: it => {
  if it.has("label") and it.label == <full-width> {
    return it
  }

  let fields = it.fields()
  let children = fields.remove("children", default: ())

  if "columns" in fields {
    let cols = fields.columns
    if type(cols) == int {
      // For 2-column tables, fit command column to content & stretch description
      if cols == 2 {
        fields.columns = (auto, 1fr)
      } else {
        fields.columns = (1fr,) * cols
      }
    } else if type(cols) == array {
      fields.columns = cols.map(c => if c == auto { 1fr } else { c })
    }
  }

  [#table(..fields, ..children) <full-width>]
}

$body$
