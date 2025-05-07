import RouteTemplate from 'ember-route-template';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { service } from '@ember/service';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { eq } from 'ember-truth-helpers';

import type RouterService from '@ember/routing/router-service';

interface SubmissionsRouteSignature {
  Args: {
    model: any;
  };
}

class SubmissionsComponent extends Component<SubmissionsRouteSignature> {
  @service declare router: RouterService;

  @tracked filterStatus: string | null = null;
  @tracked searchQuery: string | null = null;
  @tracked sortDirection: string = 'asc';
  @tracked currentPage = 1;
  @tracked pageSize = 10;

  get filteredSubmissions() {
    if (this.filterStatus) {
      return this.args.model.filter(
        (submission: any) => submission.aggregatedDepositStatus === this.filterStatus
      );
    }
    return this.args.model;
  }

  get totalResults() {
    return this.filteredSubmissions.length;
  }

  get totalPages() {
    return Math.ceil(this.totalResults / this.pageSize);
  }

  get paginatedSubmissions() {
    let start = (this.currentPage - 1) * this.pageSize;
    let end = start + this.pageSize;
    return this.filteredSubmissions.slice(start, end);
  }

  get showingFrom() {
    return (this.currentPage - 1) * this.pageSize + 1;
  }

  get showingTo() {
    return Math.min(this.currentPage * this.pageSize, this.totalResults);
  }

  get pageNumbers() {
    return Array.from({ length: this.totalPages }, (_, i) => i + 1);
  }

  @action
  navigateToSubmission(submissionId: string) {
    this.router.transitionTo('submission', submissionId);
  }

  @action
  updateFilter(status: string) {
    this.filterStatus = status;
  }

  @action
  updateSearchQuery(query: string) {
    this.searchQuery = query;
  }

  @action
  toggleSortDirection() {
    this.sortDirection = this.sortDirection === 'asc' ? 'desc' : 'asc';
  }

  @action goToPage(page) {
    if (page >= 1 && page <= this.totalPages) {
      this.currentPage = page;
    }
  }

  @action nextPage() {
    this.goToPage(this.currentPage + 1);
  }

  @action prevPage() {
    this.goToPage(this.currentPage - 1);
  }

  <template>
    <div class="px-4 sm:px-6 lg:px-8">
      <div class="sm:flex sm:items-center">
        <div class="sm:flex-auto">
          <h2 class="text-xl font-semibold text-gray-900 mb-4">Submissions</h2>
        </div>
      </div>
      <div class="mt-8 flow-root">
        <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
          <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
            <div class="overflow-hidden shadow ring-1 ring-black/5 sm:rounded-lg">
              <table class="min-w-full divide-y divide-gray-300">
                <thead class="bg-gray-50">
                  <tr>
                    <th
                      scope="col"
                      class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-gray-900 sm:pl-6"
                    >Title</th>
                    <th
                      scope="col"
                      class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"
                    >DOI</th>
                    <th
                      scope="col"
                      class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"
                    >Repositories</th>
                    <th
                      scope="col"
                      class="px-3 py-3.5 text-left text-sm font-semibold text-gray-900"
                    >Status</th>
                    <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-6">
                      <span class="sr-only">View Details</span>
                    </th>
                  </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 bg-white">
                  {{#each this.paginatedSubmissions as |submission|}}
                    {{! template-lint-disable no-invalid-interactive }}
                    <tr
                      class="cursor-pointer hover:bg-gray-50"
                      {{on "click" (fn this.navigateToSubmission submission.id)}}
                    >
                      <td
                        class="truncate max-w-xs whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900 sm:pl-6"
                      >
                        {{submission.publication.title}}
                      </td>
                      <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                        {{submission.publication.doi}}
                      </td>
                      <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                        <div class="flex flex-wrap gap-2">
                          {{#each submission.repositories as |repository|}}
                            <span class="bg-gray-100 px-2 py-1 rounded">{{repository.name}}</span>
                          {{/each}}
                        </div>
                      </td>
                      <td class="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                        <span
                          class="inline-flex items-center px-3 py-0.5 rounded-full text-sm font-medium
                            {{if
                              (eq submission.submissionStatus 'DRAFT')
                              'bg-yellow-100 text-yellow-800'
                              (if
                                (eq submission.submissionStatus 'SUBMITTED')
                                'bg-green-100 text-green-800'
                                'bg-red-100 text-red-800'
                              )
                            }}"
                        >
                          {{submission.submissionStatus}}
                        </span>
                      </td>
                      <td
                        class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6"
                      >
                        <span class="text-gray-400 hover:text-gray-600">
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            class="h-5 w-5"
                            viewBox="0 0 20 20"
                            fill="currentColor"
                          >
                            <path
                              fill-rule="evenodd"
                              d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                              clip-rule="evenodd"
                            />
                          </svg>
                        </span>
                      </td>
                    </tr>
                  {{/each}}
                </tbody>
                <tfoot>
                  <tr>
                    <td colspan="5" class="!p-0">
                      <div class="flex items-center justify-between bg-white px-4 py-3 sm:px-6">
                        <div class="flex flex-1 justify-between sm:hidden">
                          <button
                            type="button"
                            class="relative inline-flex items-center rounded-md border border-gray-300 bg-white px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50"
                            {{on "click" this.prevPage}}
                            disabled={{eq this.currentPage 1}}
                          >Previous</button>
                          <button
                            type="button"
                            class="relative ml-3 inline-flex items-center rounded-md border border-gray-300 bg-white px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50"
                            {{on "click" this.nextPage}}
                            disabled={{eq this.currentPage this.totalPages}}
                          >Next</button>
                        </div>
                        <div class="hidden sm:flex sm:flex-1 sm:items-center sm:justify-between">
                          <div>
                            <p class="text-sm text-gray-700">
                              Showing
                              <span class="font-medium">{{this.showingFrom}}</span>
                              to
                              <span class="font-medium">{{this.showingTo}}</span>
                              of
                              <span class="font-medium">{{this.totalResults}}</span>
                              results
                            </p>
                          </div>
                          <div>
                            <nav
                              class="isolate inline-flex -space-x-px rounded-md shadow-sm"
                              aria-label="Pagination"
                            >
                              <button
                                type="button"
                                class="relative inline-flex items-center rounded-l-md px-2 py-2 text-gray-400 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0"
                                {{on "click" this.prevPage}}
                                disabled={{eq this.currentPage 1}}
                              >
                                <span class="sr-only">Previous</span>
                                <svg
                                  class="size-5"
                                  viewBox="0 0 20 20"
                                  fill="currentColor"
                                  aria-hidden="true"
                                  data-slot="icon"
                                >
                                  <path
                                    fill-rule="evenodd"
                                    d="M11.78 5.22a.75.75 0 0 1 0 1.06L8.06 10l3.72 3.72a.75.75 0 1 1-1.06 1.06l-4.25-4.25a.75.75 0 0 1 0-1.06l4.25-4.25a.75.75 0 0 1 1.06 0Z"
                                    clip-rule="evenodd"
                                  />
                                </svg>
                              </button>
                              {{#each this.pageNumbers as |page|}}
                                <button
                                  type="button"
                                  class="relative inline-flex items-center px-4 py-2 text-sm font-semibold
                                    {{if
                                      (eq page this.currentPage)
                                      'z-10 bg-indigo-600 text-white focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600'
                                      'text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0'
                                    }}"
                                  aria-current={{if (eq page this.currentPage) "page"}}
                                  {{on "click" (fn this.goToPage page)}}
                                >{{page}}</button>
                              {{/each}}
                              <button
                                type="button"
                                class="relative inline-flex items-center rounded-r-md px-2 py-2 text-gray-400 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0"
                                {{on "click" this.nextPage}}
                                disabled={{eq this.currentPage this.totalPages}}
                              >
                                <span class="sr-only">Next</span>
                                <svg
                                  class="size-5"
                                  viewBox="0 0 20 20"
                                  fill="currentColor"
                                  aria-hidden="true"
                                  data-slot="icon"
                                >
                                  <path
                                    fill-rule="evenodd"
                                    d="M8.22 5.22a.75.75 0 0 1 1.06 0l4.25 4.25a.75.75 0 0 1 0 1.06l-4.25 4.25a.75.75 0 0 1-1.06-1.06L11.94 10 8.22 6.28a.75.75 0 0 1 0-1.06Z"
                                    clip-rule="evenodd"
                                  />
                                </svg>
                              </button>
                            </nav>
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
}

export default RouteTemplate(SubmissionsComponent);
