export const idlFactory = ({ IDL }) => {
  const Category = IDL.Record({
    'id' : IDL.Text,
    'icon' : IDL.Text,
    'name' : IDL.Text,
  });
  const Item = IDL.Record({
    'id' : IDL.Text,
    'icon' : IDL.Text,
    'name' : IDL.Text,
    'description' : IDL.Opt(IDL.Text),
    'price' : IDL.Opt(IDL.Float64),
  });
  return IDL.Service({
    'getCategories' : IDL.Func([], [IDL.Vec(Category)], ['query']),
    'getItemsByCategory' : IDL.Func(
        [IDL.Text],
        [IDL.Opt(IDL.Vec(Item))],
        ['query'],
      ),
    'initialize' : IDL.Func([], [], []),
  });
};
export const init = ({ IDL }) => { return []; };
