<template>
  {{#if @isOpen}}
    <div class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-40">
      <div class="bg-white rounded-lg shadow-lg w-full max-w-md p-6 relative">
        <button
          type="button"
          class="absolute top-4 right-4 text-gray-400 hover:text-gray-600"
          {{on "click" @onClose}}
        >
          <svg
            class="h-5 w-5"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            viewBox="0 0 24 24"
          ><path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" /></svg>
        </button>
        <h2 class="text-base font-semibold mb-4">Edit Deposit Status</h2>
        <label class="block text-sm font-medium mb-2" for="deposit-status">Deposit Status</label>
        <select
          id="deposit-status"
          class="w-full mb-4 border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
        >
          <option>Accepted</option>
          <option>In Progress</option>
          <option>Rejected</option>
          <option>Failed</option>
        </select>
        <label for="deposit-status-message" class="block text-sm font-medium mb-2">Message</label>
        <textarea
          id="deposit-status-message"
          class="w-full h-24 border border-gray-300 rounded-md p-2 mb-6 resize-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
          placeholder="Add deposit status message ..."
        ></textarea>
        <button
          type="button"
          class="w-full rounded-md bg-indigo-600 px-4 py-2 text-white font-semibold hover:bg-indigo-700"
          {{on "click" @onClose}}
        >Save</button>
      </div>
    </div>
  {{/if}}
</template>
