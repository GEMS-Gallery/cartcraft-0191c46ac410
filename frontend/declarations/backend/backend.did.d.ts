import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';
import type { IDL } from '@dfinity/candid';

export interface Category { 'id' : string, 'icon' : string, 'name' : string }
export interface Item {
  'id' : string,
  'icon' : string,
  'name' : string,
  'description' : [] | [string],
  'price' : [] | [number],
}
export interface _SERVICE {
  'getCategories' : ActorMethod<[], Array<Category>>,
  'getItemsByCategory' : ActorMethod<[string], [] | [Array<Item>]>,
  'initialize' : ActorMethod<[], undefined>,
}
export declare const idlFactory: IDL.InterfaceFactory;
export declare const init: (args: { IDL: typeof IDL }) => IDL.Type[];
