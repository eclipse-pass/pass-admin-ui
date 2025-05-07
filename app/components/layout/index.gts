import type { TemplateOnlyComponent } from '@ember/component/template-only';

import Navbar from 'pass-admin-ui/components/layout/navbar';
import SidebarDesktop from 'pass-admin-ui/components/layout/sidebar-desktop';

interface Signature {
  Element: HTMLElement;
  Args: {};
  Blocks: {
    default: any;
  };
}

const LayoutComponent: TemplateOnlyComponent<Signature> = <template>
  <div>
    <SidebarDesktop />
    <div class="lg:pl-72">
      <Navbar />
      <main class="py-10 bg-gray-50 min-h-screen">
        <div class="px-4 sm:px-6 lg:px-8">
          {{outlet}}
        </div>
      </main>
    </div>
  </div>
</template>;

export default LayoutComponent;
