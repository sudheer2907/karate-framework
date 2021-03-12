function fn() {   
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'qa'; // a custom 'qa' default
  }
  var config = { // base config JSON
    appId: 'my.app.id',
    appSecret: 'my.secret',
    demoBaseUrl: 'https://google.com',
    anotherUrlBase: 'https://another-host.com/v1/',
	itbBaseUrl: 'https://live-beta-v4.itboost.com/login'
  };

   // setting up the env switching based on environment provided karate.env
	config.environment = karate.read( "environments/"+env + "Environment.json")

  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}