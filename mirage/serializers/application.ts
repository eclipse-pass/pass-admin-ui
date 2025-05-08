// mirage/serializers/application.js
import { JSONAPISerializer } from 'miragejs';
import { camelize } from '@ember/string';

export default JSONAPISerializer.extend({
  keyForAttribute(attr) {
    return attr; // Use attribute names as-is
  },

  keyForRelationship(key) {
    return camelize(key);
  },

  alwaysIncludeLinkageData: true,

  typeKeyForModel(model) {
    return model.modelName; // Ensure the 'type' matches Ember Data's expectations
  },
});
