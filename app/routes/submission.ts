import Route from '@ember/routing/route';
import { inject as service } from '@ember/service';
import Store from '@ember-data/store';

export default class SubmissionsDetailRoute extends Route {
  @service declare store: Store;

  async model({ submission_id }: { submission_id: string }) {
    const submission = await this.store.findRecord('submission', submission_id, {
      include: 'publication,repositories,grants',
    });
    return submission;
  }
}
