import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
import adapter from "svelte-adapter-appengine";

/** @type {import('@sveltejs/kit').Config} */
const config = {
  preprocess: vitePreprocess(), 

  kit: {
   adapter: adapter(),
  },
};

export default config;