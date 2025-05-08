import { createServer } from 'miragejs';

import ApplicationSerializer from './serializers/application';
import submissionModel from './models/submission';
import publicationModel from './models/publication';
import grantModel from './models/grant';
import repositoryModel from './models/repository';
import funderModel from './models/funder';

import funderFactory from './factories/funder';
import submissionFactory from './factories/submission';
import publicationFactory from './factories/publication';
import grantFactory from './factories/grant';
import repositoryFactory from './factories/repository';

import defaultScenario from './scenarios/default';

export default function (config) {
  let finalConfig = {
    ...config,
    models: {
      submission: submissionModel,
      publication: publicationModel,
      grant: grantModel,
      repository: repositoryModel,
      funder: funderModel,
    },
    serializers: {
      application: ApplicationSerializer,
    },
    factories: {
      funder: funderFactory,
      submission: submissionFactory,
      publication: publicationFactory,
      grant: grantFactory,
      repository: repositoryFactory,
    },
    scenarios: {
      default: defaultScenario,
    },
    routes() {
      // Publications
      this.get('/data/publication/:id', (schema, request) =>
        schema.find('publication', request.params.id)
      );
      this.post('/data/publication', function (schema, request) {
        const attrs = this.normalizedRequestAttrs();
        return schema.create('publication', attrs);
      });
      this.patch('/data/publication/:id', function (schema, request) {
        const attrs = this.normalizedRequestAttrs('publication');
        return schema.find('publication', request.params.id).update(attrs);
      });

      // Submissions
      this.get('/data/submission/:id', (schema, request) =>
        schema.find('submission', request.params.id)
      );
      this.post('/data/submission', function (schema, request) {
        const attrs = this.normalizedRequestAttrs('submission');
        return schema.create('submission', attrs);
      });
      this.patch('/data/submission/:id', function (schema, request) {
        const attrs = this.normalizedRequestAttrs('submission');
        return schema.find('submission', request.params.id).update(attrs);
      });
      // Submission filtering
      this.get('/data/submission', (schema, _request) => {
        return schema.submissions.all();
      });

      // Grants
      this.get('/data/grant/:id', (schema, request) => schema.find('grant', request.params.id));
      this.get('/data/grant', (schema, request) => schema.all('grant'));

      // Repositories
      this.get('/data/repository', (schema, request) => schema.all('repository'));
      this.get('/data/repository/:id', (schema, request) =>
        schema.find('repository', request.params.id)
      );

      /**
       * ################################################################
       * ##### Pass through everything else #############################
       * ################################################################
       */
      this.passthrough('http://localhost/**');
      this.passthrough('https://localhost/**');

      this.passthrough('http://pass.local/**');
      this.passthrough('https://pass.local/**');

      this.passthrough();
    },
  };

  const server = createServer(finalConfig);
  server.logging = true;

  return server;
}
