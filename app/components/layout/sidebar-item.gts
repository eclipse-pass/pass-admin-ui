import Component from '@glimmer/component';
import { LinkTo } from '@ember/routing';
import svgJar from 'ember-svg-jar/helpers/svg-jar';

interface Signature {
  Args: {
    currentRoute: string;
    value: string;
    label: string;
  };
}
export default class SidebarItem extends Component<Signature> {
  get isCurrentRoute() {
    return this.args.currentRoute === this.args.value;
  }

  get iconComponent() {
    return `${this.args.value}-icon` as string;
  }

  <template>
    <li>
      <LinkTo
        @route={{this.args.value}}
        class={{if
          this.isCurrentRoute
          "group flex gap-x-3 rounded-md p-2 text-sm font-semibold leading-6 bg-gray-800 text-white"
          "group flex gap-x-3 rounded-md p-2 text-sm font-semibold leading-6 text-gray-400 hover:bg-gray-800 hover:text-white"
        }}
      >
        {{svgJar this.iconComponent}}
        {{this.args.label}}
      </LinkTo>
    </li>
  </template>
}
