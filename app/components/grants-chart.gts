import Component from '@glimmer/component';
import { modifier } from 'ember-modifier';
import Chart from 'chart.js/auto';
import { parse, addDays, subDays, format, startOfWeek } from 'date-fns';

interface Signature {
  Args: {
    data: any;
  };
}

export default class GrantsByFunderChart extends Component<Signature> {
  chart: Chart | null = null;
  get grantsData() {
    try {
      const funderData = new Map<string, Map<string, number>>();

      // Define the date range for the last quarter (90 days)
      const endDate = new Date();
      const startDate = subDays(endDate, 90);

      // Generate a list of week labels from the startDate to the endDate
      const labels = [];
      let currentDate = startOfWeek(startDate);
      while (currentDate <= endDate) {
        labels.push(format(currentDate, 'yyyy-MM-dd'));
        currentDate = addDays(currentDate, 7);
      }

      // Populate funderData with cumulative weekly counts for each funder
      this.args.data.slice().forEach((grant: any) => {
        const funderName = grant.primaryFunder?.get('name') || 'Unknown Funder';
        const awardDate = parse(grant.awardDate, 'yyyy-MM-dd', new Date()); // Use parse with correct format

        // Only include grants within the last 90 days
        if (awardDate >= startDate && awardDate <= endDate) {
          const weekStartDate = startOfWeek(awardDate);
          const weekStart = format(weekStartDate, 'yyyy-MM-dd'); // Start of the week

          if (!funderData.has(funderName)) {
            funderData.set(funderName, new Map());
          }

          const dateCounts = funderData.get(funderName);
          if (dateCounts?.has(weekStart)) {
            dateCounts.set(weekStart, (dateCounts.get(weekStart) || 0) + 1);
          } else {
            dateCounts?.set(weekStart, 1);
          }
        }
      });

      // Generate datasets with cumulative counts per week for each funder
      const datasets = Array.from(funderData.entries()).map(([funder, dateCounts]) => {
        let cumulativeCount = 0;
        const data = labels.map((label) => {
          cumulativeCount += dateCounts.get(label) || 0;
          return cumulativeCount;
        });

        return {
          label: funder,
          data,
          fill: false,
          borderColor: `#${Math.floor(Math.random() * 16777215).toString(16)}`,
          tension: 0.1,
        };
      });

      // Debugging statements
      console.log('Labels:', labels);
      console.log('Datasets:', datasets);

      return { labels, datasets };
    } catch (error) {
      console.error('Error in grantsData:', error);
      throw error;
    }
  }

  setupChart = modifier(() => {
    const element = document.querySelector('#grants-chart');
    const ctx = (element as HTMLCanvasElement).getContext('2d');
    if (!ctx) {
      return;
    }

    const { labels, datasets } = this.grantsData;

    this.chart = new Chart(ctx, {
      type: 'line',
      data: {
        labels,
        datasets,
      },
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top',
          },
        },
        scales: {
          x: {
            title: {
              display: true,
              text: 'Date (Weekly)',
            },
          },
          y: {
            title: {
              display: true,
              text: 'Grants Awarded in last 3 months',
            },
            beginAtZero: true,
          },
        },
      },
    });
  });

  <template>
    <canvas id="grants-chart" {{this.setupChart}}></canvas>
  </template>
}
