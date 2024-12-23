(import_item) @local.definition.import (#set! local.definition.import.scope "parent")
(import_declaration
  "import"
  "unqualified"?
  (_) @local.definition.import (#set! local.definition.import.scope "parent")
  (_)?
  ("as" (_) @local.definition.namespace)? (#set! local.definition.namespace.scope "parent")
)

( type_parameter
  (local_variable) @local.definition.parameter
)

( type_parameter
  (local_variable) @local.definition.parameter ":" (kind)
)

( type_parameter
  "(" (local_variable) @local.definition.parameter ":" (kind) ")"
)

(type_variable) @local.reference

( type_record_item
  (label) @local.definition
  ":"
  (type_multiplicity
    (multiplicity_variable) @local.reference
  )
  _ @local.definition.associated
)

(type_scheme) @local.scope

(pattern_variable
  (imported_variable) @local.reference
)

(pattern_application
  (pattern_variable) @local.reference
  (_)
)

(pattern_record_item
  (label) @local.definition.var @local.reference
)

(expression_record_item
  (label) @local.definition.var @local.reference
)

(expression_record_item
  (label) @local.reference
  ":"
  _
)

(expression_variable) @local.reference

(case_item) @local.scope

(expression_selector
  (_)
  (selector) @local.reference
)

(expression_binary
  (_)
  (infix_identifier) @local.reference
  (_)
)

(expression_let) @local.scope

(lambda_parameter
  (local_variable) @local.definition.var
)

(lambda_parameter
  "("
  (local_variable) @local.definition.var
  ":"
  (_) @local.definition.associated
  ")"
)

(expression_lambda) @local.scope

((top_type_declaration_left
  name: (local_variable) @local.definition.type) (#set! local.definition.type.scope "global"))


(data_type_constructor_type
  name: (local_variable) @local.definition.function (#set! local.definition.function.scope "global")
  (_)?
)

(data_type) @local.scope
(alias_type) @local.scope
(new_type) @local.scope

(function_parameter
  (local_variable) @local.definition.parameter
  ":"
  (_) @local.definition.associated
)

(function_parameter
  "("
  (local_variable) @local.definition.parameter
  ":"
  (_) @local.definition.associated
  ")"
)

(function_declaration
  (local_variable) @local.definition.function (#set! local.definition.function.scope "global")
  ":"
  (_)?
  (_)*
  (_) @local.definition.associated
)

(function_definition)@local.scope
