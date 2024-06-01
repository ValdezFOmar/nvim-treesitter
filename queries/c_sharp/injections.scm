((comment) @injection.content
  (#set! injection.language "comment"))

; `new Regex(pattern)`
(object_creation_expression
  type: (identifier) @_regex
  arguments: (argument_list
    .
    (argument
      [
        (interpolated_string_expression
          (string_content) @injection.content)
        (string_literal
          (string_literal_content) @injection.content)
        (raw_string_literal
          (raw_string_content) @injection.content)
        ; (verbatim_string_literal) Once this one is properly parsed, submit the pull request
      ]))
  (#eq? @_regex "Regex")
  (#set! injection.language "regex"))

; Regex class overloaded static methods of the form `Regex.Method(input, pattern, ...)`
; https://learn.microsoft.com/dotnet/api/system.text.regularexpressions.regex#methods
(invocation_expression
  function: (member_access_expression
    expression: (identifier) @_regex
    name: (identifier) @_method)
  arguments: (argument_list
    .
    (_)
    .
    (argument
      [
        (interpolated_string_expression
          (string_content) @injection.content)
        (string_literal
          (string_literal_content) @injection.content)
        (raw_string_literal
          (raw_string_content) @injection.content)
      ]))
  (#eq? @_regex "Regex")
  (#any-of? @_method "Count" "Match" "Matches" "IsMatch" "EnumerateMatches" "Replace" "Split")
  (#set! injection.language "regex"))
