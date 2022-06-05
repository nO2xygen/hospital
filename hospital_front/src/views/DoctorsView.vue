<template>
    <div>
        <div class="bg-white rounded-lg">
            <select v-model="doctorsFilter">
                <option value="All">Select Doctor's Specialty</option>
                <option v-for="spec in uniqueSpecialties" :key="spec" :value="spec">
                    {{spec}}
                </option>
            </select>
            <ul class="divide-y-2 divide-gray-100">
                <li v-for="doc in specialtyFilter" :key="doc.id" class="p-3">
                    <router-link :to="`/doctors/${doc.id}`">
                        <h3>{{doc.name}}</h3>
                        <h6 class='my-1'>{{doc.specialty.name}}</h6>
                        <router-link :to="{ path: `/doctors/${doc.id}`, hash: '#newAppointment' }">
                            <button :disabled="doc.appointments_in_progress >= 10" class="bg-blue-500 rounded-md hover:bg-blue-400 p-2 text-white">make an appointment</button>
                        </router-link>
                    </router-link>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
export default {
    name: 'DoctorsView',
    data() {
        return {
            doctors: [],
            doctorsFilter: 'All',
        }
    },

    created() {
        this.axiosPlain.get('/doctors')
            .then(response => { 
                this.doctors = response.data; })
            .catch(error => this.setError(error, 'Something went wrong'));
    },

    computed: {
        uniqueSpecialties(){
            return this.doctors.map(x => x.specialty.name).filter((v,i,s) => s.indexOf(v) === i)
        },
        specialtyFilter(){
            if (this.doctorsFilter != 'All'){
                return this.doctors.filter((doctors) => {
                return (doctors.specialty.name == this.doctorsFilter);
                })
            }
            return this.doctors;
        },
    }
}
</script>

<style>

</style>

