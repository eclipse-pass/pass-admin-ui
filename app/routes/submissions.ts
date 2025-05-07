import Route from '@ember/routing/route';
import { inject as service } from '@ember/service';
import Store from '@ember-data/store';

export default class SubmissionsRoute extends Route {
  @service declare store: Store;

  async model() {
    return this.store.findAll('submission');
  }
}
