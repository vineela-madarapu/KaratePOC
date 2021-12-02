function() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
//  var config = {
//    env: env,
////	baseURL: 'someValue'
//  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
        baseURL = 'https://reqres.in'

  } else if (env == 'e2e') {
    baseURL = 'https://reqres.in'
  }
//  return config;
}