import { Model, belongsTo, hasMany } from 'miragejs';

export default Model.extend({
  repositories: hasMany('repository'),
  publication: belongsTo(),
});
