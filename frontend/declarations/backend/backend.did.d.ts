import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';
import type { IDL } from '@dfinity/candid';

export interface Category {
  'icon' : string,
  'name' : string,
  'items' : Array<Item>,
}
export interface Item { 'icon' : string, 'name' : string }
export interface _SERVICE {
  'getCategories' : ActorMethod<[], Array<Category>>,
  'getItemsByCategory' : ActorMethod<[string], [] | [Array<Item>]>,
  'searchItems' : ActorMethod<[string], Array<[string, Array<Item>]>>,
}
export declare const idlFactory: IDL.InterfaceFactory;
export declare const init: (args: { IDL: typeof IDL }) => IDL.Type[];
