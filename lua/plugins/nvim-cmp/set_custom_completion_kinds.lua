local cmp_kinds = {
  Text = '   (Text) ',
  Method = '   (Method)',
  Function = '   (Function)',
  Constructor = '   (Constructor)',
  Field = ' ﴲ  (Field)',
  Variable = '[] (Variable)',
  Class = '   (Class)',
  Interface = ' ﰮ  (Interface)',
  Module = '   (Module)',
  Property = ' 襁 (Property)',
  Unit = '   (Unit)',
  Value = '   (Value)',
  Enum = ' 練 (Enum)',
  Keyword = '   (Keyword)',
  Snippet = '   (Snippet)',
  Color = '   (Color)',
  File = '   (File)',
  Reference = '   (Reference)',
  Folder = '   (Folder)',
  EnumMember = '   (EnumMember)',
  Constant = ' ﲀ  (Constant)',
  Struct = ' ﳤ  (Struct)',
  Event = '   (Event)',
  Operator = '   (Operator)',
  TypeParameter = '   (TypeParameter)',
};

return function (_, vim_item)
  vim_item.kind = cmp_kinds[vim_item.kind];
  return vim_item;
end
