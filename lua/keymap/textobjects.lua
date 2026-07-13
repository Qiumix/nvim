---@type wk.Spec
return {
  -- ════════════════════════════════════════════════════════════
  --  TEXT OBJECTS DESCRIPTIONS (mini.ai & Tree-sitter Textobjects)
  --  Triggered after pressing operators (v/d/c/y) followed by a/i
  -- ════════════════════════════════════════════════════════════
  {
    mode = { "x", "o" },
    { "a", desc = "Argument / Parameter", icon = { icon = "󰅩 ", color = "cyan" } },
    { "f", desc = "Function / Method definition", icon = { icon = "󰊕 ", color = "blue" } },
    { "F", desc = "Class / Struct definition", icon = { icon = "󰒪 ", color = "orange" } },
    { "o", desc = "Condition / Loop block", icon = { icon = "󰅨 ", color = "purple" } },

    -- Complementing mini.ai's builtin specs
    { "b", desc = "Balanced ( ) [ ] { }", icon = { icon = "󰅪 ", color = "grey" } },
    { "B", desc = "Balanced { } block", icon = { icon = "󰅩 ", color = "grey" } },
    { "i", desc = "Object scope with border", icon = { icon = "󰉶 ", color = "grey" } },
    { "n", desc = "Around next textobject", icon = { icon = "󰞔 ", color = "azure" } },
    { "l", desc = "Around last textobject", icon = { icon = "󰞓 ", color = "azure" } },
    { "p", desc = "Paragraph", icon = { icon = "󰦨 ", color = "yellow" } },
    { "s", desc = "Sentence", icon = { icon = "󰦪 ", color = "yellow" } },
    { "t", desc = "XML / HTML tag block", icon = { icon = "󰜬 ", color = "red" } },
    { "w", desc = "Word with white spaces", icon = { icon = "󰏫 ", color = "green" } },
    { "W", desc = "WORD with white spaces", icon = { icon = "󰏫 ", color = "green" } },
    { '"', desc = "Double quoted string", icon = { icon = "󰅺 ", color = "grey" } },
    { "'", desc = "Single quoted string", icon = { icon = "󰅺 ", color = "grey" } },
    { "`", desc = "Backtick quoted string", icon = { icon = "󰅺 ", color = "grey" } },
  },
}
