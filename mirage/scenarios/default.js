import { faker } from '@faker-js/faker';
import { subDays, addDays, format } from 'date-fns';

export default function (server) {
  console.log('Running Mirage default scenario...');

  // Parameters for submissions
  const submissionsPerDayMin = 1;
  const submissionsPerDayMax = 10;
  const totalSubmissionsGoal = 100;

  // Calculate average submissions per day and estimate total days needed
  const averageSubmissionsPerDay = (submissionsPerDayMin + submissionsPerDayMax) / 2;
  const estimatedDaysNeeded = Math.ceil(totalSubmissionsGoal / averageSubmissionsPerDay);
  const submissionTotalDays = Math.min(estimatedDaysNeeded, 30); // Limit to 30 days

  const today = new Date();
  const submissionStartDate = subDays(today, submissionTotalDays);

  let totalSubmissions = 0;

  // Generate repositories
  const totalRepositories = 20;
  const repositories = server.createList('repository', totalRepositories);

  // Generate submissions data
  for (let i = 0; i < submissionTotalDays; i++) {
    const currentDate = addDays(submissionStartDate, i);

    // Generate a random number of submissions for this day
    const submissionsCount = faker.datatype.number({
      min: submissionsPerDayMin,
      max: submissionsPerDayMax,
    });

    for (let j = 0; j < submissionsCount; j++) {
      // Create a unique publication for each submission
      const publication = server.create('publication', {
        doi: faker.datatype.uuid(),
        title: faker.lorem.sentence(),
        publicationAbstract: faker.lorem.paragraph(),
        volume: faker.datatype.number({ min: 1, max: 100 }).toString(),
        issue: faker.datatype.number({ min: 1, max: 12 }).toString(),
        pmid: faker.datatype.uuid(),
      });

      // Randomly assign repositories to this submission (1 to 5 repositories)
      const assignedRepositories = faker.helpers.arrayElements(
        repositories,
        faker.datatype.number({ min: 1, max: 5 })
      );

      server.create('submission', {
        submittedDate: currentDate.toISOString(),
        publication,
        repositories: assignedRepositories, // Associate repositories with the submission
      });

      totalSubmissions++;

      // Stop creating submissions if we've reached the total goal
      if (totalSubmissions >= totalSubmissionsGoal) {
        break;
      }
    }

    if (totalSubmissions >= totalSubmissionsGoal) {
      break;
    }
  }

  console.log(`Created ${totalSubmissions} submissions over ${submissionTotalDays} days.`);

  // Parameters for grants (last quarter)
  const grantStartDate = subDays(today, 90); // Start date for last quarter

  // Create funders
  const funders = server.createList('funder', 3); // Creates 3 unique funders

  // Create grants with specific dates within the last 90 days
  funders.forEach((funder) => {
    // Generate a random number of grants for this funder
    const numberOfGrants = faker.datatype.number({ min: 5, max: 15 });

    for (let i = 0; i < numberOfGrants; i++) {
      // Generate a random number of days ago between 0 and 90
      const randomDaysAgo = faker.datatype.number({ min: 0, max: 90 });
      const awardDate = subDays(today, randomDaysAgo);
      const formattedDate = format(awardDate, 'yyyy-MM-dd');

      console.log(`Creating grant for funder "${funder.name}" with award date: ${formattedDate}`);

      server.create('grant', {
        primaryFunder: funder,
        directFunder: funder,
        awardDate: formattedDate, // Random date within the last 90 days
        projectName: faker.company.catchPhrase(),
        awardStatus: faker.helpers.arrayElement(['active', 'terminated', 'pre_award']),
      });
    }
  });

  funders.forEach((funder) => {
    // Generate a random number of grants for this funder
    const numberOfGrants = faker.datatype.number({ min: 5, max: 15 });

    for (let i = 0; i < numberOfGrants; i++) {
      // Generate a random start date within the last 12 months
      const randomStartDaysAgo = faker.datatype.number({ min: 0, max: 365 });
      const startDate = subDays(today, randomStartDaysAgo);

      // Generate a random end date after the start date
      const randomDurationDays = faker.datatype.number({ min: 30, max: 365 });
      const endDate = addDays(startDate, randomDurationDays);

      // Format the dates
      const formattedStartDate = format(startDate, 'yyyy-MM-dd');
      const formattedEndDate = format(endDate, 'yyyy-MM-dd');

      console.log(
        `Creating grant for funder "${funder.name}" with start date: ${formattedStartDate}, end date: ${formattedEndDate}`
      );

      server.create('grant', {
        primaryFunder: funder,
        directFunder: funder,
        startDate: formattedStartDate,
        endDate: formattedEndDate,
        projectName: faker.company.catchPhrase(),
        awardStatus: faker.helpers.arrayElement(['active', 'terminated', 'pre_award']),
      });
    }
  });

  console.log('Created grants with award dates within the last quarter for each funder.');
}
