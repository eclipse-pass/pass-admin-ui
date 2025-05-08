import Component from '@glimmer/component';
import SubmissionsChart from 'pass-admin-ui/components/submissions-chart';
import GrantsChart from 'pass-admin-ui/components/grants-chart';
import ActiveGrantsChart from 'pass-admin-ui/components/active-grants-chart';

interface ReportsComponentSignature {
  Args: {
    model: any;
  };
}

export default class ReportsComponent extends Component<ReportsComponentSignature> {
  //@ts-expect-error
  submissions = this.args.submissions;
  //@ts-expect-error
  grants = this.args.grants;

  <template>
    <h2 class="text-xl font-semibold text-gray-900 mb-4">Reports</h2>

    <div class="flex flex-col gap-y-4">
      <div class="flex w-full gap-x-4">
        <div class="bg-white rounded-lg shadow p-6 w-full">
          <GrantsChart @data={{this.args.model.grants}} />
        </div>
        <div class="bg-white rounded-lg shadow p-6 w-full">
          <ActiveGrantsChart @data={{this.args.model.grants}} />
        </div>
      </div>
      <div class="bg-white rounded-lg shadow p-6 w-1/2">
        <SubmissionsChart @data={{this.args.model.submissions}} />
      </div>
    </div>
  </template>
}
