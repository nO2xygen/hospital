<template>
    <div>
        <ul class="flex flex-wrap flex-col gap-y-8">
            <li class="flex flex-wrap flex-col" v-for="app in appointments" :key="app.id">
                <span>Name: {{app.name}}</span>
                <span>Description: {{app.description}}</span>
                <span>Doctor: {{app.doctor.name}}</span>
                <span>Status: {{app.completed ? 'completed' : 'in progress'}}</span>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    name: 'AppointmentsView',
    data() {
        return {
            appointments: []
        }
    },
    
    created() {
        this.axiosPlain.get('/appointments')
            .then(response => { 
                console.log(response.data);
                this.appointments = response.data;
            })
            .catch(error => console.log(error));
    },

    methods: {
        setError (error, text) {
            this.error = (error.response && error.response.data && error.response.data.error) || text;
            console.log(this.error);
        },
    }
}
</script>

<style>

</style>