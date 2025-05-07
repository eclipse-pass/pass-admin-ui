import RouteTemplate from 'ember-route-template';
import Layout from 'pass-admin-ui/components/layout';
import { pageTitle } from 'ember-page-title';

interface ApplicationRouteSignature {
  Args: {
    model: any;
  };
}

export default RouteTemplate<ApplicationRouteSignature>(
  <template>
    {{pageTitle "PassAdminUi"}}

    <Layout>
      {{outlet}}
    </Layout>
  </template>
);
