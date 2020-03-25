<template>
    <div>
        <line-chart :chart-data="data" :options="options" :height="200"></line-chart>
    </div>
</template>

<script>
    import LineChart from "./LineChart";
    export default {
        name: "LineChartComponent",
        components: {LineChart},
        data() {
          return {
              data: [],
              options: {
                  responsive: true,
                  maintainAspectRation: true
              }
          }
        },
        mounted() {
            this.update()
        },
        methods: {
            update() {
                axios.get('/chart-data').then(response => {
                    this.data = response.data
                })
            }
        }
    }
</script>
