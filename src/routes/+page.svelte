<script lang="ts">
    import Week from '$lib/Week.svelte';

    const monthNames:string[]=["Januari","Februari","Mars","April","Maj","Juni","Juli","Augusti","September","Oktober","November","December"];
    import {onMount} from 'svelte';
    //Sätt startdatum till 1:e Januari i nuvarande år
    let now=new Date();
    let startdate=new Date(now.getFullYear(),0,1);
    //Om startdatum är en söndag så sätt startdatum 6 dagar bakåt
    if(startdate.getDay()==0)
        startdate.setDate(startdate.getDate()-6);
    //Annars så många dagar bak som man kommit in i veckan
        else   
        startdate.setDate(startdate.getDate()-startdate.getDay()+1);
    
    // Initierar variabler för kontroll av månadsbryt
    //Month är månadens nummer 0-11    
    let month=0;
    //Row är hur många veckor månaden varat
    let week=1;
    //MonthHeights är en vektor som lagrat höjden av varje månad i pixlar.
    let monthHeights:string[]=[];
    
    //Funktion som flyttar fram datum en vecka samt byter månad i veckan efter att månadsbryt inträffat
    const nextStartDate = (date:Date) =>{
        //Lagrar datumet för dagen veckan startar
        let olddate=date.getDate();
        //Flytta fram datum 7 dagar
        date.setDate(olddate+7);
        // Om nya datumet är mindre än det gamla så har månadsbryt inträffat. Månad måste innehålla mer äm 1 vecka annars bryts januari direkt.
        if((date.getDate()<olddate && week>1))
        {
            //höjden lagras i monthHeigts
            monthHeights[month]=week*112+"px";
            //månaden flyttas fram
            month++;
            //rader återställs
            week=0;
          
        }
        //Nästa vecka
        week++;
        return date;
    };

    let leftclass = "left-dark";

    const toggleClass = () =>{
        if(leftclass=="left-dark")
            leftclass="left-light";
        else
            leftclass="left-dark";
        return leftclass;
    }

</script>

<style>
:root{

    overflow: hidden;
}
 


   
    
     p{
        writing-mode: vertical-lr;
        transform: rotate(180deg);
        
     }

    

    
</style>
<div class="toplevel">
    <div class="inline-flex text-center"><div class="w-20 text-center border border-black">2023</div><div class="w-28 border border-l-0 border-black">Måndag</div><div class="w-28  border border-l-0 border-black">Tisdag</div><div class="w-28 border border-l-0 border-black">Onsdag</div><div class="w-28 border border-l-0 border-black">Torsdag</div><div class="w-28 border border-l-0 border-black">Fredag</div><div class="w-28 border border-l-0 border-black">Lördag</div><div class="w-28 border border-l-0 border-black">Söndag</div></div>

    <!-- Ritar upp rader med kompletta veckor! Varje vecka startar på datum startdate -->
    <div class="flex items-stretch overflow-y-scroll" style="height: 100vh; width:fit-content;">
        <div class="w-20 text-3xl">
            {#each monthHeights as height, i(i)}
                {#if i%2==0}<div class="flex border-b border-r border-black bg-purple-300" style="height: {height};"><p class="m-auto">{monthNames[i]}</p></div>
                {:else}<div class="flex border-b border-r border-black"style="height: {height};"><p class="m-auto">{monthNames[i]}</p></div>{/if}{/each}
        </div>
            <div class="kalendar">
                <div><Week startday={startdate.getDate()} startdate={startdate.valueOf()} /></div>
                {#each Array(53) as _ , i (i)}
                <div><Week startday={nextStartDate(startdate).getDate()} startdate={startdate.valueOf()} /></div>
                {/each}
        </div>
    </div>
</div>

