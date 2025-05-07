import Component from '@glimmer/component';
import { modifier } from 'ember-modifier';
import Chart from 'chart.js/auto';

interface Signature {
  Args: {
    data: any;
  };
}

export default class SubmissionsChart extends Component<Signature> {
  chart: Chart | null = null;

  get submissionData() {
    // Create a Map to hold counts of submissions per date
    const dateCounts = new Map();

    // Iterate over each submission in the data array
    this.args.data.forEach((submission: any) => {
      // Extract the submittedDate from the submission
      const dateString = submission.submittedDate?.split('T')[0]; // Extract 'YYYY-MM-DD'

      // Check if dateString is valid
      if (dateString) {
        // If the date is already in the Map, increment its count
        if (dateCounts.has(dateString)) {
          dateCounts.set(dateString, dateCounts.get(dateString) + 1);
        } else {
          // Otherwise, add the date to the Map with a count of 1
          dateCounts.set(dateString, 1);
        }
      } else {
        console.warn('Missing or invalid submittedDate for submission:', submission);
      }
    });

    // Sort the dates to ensure chronological order
    const labels = Array.from(dateCounts.keys()).sort();

    // Map each date to its count of submissions
    const dataPoints = labels.map((date) => dateCounts.get(date));

    // Return the labels and dataPoints for the chart
    return { labels, dataPoints };
  }

  setupChart = modifier(() => {
    const element = document.querySelector('#submissions-chart');
    const ctx = (element as HTMLCanvasElement).getContext('2d');
    if (!ctx) {
      return;
    }

    const { labels, dataPoints } = this.submissionData;

    this.chart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [
          {
            label: 'Submissions by day',
            data: dataPoints,
            fill: false,
            borderColor: 'rgb(75, 192, 192)',
            tension: 0.1,
          },
        ],
      },
    });
  });

  <template>
    <canvas id="submissions-chart" {{this.setupChart}}></canvas>
  </template>
}
