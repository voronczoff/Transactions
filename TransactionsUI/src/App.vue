<template>
  <v-app>
    <!-- <v-app-bar app>
      <v-toolbar-title class="headline text-uppercase">
        <span>SEO</span>
        <span class="font-weight-light">Article Parser</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
    </v-app-bar> -->

    <!-- <v-content> -->
    <router-view></router-view>

<!--       <Main/> -->
    <!-- </v-content> -->
  </v-app>
</template>

<script>
// import Main from './components/Main';

export default {
  name: 'App',
  components: {
    // Main,
  },
  data: () => ({
    //
  }),
};
</script>
