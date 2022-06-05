<template>
    <div v-if="!isLoggedIn">
        <div>
            <!-- <div v-if="isLoggedIn">
                <form @submit.prevent="logoutUser()" class="sign-up-form">
                <input type="submit" value="Logout" class="logout-button" />
                </form>
                <table class="table">
                    <thead class="thead-dark">
                    <tr class="table-headers">
                        <th scope="col">ID</th>
                        <th scope="col">email</th>
                        <th scope="col">Token</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="table-rows">
                        <th class="table-row">User</th>
                        <td class="table-row table-row-username">Email</td>
                        <td class="table-row">Token</td>
                    </tr>
                    </tbody>
                </table>
            </div> -->
            <div v-if="currentForm.toLowerCase() === 'register'" class="flex items-center w-full max-w-md p-6 mx-auto my-8 rounded-md border-2">
                <div class="flex-1">
                    <div class="text-center">
                        <h2 class="text-4xl font-bold text-center text-gray-700">Patient</h2>
                        <p class="mt-3 text-gray-500">Sign up to use the hospital services</p>
                    </div>
                    <div class="mt-8">
                        <form @submit.prevent="registerUser()">
                            <div>
                              <input v-model="signUp.name" type="text" name="name" id="name" placeholder="Name" class="block w-full px-4 py-2 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-10" />
                            </div>
                            <div class="mt-6">
                              <input v-model="signUp.phone" type="tel" name="phone" id="email" placeholder="Phone" class="block w-full px-4 py-2 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-10" />
                            </div>
                            <div class="mt-6">
                              <input v-model="signUp.email" type="email" name="email" id="email" placeholder="Email" class="block w-full px-4 py-2 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-10" />
                            </div>
                            <div class="mt-6">
                              <input v-model="signUp.password" type="password" name="password" id="password" placeholder="Password" class="block w-full px-4 py-2 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-10" />
                            </div>
                            <div class="mt-6">
                              <input type="submit" value="Register" class="w-full px-4 py-2 tracking-wide text-white transition-colors duration-200 transform bg-blue-500 rounded-md hover:bg-blue-400 focus:outline-none focus:bg-blue-400 focus:ring focus:ring-blue-300 focus:ring-opacity-50"/>
                            </div>
                        </form>
                        <p class="mt-6 text-sm text-center text-gray-400">
                          Already have an account?
                          <a href="#" @click.prevent="toggleForm()" class="text-blue-500 focus:outline-none focus:underline hover:underline">Sign in</a>
                        </p>
                    </div>
                </div>
            </div>
            <div v-else class="flex items-center w-full max-w-md p-6 mx-auto my-8 rounded-md border-2">
                <div class="flex-1">
                    <div class="text-center">
                        <h2 class="text-4xl font-bold text-center text-gray-700">User</h2>
                        <p class="mt-3 text-gray-500">Sign in to access your account</p>
                    </div>
                    <div class="mt-8">
                        <form @submit.prevent="loginUser()">
                            <div>
                                <input v-model="signIn.email" type="email" name="email" id="email" placeholder="Email" class="block w-full px-4 py-2 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-10" />
                            </div>
                            <div class="mt-6">
                                <input v-model="signIn.password" type="password" name="password" id="password" placeholder="Password" class="block w-full px-4 py-2 mt-2 text-gray-700 placeholder-gray-400 bg-white border border-gray-200 rounded-md focus:ring-blue-400 focus:outline-none focus:ring focus:ring-opacity-10" />
                            </div>
                            <div class="mt-6">
                                <input type="submit" value="Login" class="w-full px-4 py-2 tracking-wide text-white transition-colors duration-200 transform bg-blue-500 rounded-md hover:bg-blue-400 focus:outline-none focus:bg-blue-400 focus:ring focus:ring-blue-300 focus:ring-opacity-50"/>
                            </div>
                        </form>
                        <p class="mt-6 text-sm text-center text-gray-400">
                          Don&#x27;t have an account yet?
                          <a href="#" @click.prevent="toggleForm()" class="text-blue-500 focus:outline-none focus:underline hover:underline">Sign up</a>
                        </p>
                    </div>
                </div>
            </div>
            <!-- <div>
                <h3>Sign Up!</h3>
                    <form @submit.prevent="registerUser()" class="sign-up-form">
                        <input type="text" v-model="signUp.name" placeholder="Name" />
                        <br />
                        <input class="sign-up-form-email" type="email" v-model="signUp.email" placeholder="Email" />
                        <br />
                        <input type="number" min="14" v-model="signUp.age" placeholder="Age" />
                        <br />
                        <input type="text" v-model="signUp.gender" placeholder="Gender" />
                        <br />
                        <input type="password" class="sign-up-form-password" v-model="signUp.password" placeholder="Password"/>
                        <br />
                        <input type="submit" value="Sign up" class="sign-up-form-submit" />
                    </form>
                <hr />
                <br />
                <h3>Login!</h3>
                <form @submit.prevent="loginUser()" class="login-form">
                    <input class="login-form-email" type="text" v-model="signIn.email" placeholder="Email" />
                    <br />
                    <input class="login-form-password" type="password" v-model="signIn.password" placeholder="Password" />
                    <br />
                    <input type="submit" value="Login" class="login-form-submit"/>
                </form>
            </div> -->
        </div>
    </div>
</template>

<script>

export default {
    name: "AuthView",
    data() {
        return {
          signUp: {},
          signIn: {},
          currentForm: 'login'
        };
    },
    
    methods: {

      toggleForm() {
        this.currentForm = this.currentForm === 'login' ? 'register' : 'login';
      },

      setError (error, text) {
        this.error = (error.response && error.response.data && error.response.data.error) || text;
        console.log(this.error);
      },

      registerUser() {
        let data = {
          patient: {
            name: this.signUp.name,
            gender: this.signUp.gender,
            age: this.signUp.age,
            user_attributes: {
              email: this.signUp.email,
              password: this.signUp.password,
            }
          }
        };
        this.axiosPlain.post('/patients', data)
          .then(response => {
            this.setUserToken(response.headers["authorization"]);
            this.resetForm();
          })
          .catch(error => this.setError(error, 'Cannot register'));
      },

      loginUser() {
        let data = {
          user: {
            email: this.signIn.email,
            password: this.signIn.password,
            },
        };
        this.axiosPlain.post('/users/sign_in', data)
          .then(response => {
            console.log(response);
            if(response.headers["authorization"]){
              this.setUserToken(response.headers["authorization"]);
              this.resetForm();
              if(this.$route.query.redirect){
                this.$router.replace(this.$route.query.redirect);
              }
            }
        })
          .catch(error => this.setError(error, 'Cannot login Invalid email/password combination'));
      },
        
      logoutUser() {
        this.axiosPlain.delete('/users/sign_out')
          .then(response => {
            console.log(response);
            this.resetUserToken();
          })
          .catch(error => this.setError(error, 'Cannot logout'))
      },

      setUserToken(token) {
        this.$localStorage.auth_token = token;
      },

      resetUserToken(){
        this.$localStorage.auth_token = '';
      },

      resetForm() {
        this.signUp = {};
        this.signIn = {};
      }
    },
    
    computed: {
      isLoggedIn() {
        return this.$localStorage.auth_token
      },
    }
}
</script>

<style scoped>
.sm-title {
  font-size: 2.5rem;
  font-weight: bold;
  text-align: center;
  font-family: "Roboto", sans-serif;
}
.container {
  width: 90%;
  margin: 0 auto;
}
.sm-card {
  width: 75%;
  padding: 20px;
  margin: 0 auto;
  height: 25em;
  border-radius: 10px;
  box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
}
.sign-up-form {
  width: 100%;
}
.sign-up-form-email {
  width: 55%;
  padding: 10px;
  margin: 0 auto;
  border-radius: 5px;
  border: 1px solid #ccc;
}
.sign-up-form-password {
  width: 55%;
  padding: 10px;
  margin: 0 auto;
  border-radius: 5px;
  border: 1px solid #ccc;
}
.sign-up-form-submit {
  width: 15%;
  padding: 1em;
  margin: 0 auto;
  border-radius: 5px;
  background-color: #1a77ce;
  color: #fff;
  border: none;
}
.sign-up-form-submit:hover {
  background-color: #0d5c8a;
  cursor: pointer;
}
.login-form {
  width: 100%;
}
.login-form-email {
  width: 55%;
  padding: 10px;
  margin: 0 auto;
  border-radius: 5px;
  border: 1px solid #ccc;
}
.login-form-password {
  width: 55%;
  padding: 10px;
  margin: 0 auto;
  border-radius: 5px;
  border: 1px solid #ccc;
}
.login-form-submit {
  width: 15%;
  padding: 1em;
  margin: 0 auto;
  border-radius: 5px;
  background-color: #1a77ce;
  color: #fff;
  border: none;
}
.login-form-submit:hover {
  background-color: #0d5c8a;
  cursor: pointer;
}
.logout-button {
  width: 15%;
  padding: 1em;
  margin: 0 auto;
  border-radius: 5px;
  background-color: #1a77ce;
  color: #fff;
  border: none;
}
.logout-button:hover {
  background-color: #0d5c8a;
  cursor: pointer;
}
.table-headers {
  background-color: #2b3b49;
  color: #fff;
  max-width: 90%;
  margin: 0 auto;
}
.table-rows {
  background-color: #f2f2f2;
  margin: 0 auto;
}
.table-row {
  word-break: break-all;
  text-align: center;
  padding: 10px;
}
.table-row-username {
  width: 30%;
}
</style>