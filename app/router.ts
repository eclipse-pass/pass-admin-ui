import EmberRouter from '@ember/routing/router';
import config from 'pass-admin-ui/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  // Add route declarations here
  this.route('dashboard');
  this.route('submissions');
  this.route('submission', { path: '/submissions/:submission_id' });
  this.route('reports');
});
