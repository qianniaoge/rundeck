<template>
  <div>
    <Options
      v-if="updatedData"
      :eventBus="eventBus"
      :options=options
      :editMode=editMode
    />
    <JsonEmbed
      :output-data="updatedData"
      field-name="workflowJsonData"
    />
  </div>
</template>

<script lang="ts">
  import Vue from 'vue';
  import VueCompositionAPI from '@vue/composition-api';
  import { defineComponent, ref, reactive } from '@vue/composition-api';
  import Options from '../../../components/job/workflow/Options.vue';
  import JsonEmbed from './JsonEmbed.vue';
  import {
    getRundeckContext,
    RundeckContext
  } from "@rundeck/ui-trellis";

  const w = window as any;
  const winRd = getRundeckContext() as any;

  Vue.use(VueCompositionAPI);

  export default defineComponent({
    name: 'WorkflowEditorSection',
    props: {
      eventBus: Object,
      recievedOptions: Array,
      editMode: Boolean
    },
    components: {
      Options,
      JsonEmbed
    },
    computed: {
    },
    watch:{
      updatedData(){
        w.jobWasEdited()
      }
    },
    methods: {
      async fetchWorkflowData() {
        if (winRd && winRd.rdBase && winRd.projectName) {
          this.rdBase = winRd.rdBase;
          this.project = winRd.projectName;
          const workflowData = {wfData: winRd.data.workflowData};
          this.updatedData = Object.assign(this, workflowData);
        };
      },
      async fetchOptions() {
        let options = this.updatedData.sessionOpts;
        if (!options) {
          await this.fetchWorkflowData();
          options = this.updatedData.scheduledExecution.options;
        };
        return options;
      }
    },
    async mounted() {
      await this.fetchOptions();
      await this.fetchWorkflowData();
    },
    data () {
      return {
        project: "",
        rdBase: "",
        options: [],
        updatedData: {}
      };
    }
  });
</script>
