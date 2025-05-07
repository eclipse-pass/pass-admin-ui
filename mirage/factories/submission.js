// mirage/factories/submission.js
import { Factory, association } from 'miragejs';

import { faker } from '@faker-js/faker';

export default Factory.extend({
  aggregatedDepositStatus: 'not-started',
  submittedDate() {
    return faker.date.past();
  },
  source: 'pass',
  metadata:
    '{"publisher":"Royal Society of Chemistry (RSC)","issue":"1","abstract":"<p>The investigators report a dramatically improved chemoselective analysis for carbonyls in crude biological extracts by turning to a catalyst and freezing conditions for derivatization.</p>","title":"Quantitative profiling of carbonyl metabolites directly in crude biological extracts using chemoselective tagging and nanoESI-FTMS","volume":"143","journal-title":"The Analyst","issns":[{"issn":"0003-2654","pubType":"Print"},{"issn":"1364-5528","pubType":"Online"}],"authors":[{"author":"Pan Deng","orcid":"http://orcid.org/0000-0003-2974-7389"},{"author":"Richard M. Higashi"},{"author":"Andrew N. Lane","orcid":"http://orcid.org/0000-0003-1121-5106"},{"author":"Ronald C. Bruntz"},{"author":"Ramon C. Sun"},{"author":"Mandapati V. Ramakrishnam Raju"},{"author":"Michael H. Nantz"},{"author":"Zhen Qi"},{"author":"Teresa W.-M. Fan","orcid":"http://orcid.org/0000-0002-7292-8938"}],"journal-NLMTA-ID":"Analyst","publicationDate":"2018","doi":"10.1039/c7an01256j","$schema":"https://eclipse-pass.github.io/metadata-schemas/jhu/global.json","agent_information":{"name":"Chrome","version":"124"}}',
  submitted: false,
  submissionStatus: 'DRAFT',
  submitterName: 'Nihu User',
  submitterEmail: 'nih@user.com',
  version: 1,

  // Associations
  publication: association(),

  afterCreate(submission, server) {
    server.createList('grant', 1, { submission });
    console.log('Created submission:', submission.attrs);
  },
});
