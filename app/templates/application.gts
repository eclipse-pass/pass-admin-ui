import Component from '@glimmer/component';
import Layout from 'pass-admin-ui/components/layout';
import { pageTitle } from 'ember-page-title';

interface ApplicationRouteSignature {
  Args: {
    model: any;
  };
}

export default class ApplicationComponent extends Component<ApplicationRouteSignature> {
  <template>
    {{pageTitle "PassAdminUi"}}

    <Layout>
      {{outlet}}
    </Layout>
  </template>
}
