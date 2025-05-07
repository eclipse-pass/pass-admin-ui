import { Model, belongsTo } from 'miragejs';
import submission from './submission';

export default Model.extend({
  primaryFunder: belongsTo('funder'),
  directFunder: belongsTo('funder'),
  submission: belongsTo('submission'),
});
