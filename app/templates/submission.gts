import RouteTemplate from 'ember-route-template';
import Component from '@glimmer/component';
import { LinkTo } from '@ember/routing';

interface SubmissionsRouteSignature {
  Args: {
    model: any;
  };
}

class SubmissionsDetailComponent extends Component<SubmissionsRouteSignature> {
  placeholder = 'hi';
  <template>
    <div class="px-4 sm:px-6 lg:px-8">
      <div class="flex flex-col items-start">
        <div class="sm:flex-auto">
          <h2 class="text-xl font-semibold text-gray-900 mb-4">Submission Details</h2>
        </div>
        <LinkTo
          @route="submissions"
          class="inline-flex items-center gap-2 text-sm text-indigo-600 hover:underline mb-4"
        >
          <svg
            class="h-4 w-4"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            viewBox="0 0 24 24"
          >
            <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
          </svg>
          Back to Submissions
        </LinkTo>
      </div>
      <div class="mt-8 flow-root">
        <div class="bg-white rounded-lg shadow border border-gray-200">
          <div class="flex items-center justify-between px-8 pt-8 pb-4 border-b border-gray-100">
            <div>
              <h2 class="text-2xl font-semibold text-gray-900">{{@model.publication.title}}</h2>
              <p class="text-sm text-gray-500">DOI: {{@model.publication.doi}}</p>
            </div>
          </div>
          <div class="flex-1">
            <div class="grid grid-cols-1 md:grid-cols-12 gap-x-8">
              <!-- Grants row -->
              <div class="col-span-12 grid grid-cols-12 items-center border-b border-gray-200 py-6">
                <div class="col-span-4 text-right pr-4 px-8"><span
                    class="block text-sm font-medium text-gray-500"
                  >Grants</span></div>
                <div class="col-span-8 px-8"><span class="block text-sm text-gray-900">
                    {{#each @model.grants as |grant|}}
                      <div class="grant-item" data-test-submission-detail-grant>
                        <b>
                          {{grant.awardNumber}}
                        </b>
                        :
                        {{grant.projectName}}
                      </div>
                      <div class="grant-item" data-test-submission-detail-funder>
                        <b>
                          Funder
                        </b>
                        :
                        {{grant.primaryFunder.name}}
                      </div>
                    {{/each}}
                  </span></div>
              </div>
              <!-- Submitters row -->
              <div class="col-span-12 grid grid-cols-12 items-center border-b border-gray-200 py-6">
                <div class="col-span-4 text-right pr-4 px-8"><span
                    class="block text-sm font-medium text-gray-500"
                  >Submitters</span></div>
                <div class="col-span-8 flex items-center gap-2 px-8">
                  {{@model.submitterName}}
                  <div class="h-8 w-8 rounded-full bg-gray-200 flex items-center justify-center">
                    <span class="text-sm font-medium text-gray-600">S</span>
                  </div>
                  <span class="text-xs text-green-600 flex items-center gap-1"><svg
                      class="w-4 h-4 text-green-500"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="2"
                      viewBox="0 0 24 24"
                    ><path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M5 13l4 4L19 7"
                      /></svg>Submitter Accepted</span>
                </div>
              </div>
              <!-- Preparers row -->
              <div class="col-span-12 grid grid-cols-12 items-center border-b border-gray-200 py-6">
                <div class="col-span-4 text-right pr-4 px-8"><span
                    class="block text-sm font-medium text-gray-500"
                  >Preparers</span></div>
                <div class="col-span-8 flex items-center gap-2 px-8">
                  <div class="h-8 w-8 rounded-full bg-gray-200 flex items-center justify-center">
                    <span class="text-sm font-medium text-gray-600">P</span>
                  </div>
                  {{#each @model.preparers as |preparer index|}}
                    {{#if index}}
                      ,
                    {{/if}}
                    {{preparer.displayName}}
                    {{#if preparer.email}}
                      &nbsp;(
                      <a href="mailto:{{preparer.email}}">
                        {{preparer.email}}
                      </a>
                      )
                    {{/if}}
                  {{/each}}
                  <span class="text-xs text-blue-600 flex items-center gap-1"><svg
                      class="w-4 h-4 text-blue-500"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="2"
                      viewBox="0 0 24 24"
                    ><path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M21 8V6a2 2 0 00-2-2H5a2 2 0 00-2 2v2m16 0v10a2 2 0 01-2 2H5a2 2 0 01-2-2V8m16 0H3"
                      /></svg>Email sent</span>
                </div>
              </div>
              <!-- Repositories row -->
              <div class="col-span-12 grid grid-cols-12 items-center border-b border-gray-200 py-6">
                <div class="col-span-4 text-right pr-4 px-8"><span
                    class="block text-sm font-medium text-gray-500"
                  >Repositories</span></div>
                <div class="col-span-8 flex flex-wrap gap-2 px-8">
                  <span class="bg-gray-100 px-2 py-1 rounded text-xs">J Scholarship</span>
                  <span class="bg-gray-100 px-2 py-1 rounded text-xs">PubMed Central</span>
                </div>
              </div>
              <!-- Submission / Deposit Status row (no border below) -->
              <div class="col-span-12 grid grid-cols-12 items-start py-6">
                <div class="col-span-4 text-right pr-4 pt-2 px-8"><span
                    class="block text-sm font-medium text-gray-500"
                  >Submission / Deposit Status</span></div>
                <div class="col-span-8 px-8">
                  <div class="flex flex-col md:flex-row md:items-start md:gap-12">
                    <div class="flex flex-col gap-3 w-full md:w-72 mb-8 md:mb-0">
                      <button
                        type="button"
                        class="inline-flex gap-2 items-center justify-center rounded-md border border-indigo-600 text-indigo-600 bg-white px-3.5 py-2.5 text-sm font-semibold shadow-sm hover:bg-indigo-50 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                      >
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          fill="none"
                          viewBox="0 0 24 24"
                          stroke-width="1.5"
                          stroke="currentColor"
                          class="size-5"
                        >
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M16.023 9.348h4.992v-.001M2.985 19.644v-4.992m0 0h4.992m-4.993 0 3.181 3.183a8.25 8.25 0 0 0 13.803-3.7M4.031 9.865a8.25 8.25 0 0 1 13.803-3.7l3.181 3.182m0-4.991v4.99"
                          />
                        </svg>
                        Restart
                      </button>
                      <button
                        type="button"
                        class="inline-flex gap-2 items-center justify-center rounded-md border border-indigo-600 text-indigo-600 bg-white px-3.5 py-2.5 text-sm font-semibold shadow-sm hover:bg-indigo-50 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                      >
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          fill="none"
                          viewBox="0 0 24 24"
                          stroke-width="1.5"
                          stroke="currentColor"
                          class="size-5"
                        >
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M12 4.5v15m7.5-7.5h-15"
                          />
                        </svg>

                        Add Notes
                      </button>
                      <button
                        type="button"
                        class="inline-flex gap-2 items-center justify-center rounded-md border border-indigo-600 text-indigo-600 bg-white px-3.5 py-2.5 text-sm font-semibold shadow-sm hover:bg-indigo-50 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                      >
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          fill="none"
                          viewBox="0 0 24 24"
                          stroke-width="1.5"
                          stroke="currentColor"
                          class="size-5"
                        >
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10"
                          />
                        </svg>

                        Deposit Status
                      </button>
                      <button
                        type="button"
                        class="inline-flex gap-2 items-center justify-center rounded-md border border-indigo-600 text-indigo-600 bg-white px-3.5 py-2.5 text-sm font-semibold shadow-sm hover:bg-indigo-50 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                      >
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          fill="none"
                          viewBox="0 0 24 24"
                          stroke-width="1.5"
                          stroke="currentColor"
                          class="size-5"
                        >
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M21.75 6.75v10.5a2.25 2.25 0 0 1-2.25 2.25h-15a2.25 2.25 0 0 1-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25m19.5 0v.243a2.25 2.25 0 0 1-1.07 1.916l-7.5 4.615a2.25 2.25 0 0 1-2.36 0L3.32 8.91a2.25 2.25 0 0 1-1.07-1.916V6.75"
                          />
                        </svg>
                        View emails
                      </button>
                    </div>
                    <div class="flex-1">
                      <div class="flex flex-row items-start gap-8">
                        <nav aria-label="Progress">
                          <ol role="list" class="overflow-hidden">
                            <li class="relative pb-10">
                              <div
                                class="absolute left-4 top-4 -ml-px mt-0.5 h-full w-0.5 bg-indigo-600"
                                aria-hidden="true"
                              ></div>
                              <a href="#" class="group relative flex items-start">
                                <span class="flex h-9 items-center">
                                  <span
                                    class="relative z-10 flex size-8 items-center justify-center rounded-full bg-indigo-600 group-hover:bg-indigo-800"
                                  >
                                    <svg
                                      class="size-5 text-white"
                                      viewBox="0 0 20 20"
                                      fill="currentColor"
                                      aria-hidden="true"
                                      data-slot="icon"
                                    >
                                      <path
                                        fill-rule="evenodd"
                                        d="M16.704 4.153a.75.75 0 0 1 .143 1.052l-8 10.5a.75.75 0 0 1-1.127.075l-4.5-4.5a.75.75 0 0 1 1.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 0 1 1.05-.143Z"
                                        clip-rule="evenodd"
                                      />
                                    </svg>
                                  </span>
                                </span>
                                <span class="ml-4 flex min-w-0 flex-col">
                                  <span class="text-sm font-medium">SUBMISSION CREATED</span>
                                  <span class="text-sm text-gray-500">March 15, 2024</span>
                                </span>
                              </a>
                            </li>
                            <li class="relative pb-10">
                              <div
                                class="absolute left-4 top-4 -ml-px mt-0.5 h-full w-0.5 bg-indigo-600"
                                aria-hidden="true"
                              ></div>
                              <a
                                href="#"
                                class="group relative flex items-start"
                                aria-current="step"
                              >
                                <span class="flex h-9 items-center" aria-hidden="true">
                                  <span
                                    class="relative z-10 flex size-8 items-center justify-center rounded-full border-2 border-indigo-600 bg-white"
                                  >
                                    <span class="size-2.5 rounded-full bg-indigo-600"></span>
                                  </span>
                                </span>
                                <span class="ml-4 flex min-w-0 flex-col">
                                  <span class="text-sm font-medium text-indigo-600">IN PROGRESS</span>
                                  <span class="text-sm text-gray-500">March 16, 2024</span>
                                </span>
                              </a>
                            </li>
                            <li class="relative pb-10">
                              <div
                                class="absolute left-4 top-4 -ml-px mt-0.5 h-full w-0.5 bg-gray-300"
                                aria-hidden="true"
                              ></div>
                              <a href="#" class="group relative flex items-start">
                                <span class="flex h-9 items-center" aria-hidden="true">
                                  <span
                                    class="relative z-10 flex size-8 items-center justify-center rounded-full border-2 border-gray-300 bg-white group-hover:border-gray-400"
                                  >
                                    <span
                                      class="size-2.5 rounded-full bg-transparent group-hover:bg-gray-300"
                                    ></span>
                                  </span>
                                </span>
                                <span class="ml-4 flex min-w-0 flex-col">
                                  <span class="text-sm font-medium text-gray-500">SUBMITTED</span>
                                  <span class="text-sm text-gray-500">Pending</span>
                                </span>
                              </a>
                            </li>
                            <li class="relative pb-10">
                              <div
                                class="absolute left-4 top-4 -ml-px mt-0.5 h-full w-0.5 bg-gray-300"
                                aria-hidden="true"
                              ></div>
                              <a href="#" class="group relative flex items-start">
                                <span class="flex h-9 items-center" aria-hidden="true">
                                  <span
                                    class="relative z-10 flex size-8 items-center justify-center rounded-full border-2 border-gray-300 bg-white group-hover:border-gray-400"
                                  >
                                    <span
                                      class="size-2.5 rounded-full bg-transparent group-hover:bg-gray-300"
                                    ></span>
                                  </span>
                                </span>
                                <span class="ml-4 flex min-w-0 flex-col">
                                  <span class="text-sm font-medium text-gray-500">DEPOSIT IN
                                    PROGRESS</span>
                                  <span class="text-sm text-gray-500">Pending</span>
                                </span>
                              </a>
                            </li>
                            <li class="relative">
                              <a href="#" class="group relative flex items-start">
                                <span class="flex h-9 items-center" aria-hidden="true">
                                  <span
                                    class="relative z-10 flex size-8 items-center justify-center rounded-full border-2 border-gray-300 bg-white group-hover:border-gray-400"
                                  >
                                    <span
                                      class="size-2.5 rounded-full bg-transparent group-hover:bg-gray-300"
                                    ></span>
                                  </span>
                                </span>
                                <span class="ml-4 flex min-w-0 flex-col">
                                  <span class="text-sm font-medium text-gray-500">DEPOSIT ACCEPTED</span>
                                  <span class="text-sm text-gray-500">Pending</span>
                                </span>
                              </a>
                            </li>
                          </ol>
                        </nav>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="border-t border-gray-200">
            <div class="px-8 py-4">
              <div class="flex justify-between items-center">
                <button
                  type="button"
                  class="inline-flex items-center justify-center rounded-md bg-red-600 text-white px-3.5 py-2.5 text-sm font-semibold shadow-sm hover:bg-red-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600"
                >
                  Delete
                </button>
                <div class="flex gap-2">
                  <button
                    type="button"
                    class="rounded-md bg-white px-3.5 py-2.5 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
                  >Cancel</button>
                  <button
                    type="button"
                    class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                  >Save</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
}

export default RouteTemplate(SubmissionsDetailComponent);
