<template>
  <HeaderComponent title="Dictionary" />
  <SectionComponent :wordSearched="wordSearched" :results="results" @transmitToApp="searchWord" />
  <FooterComponent />
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import HeaderComponent from './components/HeaderComponent.vue';
import SectionComponent from './components/SectionComponent.vue'
import FooterComponent from './components/FooterComponent.vue'


export default defineComponent({
  name: 'App',
  components: {
    HeaderComponent,
    SectionComponent,
    FooterComponent,
  },
  
  methods: {
        async searchWord(word = '') {
          this.wordSearched = true
          console.log('word: ', word)
          try {
            const response = await fetch('https://api.dictionaryapi.dev/api/v2/entries/en/'+word)
            // console.log(response)
            if (!response.ok) {
                throw new Error(`Network response was not ok: ${response.statusText}`);
            } else {
                const data = await response.json()
                console.log('data: ', data)
                this.results = data
            }
          } catch(error) {
            console.log('fetch error: ', error)
            this.results = []
          }
        }
    },
  data() {
    return {
      results: [],
      wordSearched: false
    }
  }
});
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
