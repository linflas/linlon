<script lang="ts">
    import  Day from '$lib/Day.svelte';
    export let startday:number;
    export let startdate:number;
    export let times:number[]=[0,0,0,0,0,3,0];
    //Vilken är den sista dagen i månaden
    const numDays = (y:number, m:number) => new Date(y, m, 0).getDate();

    let days: number[]=[];
    //Skapar ett Dateobjekt från medskickade siffervärdet (antal ticks sedan 1970...)
    let date:Date = new Date(startdate);
        
    //Fyller i datum i veckans dagar
    for(let i=0;i<7;i++){
       //Är det dagen efter den sista i månaden så börjar datum om på 1
        if(startday+i>numDays(date.getFullYear(),date.getMonth()+1)){
            startday=1-i;
        }
        days[i]=startday+i;
    }
      
</script>
<!--Rita veckans dagar skicka med dagens nummer i månaden och arbetstid-->
 {#each days as day, i}   
<Day {day} time={times[i]}/>
{/each}