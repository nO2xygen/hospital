<template>
  <div>
    <general-header/>
    <router-view class="container mx-auto md:flex md:flex-col md:justify-between md:items-center"/>
  </div>
</template>

<script>
import GeneralHeader from "./components/GeneralHeader.vue";

export default {
  name: "App",
  components: {
    GeneralHeader
  },
};
</script>

<style>

</style>
