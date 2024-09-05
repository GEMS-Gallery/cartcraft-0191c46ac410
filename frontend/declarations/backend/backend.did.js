export const idlFactory = ({ IDL }) => {
  const Item = IDL.Record({ 'icon' : IDL.Text, 'name' : IDL.Text });
  const Category = IDL.Record({
    'name' : IDL.Text,
    'icons' : IDL.Vec(IDL.Text),
    'items' : IDL.Vec(Item),
  });
  return IDL.Service({
    'getCategories' : IDL.Func([], [IDL.Vec(Category)], ['query']),
    'getItemsByCategory' : IDL.Func(
        [IDL.Text],
        [IDL.Opt(IDL.Vec(Item))],
        ['query'],
      ),
  });
};
export const init = ({ IDL }) => { return []; };
