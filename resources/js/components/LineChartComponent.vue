<template>
    <div>
        <line-chart :chart-data="data" :options="options" :height="200"></line-chart>
        <button class="btn btn-sm btn-danger" @click="update">Update</button>
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
                axios.get('/chart-line-data').then(response => {
                    this.data = response.data
                })
            }
        }
    }
</script>
