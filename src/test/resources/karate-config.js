function fn() {
	var env = karate.env; // get java system property 'karate.env'
	karate.log('karate.env system property was:', env);
	if (!env) {
		env = 'qa';
	}
	var config = {
		appId : 'my.app.id',
		appSecret : 'my.secret',
		demoBaseUrl : 'https://google.com',
		anotherUrlBase : 'https://another-host.com/v1/'
	};

	// setting up the env switching based on environment provided karate.env
	config.environment = karate.read("classpath:environments/" + env
			+ "Environment.json")

	// don't waste time waiting for a connection or if servers don't respond within 5 seconds
	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	karate.configure('ssl',true);
	return config;
}