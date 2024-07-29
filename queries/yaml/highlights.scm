(boolean_scalar) @boolean

(null_scalar) @constant.builtin

(double_quote_scalar) @string

(single_quote_scalar) @string

((block_scalar) @string
  (#set! priority 99))

(string_scalar) @string

(escape_sequence) @string.escape

(integer_scalar) @number

(float_scalar) @number

(comment) @comment @spell

[
  (anchor_name)
  (alias_name)
] @label

(tag) @type

[
  (yaml_directive)
  (tag_directive)
  (reserved_directive)
] @keyword.directive

(block_mapping_pair
  key: (flow_node
    [
      (double_quote_scalar)
      (single_quote_scalar)
    ] @property))

(block_mapping_pair
  key: (flow_node
    (plain_scalar
      (string_scalar) @property)))

(flow_mapping
  (_
    key: (flow_node
      [
        (double_quote_scalar)
        (single_quote_scalar)
      ] @property)))

(flow_mapping
  (_
    key: (flow_node
      (plain_scalar
        (string_scalar) @property))))

[
  ","
  "-"
  ":"
  ">"
  "?"
  "|"
] @punctuation.delimiter

[
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  "*"
  "&"
  "---"
  "..."
] @punctuation.special

; pre-commit hook url
((block_mapping_pair
  key: (flow_node) @_repo
  value: (flow_node
    (plain_scalar
      (string_scalar) @string.special.url)))
  (#eq? @_repo "repo")
  (#not-any-of? @string.special.url "local" "meta"))

; pre-commit files/exclude pattern
((block_mapping_pair
  key: (flow_node) @_files
  value: (flow_node
    (plain_scalar
      (string_scalar) @string.regexp)))
  (#any-of? @_files "files" "exclude"))

((block_mapping_pair
  key: (flow_node) @_files
  value: (block_node
    (block_scalar) @string.regexp))
  (#any-of? @_files "files" "exclude")
  (#offset! @string.regexp 0 1 0 0))
