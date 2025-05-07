import Component from '@glimmer/component';
import { service } from '@ember/service';
import SidebarItem from 'pass-admin-ui/components/layout/sidebar-item';

import type RouterService from '@ember/routing/router-service';

interface Signature {
  Args: {};
}

const SIDEBAR_ITEMS = [
  {
    value: 'dashboard',
    label: 'Dashboard',
  },
  {
    value: 'submissions',
    label: 'Submissions',
  },
  {
    value: 'reports',
    label: 'Reports',
  },
];

export default class SidebarDesktop extends Component<Signature> {
  @service declare router: RouterService;

  get currentRoute() {
    return this.router.currentRouteName ?? '';
  }

  <template>
    <div class="hidden lg:fixed lg:inset-y-0 lg:z-50 lg:flex lg:w-72 lg:flex-col">
      <div class="flex grow flex-col gap-y-5 overflow-y-auto bg-gray-900 px-6 pb-4">
        <div class="flex items-center gap-x-3 h-16 mt-2">
          <img class="w-10 h-10" src="images/university.shield.rgb.white.svg" alt="Your Company" />
          <div class="text-white whitespace-nowrap">PASS Admin</div>
        </div>
        <nav class="flex flex-1 flex-col">
          <ul role="list" class="flex flex-1 flex-col gap-y-7">
            <li>
              <ul role="list" class="-mx-2 space-y-1">
                {{#each SIDEBAR_ITEMS as |item|}}
                  <SidebarItem
                    @currentRoute={{this.currentRoute}}
                    @value={{item.value}}
                    @label={{item.label}}
                  />
                {{/each}}
              </ul>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </template>
}
