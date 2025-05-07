import Model, { attr } from '@ember-data/model';

export default class PublicationModel extends Model {
  // doi, title, abstract, journal, volume, issue
  @attr('string') doi;
  @attr('string') title;
  @attr('string') publicationAbstract;
  @attr('string') volume;
  @attr('string') issue;
  @attr('string') pmid;
}
