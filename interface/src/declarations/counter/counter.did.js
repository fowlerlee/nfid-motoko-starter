export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'getValue' : IDL.Func([], [IDL.Nat], ['query']),
    'greet' : IDL.Func([IDL.Text], [IDL.Text], ['query']),
    'increment' : IDL.Func([], [], []),
  });
};
export const init = ({ IDL }) => { return []; };
