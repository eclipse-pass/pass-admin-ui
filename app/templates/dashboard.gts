import RouteTemplate from 'ember-route-template';
import Component from '@glimmer/component';

interface SubmissionsRouteSignature {
  Args: {
    model: any;
  };
}

class DashboardComponent extends Component<SubmissionsRouteSignature> {
  placeholder = 'hi';
  <template>
    <h2 class="text-xl font-semibold text-gray-900 mb-4">Dashboard</h2>

    <!-- Second simple stat cards block -->
    <div class="mt-8">
      <h3 class="text-base font-semibold text-gray-900">Last 30 days</h3>
      <dl class="mt-5 grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
        <div
          class="relative overflow-hidden rounded-lg bg-white px-4 pb-12 pt-5 shadow sm:px-6 sm:pt-6"
        >
          <dt>
            <div class="absolute rounded-md bg-indigo-500 p-3">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-6 text-white"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m3.75 9v6m3-3H9m1.5-12H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z"
                />
              </svg>

            </div>
            <p class="ml-16 truncate text-sm font-medium text-gray-500">Total Deposits</p>
          </dt>
          <dd class="ml-16 flex items-baseline pb-6 sm:pb-7">
            <p class="text-2xl font-semibold text-gray-900">71,897</p>
            <p class="ml-2 flex items-baseline text-sm font-semibold text-green-600">
              <svg
                class="size-5 shrink-0 self-center text-green-500"
                viewBox="0 0 20 20"
                fill="currentColor"
                aria-hidden="true"
                data-slot="icon"
              >
                <path
                  fill-rule="evenodd"
                  d="M10 17a.75.75 0 0 1-.75-.75V5.612L5.29 9.77a.75.75 0 0 1-1.08-1.04l5.25-5.5a.75.75 0 0 1 1.08 0l5.25 5.5a.75.75 0 1 1-1.08 1.04l-3.96-4.158V16.25A.75.75 0 0 1 10 17Z"
                  clip-rule="evenodd"
                />
              </svg>
              <span class="sr-only"> Increased by </span>
              122
            </p>
            <div class="absolute inset-x-0 bottom-0 bg-gray-50 px-4 py-4 sm:px-6">
              <div class="text-sm">
                <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500">View all<span
                    class="sr-only"
                  > Total Deposits stats</span></a>
              </div>
            </div>
          </dd>
        </div>
        <div
          class="relative overflow-hidden rounded-lg bg-white px-4 pb-12 pt-5 shadow sm:px-6 sm:pt-6"
        >
          <dt>
            <div class="absolute rounded-md bg-indigo-500 p-3">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-6 text-white"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z"
                />
              </svg>

            </div>
            <p class="ml-16 truncate text-sm font-medium text-gray-500">Avg. Success Rate</p>
          </dt>
          <dd class="ml-16 flex items-baseline pb-6 sm:pb-7">
            <p class="text-2xl font-semibold text-gray-900">58.16%</p>
            <p class="ml-2 flex items-baseline text-sm font-semibold text-green-600">
              <svg
                class="size-5 shrink-0 self-center text-green-500"
                viewBox="0 0 20 20"
                fill="currentColor"
                aria-hidden="true"
                data-slot="icon"
              >
                <path
                  fill-rule="evenodd"
                  d="M10 17a.75.75 0 0 1-.75-.75V5.612L5.29 9.77a.75.75 0 0 1-1.08-1.04l5.25-5.5a.75.75 0 0 1 1.08 0l5.25 5.5a.75.75 0 1 1-1.08 1.04l-3.96-4.158V16.25A.75.75 0 0 1 10 17Z"
                  clip-rule="evenodd"
                />
              </svg>
              <span class="sr-only"> Increased by </span>
              5.4%
            </p>
            <div class="absolute inset-x-0 bottom-0 bg-gray-50 px-4 py-4 sm:px-6">
              <div class="text-sm">
                <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500">View all<span
                    class="sr-only"
                  > Avg. Success Rate stats</span></a>
              </div>
            </div>
          </dd>
        </div>
        <div
          class="relative overflow-hidden rounded-lg bg-white px-4 pb-12 pt-5 shadow sm:px-6 sm:pt-6"
        >
          <dt>
            <div class="absolute rounded-md bg-indigo-500 p-3">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="size-6 text-white"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M7.498 15.25H4.372c-1.026 0-1.945-.694-2.054-1.715a12.137 12.137 0 0 1-.068-1.285c0-2.848.992-5.464 2.649-7.521C5.287 4.247 5.886 4 6.504 4h4.016a4.5 4.5 0 0 1 1.423.23l3.114 1.04a4.5 4.5 0 0 0 1.423.23h1.294M7.498 15.25c.618 0 .991.724.725 1.282A7.471 7.471 0 0 0 7.5 19.75 2.25 2.25 0 0 0 9.75 22a.75.75 0 0 0 .75-.75v-.633c0-.573.11-1.14.322-1.672.304-.76.93-1.33 1.653-1.715a9.04 9.04 0 0 0 2.86-2.4c.498-.634 1.226-1.08 2.032-1.08h.384m-10.253 1.5H9.7m8.075-9.75c.01.05.027.1.05.148.593 1.2.925 2.55.925 3.977 0 1.487-.36 2.89-.999 4.125m.023-8.25c-.076-.365.183-.75.575-.75h.908c.889 0 1.713.518 1.972 1.368.339 1.11.521 2.287.521 3.507 0 1.553-.295 3.036-.831 4.398-.306.774-1.086 1.227-1.918 1.227h-1.053c-.472 0-.745-.556-.5-.96a8.95 8.95 0 0 0 .303-.54"
                />
              </svg>

            </div>
            <p class="ml-16 truncate text-sm font-medium text-gray-500">Avg. Failure Rate</p>
          </dt>
          <dd class="ml-16 flex items-baseline pb-6 sm:pb-7">
            <p class="text-2xl font-semibold text-gray-900">24.57%</p>
            <p class="ml-2 flex items-baseline text-sm font-semibold text-red-600">
              <svg
                class="size-5 shrink-0 self-center text-red-500"
                viewBox="0 0 20 20"
                fill="currentColor"
                aria-hidden="true"
                data-slot="icon"
              >
                <path
                  fill-rule="evenodd"
                  d="M10 3a.75.75 0 0 1 .75.75v10.638l3.96-4.158a.75.75 0 1 1 1.08 1.04l-5.25 5.5a.75.75 0 0 1-1.08 0l-5.25-5.5a.75.75 0 1 1 1.08-1.04l3.96 4.158V3.75A.75.75 0 0 1 10 3Z"
                  clip-rule="evenodd"
                />
              </svg>
              <span class="sr-only"> Decreased by </span>
              3.2%
            </p>
            <div class="absolute inset-x-0 bottom-0 bg-gray-50 px-4 py-4 sm:px-6">
              <div class="text-sm">
                <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500">View all<span
                    class="sr-only"
                  > Avg. Failure Rate stats</span></a>
              </div>
            </div>
          </dd>
        </div>
      </dl>
    </div>

    <div>
      <dl
        class="mt-5 grid grid-cols-1 divide-y divide-gray-200 overflow-hidden rounded-lg bg-white shadow md:grid-cols-3 md:divide-x md:divide-y-0"
      >
        <div class="px-4 py-5 sm:p-6">
          <dt class="text-base font-normal text-gray-900">Total Submissions</dt>
          <dd class="mt-1 flex items-baseline justify-between md:block lg:flex">
            <div class="flex items-baseline text-2xl font-semibold text-indigo-600">
              71,897
              <span class="ml-2 text-sm font-medium text-gray-500">from 70,946</span>
            </div>

            <div
              class="inline-flex items-baseline rounded-full bg-green-100 px-2.5 py-0.5 text-sm font-medium text-green-800 md:mt-2 lg:mt-0"
            >
              <svg
                class="-ml-1 mr-0.5 size-5 shrink-0 self-center text-green-500"
                viewBox="0 0 20 20"
                fill="currentColor"
                aria-hidden="true"
                data-slot="icon"
              >
                <path
                  fill-rule="evenodd"
                  d="M10 17a.75.75 0 0 1-.75-.75V5.612L5.29 9.77a.75.75 0 0 1-1.08-1.04l5.25-5.5a.75.75 0 0 1 1.08 0l5.25 5.5a.75.75 0 1 1-1.08 1.04l-3.96-4.158V16.25A.75.75 0 0 1 10 17Z"
                  clip-rule="evenodd"
                />
              </svg>
              <span class="sr-only"> Increased by </span>
              12%
            </div>
          </dd>
        </div>
        <div class="px-4 py-5 sm:p-6">
          <dt class="text-base font-normal text-gray-900">Avg. Completion Rate</dt>
          <dd class="mt-1 flex items-baseline justify-between md:block lg:flex">
            <div class="flex items-baseline text-2xl font-semibold text-indigo-600">
              58.16%
              <span class="ml-2 text-sm font-medium text-gray-500">from 56.14%</span>
            </div>

            <div
              class="inline-flex items-baseline rounded-full bg-green-100 px-2.5 py-0.5 text-sm font-medium text-green-800 md:mt-2 lg:mt-0"
            >
              <svg
                class="-ml-1 mr-0.5 size-5 shrink-0 self-center text-green-500"
                viewBox="0 0 20 20"
                fill="currentColor"
                aria-hidden="true"
                data-slot="icon"
              >
                <path
                  fill-rule="evenodd"
                  d="M10 17a.75.75 0 0 1-.75-.75V5.612L5.29 9.77a.75.75 0 0 1-1.08-1.04l5.25-5.5a.75.75 0 0 1 1.08 0l5.25 5.5a.75.75 0 1 1-1.08 1.04l-3.96-4.158V16.25A.75.75 0 0 1 10 17Z"
                  clip-rule="evenodd"
                />
              </svg>
              <span class="sr-only"> Increased by </span>
              2.02%
            </div>
          </dd>
        </div>
        <div class="px-4 py-5 sm:p-6">
          <dt class="text-base font-normal text-gray-900">Avg. Abandon Rate</dt>
          <dd class="mt-1 flex items-baseline justify-between md:block lg:flex">
            <div class="flex items-baseline text-2xl font-semibold text-indigo-600">
              24.57%
              <span class="ml-2 text-sm font-medium text-gray-500">from 28.62%</span>
            </div>

            <div
              class="inline-flex items-baseline rounded-full bg-red-100 px-2.5 py-0.5 text-sm font-medium text-red-800 md:mt-2 lg:mt-0"
            >
              <svg
                class="-ml-1 mr-0.5 size-5 shrink-0 self-center text-red-500"
                viewBox="0 0 20 20"
                fill="currentColor"
                aria-hidden="true"
                data-slot="icon"
              >
                <path
                  fill-rule="evenodd"
                  d="M10 3a.75.75 0 0 1 .75.75v10.638l3.96-4.158a.75.75 0 1 1 1.08 1.04l-5.25 5.5a.75.75 0 0 1-1.08 0l-5.25-5.5a.75.75 0 1 1 1.08-1.04l3.96 4.158V3.75A.75.75 0 0 1 10 3Z"
                  clip-rule="evenodd"
                />
              </svg>
              <span class="sr-only"> Decreased by </span>
              4.05%
            </div>
          </dd>
        </div>
      </dl>
    </div>

    <div class="mt-8">
      <div class="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
        <div class="overflow-hidden rounded-lg bg-white px-6 py-8 shadow">
          <dt class="truncate text-sm font-medium text-gray-500">Total Submissions</dt>
          <dd class="mt-3 text-3xl font-semibold tracking-tight text-gray-900">71,897</dd>
        </div>
        <div class="overflow-hidden rounded-lg bg-white px-6 py-8 shadow">
          <dt class="truncate text-sm font-medium text-gray-500">Total Completed</dt>
          <dd class="mt-3 text-3xl font-semibold tracking-tight text-gray-900">41,815</dd>
        </div>
        <div class="overflow-hidden rounded-lg bg-white px-6 py-8 shadow">
          <dt class="truncate text-sm font-medium text-gray-500">Total Abandoned</dt>
          <dd class="mt-3 text-3xl font-semibold tracking-tight text-gray-900">30,082</dd>
        </div>
      </div>
    </div>
  </template>
}

export default RouteTemplate(DashboardComponent);
