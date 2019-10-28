// import * as session from 'browser-store';
// import Cookies from 'universal-cookie';

// class ClientSession {
    
//   static authkey =  "token";
//   static loggedin = null;
//   static cookies = new Cookies();

//   static storeAuth = (value, func, authkey) => {
//     if( !authkey ) 
//       authkey = ClientSession.authkey

//     session.put(authkey, value, (err) => func(err));
//   };

//   static getAuth = (reciverfunc, authkey) => {

//     if (!authkey)
//       authkey = ClientSession.authkey

//     session.get( authkey ,(err, value) => reciverfunc(err, value) );

//   };

//   static removeAuth = (func, authkey) => {
//     if (!authkey)
//       authkey = ClientSession.authkey

//     session.remove(authkey, (err) => {
//       func(err);
//     });
//   };

//   static isLoggedIn = (func, authkey) => {

//     ClientSession.getAuth( (err, value)=> {

//       if(err || !value){
//         func(false);

//       }else {
//         func(true);
//       }

//     },  authkey );

//   };

//   static getToken = (authkey) => {

//     if(ClientSession.isLoggedIn(null, authkey)){

//       ClientSession.getAuth((err, value)=> {
//         if(err){
//           console.error(err);
//           return false;
//         }else {
//           return value.id;
//         }
//       }, authkey)
//     }

//   };

//   static getAccessToken = (callback, authkey) => {

//     ClientSession.isLoggedIn(function (isLoggedIn) {

//       if(isLoggedIn){

//         ClientSession.getAuth((err, value)=> {
//           if(err){
//             console.error(err);
//             callback(false, err);
//           }else {
//             callback(true, value)
//           }
//         }, authkey)

//       }else{
//         callback(false, null);
//       }
//     }, authkey);

//   };
// }

// export default ClientSession;