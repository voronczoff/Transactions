
<template>
  <div class="Main" id="Main">
    <v-card>
      <v-toolbar flat color="primary" dark>
        <v-spacer></v-spacer>
        <v-toolbar-title>Transactions</v-toolbar-title>
      </v-toolbar>
      <v-tabs vertical>
        <v-tab>Upload</v-tab>
        <v-tab>Get All Transactions</v-tab>
        <v-tab>Get by Currency</v-tab>
        <v-tab>Get by date range</v-tab>
        <v-tab>Get by status</v-tab>

        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <p>Upload from csv or xml file</p>
              <v-file-input ref="file" multiple label="File input" @change="onFilePicked" accept=".xml,.csv"></v-file-input>
              <v-btn v-if="file" @click.native="upload()">Upload</v-btn>
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <v-btn
                @click.native="getTransactions('https://localhost:5001/api/Transactions')"
              >Get All Transactions from DB</v-btn>
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <v-text-field label="currency" v-model="currency"></v-text-field>
              <v-btn
                @click.native="getTransactions('https://localhost:5001/api/Transactions/byCurrency/'+currency)"
              >Get Transactions by Currency</v-btn>
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <v-text-field label="dateFrom" v-model="dateFrom"></v-text-field>
              <v-text-field label="dateTo" v-model="dateTo"></v-text-field>
              <v-btn
                @click.native="getTransactions('https://localhost:5001/api/Transactions/byDateRange?startDate='+dateFrom+'&endDate='+dateTo)"
              >Get Transactions by date range</v-btn>
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card flat>
            <v-card-text>
              <v-text-field label="status" v-model="status"></v-text-field>
              <v-btn
                @click.native="getTransactions('https://localhost:5001/api/Transactions/byStatus/'+status)"
              >Get Transactions by Status</v-btn>
            </v-card-text>
          </v-card>
        </v-tab-item>
        
      </v-tabs>
    </v-card>

    <p class="mb-0">Transaction list:</p>

    <v-simple-table fixed-header height="400px">
      <template v-slot:default>
        <thead>
          <tr>
            <th class="text-left">id</th>
            <th class="text-left">payment</th>
            <th class="text-left">Status</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in getResponse" :key="item.id">
            <td>{{ item.id }}</td>
            <td>{{ item.payment }}</td>
            <td>{{ item.Status }}</td>
          </tr>
        </tbody>
      </template>
    </v-simple-table>
  </div>
</template>




<script>
const axios = require("axios");

export default {
  name: "Main",
  data: () => ({
    file: null,
    currency:"USD",
    status:"A",
    dateFrom:"2000-01-24T16:09:15",
    dateTo:"2012-02-24T16:09:15",
    getResponse: null    
  }),

  computed: {
    // cval: function() {
    //   return this.searchPhrase;
    // },
    //     imageGoogleSearch(){
    //       // https://www.google.com/search?q=art+wallpaper&biw=1100&bih=584&tbm=isch&source=lnt&tbs=isz:ex,iszw:1920,iszh:1080
    // return "https://www.google.com/search?biw=1100&bih=584&tbm=isch&source=lnt&tbs=isz:ex,iszw:1920,iszh:1080&q=;"+articleTitle;
    //     },
  },

  methods: {
    upload() {
      let formData = new FormData();
      formData.append("file", this.file);
      console.log(">> formData >> ", formData);

      // You should have a server side REST API
      axios
        .post("https://localhost:5001/api/Transactions", formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
        .then(response => {
          console.log("SUCCESS!!",response);
          alert("Data successfully uploaded. "+response);
        })
        .catch(error => {
          console.log("FAILURE!!",error.response);
          alert("Error occured while uploading. "+JSON.stringify(error.response.data.errors));
        });
    },
    onFilePicked(file) {
      this.file = file[0];
      console.log("File chosen", this.file);
    },
    getTransactions(url) {
      axios
        .get(url)
        .then(response => {
          this.getResponse = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    }
  },
  mounted: function() {
    console.log("Mounted");
    // https://localhost:5001/api/Transactions
    // https://localhost:5001/api/Transactions/byCurrency/USD

    this.getTransactions("https://localhost:5001/api/Transactions");
  }
};
</script>