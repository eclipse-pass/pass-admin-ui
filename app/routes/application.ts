import Route from '@ember/routing/route';
import { service } from '@ember/service';
import { macroCondition, isDevelopingApp, isTesting, importSync } from '@embroider/macros';

import Store from '@ember-data/store';

export default class ApplicationRoute extends Route {
  @service declare store: Store;

  constructor(...args: any[]) {
    super(...args);
    // embroider macros should ensure that mirage code is tree-shaken out of production build
    if (macroCondition(isDevelopingApp() && !isTesting())) {
      const startMirage: any = importSync('pass-admin-ui/mirage/server');
      startMirage.default({});
    }
  }

  model() {
    return this.store.query('submission', {
      filter: { submission: 'submissionStatus=out=cancelled' },
      include: 'publication',
    });
  }
}
