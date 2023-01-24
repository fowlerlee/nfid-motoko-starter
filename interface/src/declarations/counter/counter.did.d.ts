import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'getValue' : ActorMethod<[], bigint>,
  'greet' : ActorMethod<[string], string>,
  'increment' : ActorMethod<[], undefined>,
}
