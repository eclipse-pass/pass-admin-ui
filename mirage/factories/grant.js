import { Factory } from 'miragejs';
import { faker } from '@faker-js/faker';

export default Factory.extend({
  awardNumber() {
    return faker.string.alpha(10);
  },
  awardStatus() {
    return faker.helpers.arrayElement(['active', 'pre_award', 'terminated']);
  },
  localKey() {
    return faker.string.uuid();
  },
  projectName() {
    return faker.company.catchPhrase();
  },
  awardDate() {
    return faker.date.past();
  },
  startDate() {
    return faker.date.past();
  },
  endDate() {
    return faker.date.future();
  },

  // afterCreate(grant, server) {
  //   // Set up relationships if needed
  //   grant.update({
  //     primaryFunder: server.create('funder'),
  //     directFunder: server.create('funder'),
  //   });
  // },
});
