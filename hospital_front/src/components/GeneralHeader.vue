<template>
  <div>
    <div class="bg-gray-100">
      <nav
        class="
          container
          p-8
          mx-auto
          md:flex md:justify-between md:items-center
        "
      >
        <div class="flex items-center justify-between">
          <router-link
            to="/"
            class="
              text-xl
              font-bold
              text-gray-800
              md:text-2xl
              hover:text-blue-400
            "
            >Hospital
          </router-link>
          <!-- Mobile menu button -->
          <div @click="showMenu = !showMenu" class="flex md:hidden">
            <button
              type="button"
              class="
                text-gray-800
                hover:text-gray-400
                focus:outline-none focus:text-gray-400
              "
            >
              <svg viewBox="0 0 24 24" class="w-6 h-6 fill-current">
                <path
                  fill-rule="evenodd"
                  d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"
                ></path>
              </svg>
            </button>
          </div>
        </div>


        <!-- Mobile Menu open: "block", Menu closed: "hidden" -->
        <ul
          :class="showMenu ? 'flex' : 'hidden'"
          class="
            flex-col
            mt-8
            space-y-4
            md:flex
            md:space-y-0
            md:flex-row
            md:items-center
            md:space-x-20
            md:mt-0
          "
        >
          <li class="text-sm font-bold text-gray-800 hover:text-blue-400">
            <router-link to="/doctors">Doctors</router-link>
          </li>
          <li class="text-sm font-bold text-gray-800 hover:text-blue-400">
            <router-link to="/appointments">Appointments</router-link>
          </li>
          <li class="text-sm font-bold text-gray-800 hover:text-blue-400" v-if="!isLoggedIn">
            <button>Sign Up</button>
          </li>
          <li class="text-sm font-bold text-gray-800 hover:text-blue-400" v-if="!isLoggedIn">
            <button>Sign In</button>
          </li>
          <li class="text-sm font-bold text-gray-800 hover:text-blue-400" v-if="isLoggedIn">
            <router-link to="/">Profile</router-link>
          </li>
          <li class="text-sm font-bold text-gray-800 hover:text-blue-400" v-if="isLoggedIn">
            <button @click="logoutUser()">Logout</button>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</template>
<script>
export default {
	data() {
		return {
			showMenu: false,
		};
	},

	computed: {
		isLoggedIn() {
			return this.$localStorage.auth_token
    }
  },

  methods: {
    logoutUser() {
      this.axiosPlain.delete('/users/sign_out')
        .then(response => {
          console.log(response);
          this.resetUserToken();
          this.$router.replace('/');
        })
        .catch(error => this.setError(error, 'Cannot logout'))
    },
    
    resetUserToken(){
      this.$localStorage.auth_token = '';
    },

    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text;
      console.log(this.error);
    },
  }

}
</script>