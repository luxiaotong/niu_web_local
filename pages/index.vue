<template>
  <div class="container">
    <div>
      <logo />
      <h1 class="title">
        简体中文
      </h1>
      <h2 class="subtitle">
        Country: {{$store.state.region}}
      </h2>
      <h2 class="subtitle">
        IP: {{$store.state.ip}}
      </h2>
      <div id="change_country">
        <button class="button--grey"> 中国 </button>
        <button class="button--grey" @click="change('en')"> 美国 </button>
        <button class="button--grey" @click="change('nl')"> 荷兰 </button>
        <button class="button--grey" @click="change('fr')"> 法国 </button>
        <button class="button--grey" @click="change('de')"> 德国 </button>
        <button class="button--grey" @click="change('jp')"> 日本 </button>
      </div>
    </div>
  </div>
</template>

<script>
import Logo from '~/components/Logo.vue'

export default {
    components: {
        Logo
    },
    methods: {
        change(country) {
            this.$cookies.set("country", country, { path: "/", maxAge: 60 * 60 * 24 * 7 });
            if ( country == 'cn' ) {
                location.href = process.env.baseUrlLocal
            } else {
                location.href = process.env.baseUrlGlobal + '/' + country
            }
        }
    }
}
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.title {
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
    'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
