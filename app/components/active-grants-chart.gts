import Component from '@glimmer/component';
import { modifier } from 'ember-modifier';
import Chart from 'chart.js/auto';
import {
  format,
  addMonths,
  subMonths,
  parse,
  isBefore,
  isAfter,
  differenceInCalendarMonths,
} from 'date-fns';

interface Signature {
  Args: {
    data: any;
  };
}

export default class ActiveGrantsByFunderChart extends Component<Signature> {
  chart = null;

  get activeGrantsData() {
    try {
      const funderData = new Map();

      // Define the date range for the last 12 months
      const today = new Date();
      const endDate = new Date(today.getFullYear(), today.getMonth(), 1); // Start of current month
      const startDate = subMonths(endDate, 11); // Go back 11 months to get 12 months total

      // Generate a list of month labels
      const labels = [];
      for (let date = startDate; date <= endDate; date = addMonths(date, 1)) {
        labels.push(format(date, 'yyyy-MM'));
      }

      // Process each grant
      this.args.data.forEach((grant) => {
        const funderName = grant.primaryFunder?.get('name') || 'Unknown Funder';
        const grantStartDate = parse(grant.startDate, 'yyyy-MM-dd', new Date());
        const grantEndDate = parse(grant.endDate, 'yyyy-MM-dd', new Date());

        // Skip grants that are entirely outside our date range
        if (isAfter(grantStartDate, endDate) || isBefore(grantEndDate, startDate)) {
          return;
        }

        // Adjust grant dates to our date range
        const adjustedStartDate = isBefore(grantStartDate, startDate) ? startDate : grantStartDate;
        const adjustedEndDate = isAfter(grantEndDate, endDate) ? endDate : grantEndDate;

        // Calculate the number of months the grant is active within our date range
        const monthsActive = differenceInCalendarMonths(adjustedEndDate, adjustedStartDate) + 1;

        // Initialize funder data if not already present
        if (!funderData.has(funderName)) {
          funderData.set(funderName, new Map());
        }

        const funderCounts = funderData.get(funderName);

        // Increment counts for each month the grant is active
        for (let i = 0; i < monthsActive; i++) {
          const month = format(addMonths(adjustedStartDate, i), 'yyyy-MM');
          funderCounts.set(month, (funderCounts.get(month) || 0) + 1);
        }
      });

      // Create datasets for the chart
      const datasets = [];
      funderData.forEach((counts, funderName) => {
        const data = labels.map((label) => counts.get(label) || 0);
        datasets.push({
          label: funderName,
          data,
          fill: false,
          borderColor: `#${Math.floor(Math.random() * 16777215).toString(16)}`,
          tension: 0.1,
        });
      });

      return { labels, datasets };
    } catch (error) {
      console.error('Error generating active grants data:', error);
      throw error;
    }
  }

  setupChart = modifier(() => {
    const canvas = document.querySelector('#active-grants-chart');
    const ctx = canvas.getContext('2d');

    const { labels, datasets } = this.activeGrantsData;

    this.chart = new Chart(ctx, {
      type: 'line',
      data: { labels, datasets },
      options: {
        responsive: true,
        plugins: {
          legend: { position: 'top' },
        },
        scales: {
          x: {
            title: {
              display: true,
              text: 'Month',
            },
          },
          y: {
            title: {
              display: true,
              text: 'Active Grants in the last 12 months',
            },
            beginAtZero: true,
          },
        },
      },
    });
  });

  <template>
    <canvas id="active-grants-chart" {{this.setupChart}}></canvas>
  </template>
}
