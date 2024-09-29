<script lang="ts">
    //Props
    export let day:number=0;
    export let time:number=0;
  
    

</script>

<!--Rita upp rutor som representerar dag-->
<div class="size-28 bg-lime-50 inline-flex border-r border-b border-black">
    <div class="bg-blue-200 w-full h-5 px-1">
        <p class="text-sm text-black font-bold float-left">{day}</p>
        <p class="text-sm text-black float-right">{time}</p>
    </div>
 </div>