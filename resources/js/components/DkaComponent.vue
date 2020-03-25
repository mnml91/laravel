<template>
    <div class="container">
        <div class="row">
            <div class="col-6">
                <line-chart-component></line-chart-component>
            </div>
            <div class="col-6">
                <pie-chart-component></pie-chart-component>
            </div>
        </div>
    </div>
</template>

<script>
    import LineChartComponent from "./LineChartComponent";
    import PieChartComponent from "./PieChartComponent";
    export default {
        name: "DkaComponent",
        components: {
            LineChartComponent,
            PieChartComponent
        }
    }
</script>

<style scoped>

</style>
