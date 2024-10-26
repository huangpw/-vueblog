<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style>
#app {
  max-width: 960px;
  margin: 0 auto;
}

::-webkit-scrollbar {
  width: 6px;
  height: 6px;
}

::-webkit-scrollbar-track {
  background: rgb(246, 248, 250);
  border-radius: 2px;
}
::-webkit-scrollbar-thumb {
  background: #e2e3e4;
  /* 去掉滑块圆角 */
  /* border-radius: 10px; */
}
::-webkit-scrollbar-thumb:hover {
  background: #c7c9cc;
}
</style>
