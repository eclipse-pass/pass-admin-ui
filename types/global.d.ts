import '@glint/environment-ember-loose';
import '@glint/environment-ember-template-imports';
import 'ember-cached-decorator-polyfill';

import type { Server } from 'miragejs';

declare module '@ember/test-helpers' {
  interface TestContext {
    server: Server;
  }
}
