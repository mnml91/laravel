<template>
    <div>
        <pie-chart :chart-data="data" :options="options" :height="200"></pie-chart>
        <button class="btn btn-sm btn-danger" @click="update">Update</button>
    </div>
</template>

<script>
    import PieChart from "./PieChart";
    export default {
        name: "PieChartComponent",
        components: {PieChart},
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
                axios.get('/chart-pie-data').then(response => {
                    this.data = response.data
                })
            }
        }
    }
</script>
