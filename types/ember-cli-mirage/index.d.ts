import type FactoryRegistry from 'ember-cli-mirage/types/registries/factory';
import type ModelRegistry from 'ember-cli-mirage/types/registries/model';
import type { Instantiate } from 'miragejs/-types';
import type { Registry as MirageRegistry, Server as MirageServer } from 'miragejs';
import type { ServerConfig as MirageServerConfig } from 'miragejs/server';

type ResolveRegistry<TRegistry> = {
  [Key in keyof TRegistry]: TRegistry[Key];
};

type Registry = MirageRegistry<ResolveRegistry<ModelRegistry>, ResolveRegistry<FactoryRegistry>>;

export type Server = MirageServer<Registry>;
export type ServerConfig = MirageServerConfig<
  ResolveRegistry<ModelRegistry>,
  ResolveRegistry<FactoryRegistry>
>;

declare module 'miragejs' {
  /**
   * See https://www.ember-cli-mirage.com/docs/data-layer/factories#the-association-helper
   *
   * @param args Optional arguments that match those that can be passed to
   *   `Server.create`.
   */
  export function association<ModelName extends keyof Registry>(
    ...args: unknown[]
  ): Instantiate<Registry, ModelName>;
}
