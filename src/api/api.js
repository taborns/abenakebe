/**
 * Created by pc on 4/7/18. */
 import axios from "axios";
// import ClientSession from "./client-session.js";
 
 // let API_BASE_URL = 'https://vere-api.herokuapp.com/api/';
 // let API_BASE_URL = "http://173.249.18.184:7878/api/";
let API_BASE_URL = "http://localhost:8000"
 //let API_BASE_URL = "http://157.245.14.8:7001";
 // let API_BASE_URL = "http://192.168.1.153:7878/api/";
 // let API_BASE_URL = "http://192.168.1.106:7878/api/";


export default class Api {
  
  static API_BASE_URL = API_BASE_URL;


  static getData(method, param) {

    let url = API_BASE_URL +'/' + method + '/'
    
    if( param)
      url +=param
    
    return new Promise(function(resolve, reject) {
        
        axios
          .get(url)
          .then(response => {
            resolve(response.data);
            
          })
          .catch(error => {
            console.log("ERRORS HERE", error)
            reject(error);
          });


    });//promise

  }

}

