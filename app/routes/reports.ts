import Route from '@ember/routing/route';
import { service } from '@ember/service';

import type StoreService from '@ember-data/store';

export default class ApplicationRoute extends Route {
  @service declare store: StoreService;

  async model() {
    const submissions = await this.store.query('submission', {
      filter: { submission: 'submissionStatus=out=cancelled' },
      include: 'publication',
    });

    const grants = await this.store.findAll('grant', {
      include: 'primaryFunder',
    });

    return { submissions, grants };
  }
}
