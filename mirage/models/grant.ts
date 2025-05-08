import { Model, belongsTo } from 'miragejs';

export default Model.extend({
  primaryFunder: belongsTo('funder'),
  directFunder: belongsTo('funder'),
  submission: belongsTo('submission'),
});
