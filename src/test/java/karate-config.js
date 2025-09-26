function fn() {
    var env = karate.env; // get system property 'karate.env'

    var config = { env: env }
    var headers = {"cache-control": "no-cache"}
    karate.configure('ssl', true)
    if (!env) {env = 'dev'; }
    switch(env){
        case 'uat':
            config = karate.read('classpath:br/com/vale/support/config/basicURL.yaml')['uat']
            break;
        case 'qa':
            config = karate.read('classpath:br/com/vale/support/config/basicURL.yaml')['qa']
            break;
        case 'dev':
            config = karate.read('classpath:br/com/vale/support/config/basicURL.yaml')['dev']
            break;
        default:

    }

    karate.log('karate.env system property was:', env);
    karate.configure('headers', headers);
    karate.configure('retry',  {count:10, interval: 5000});
    return config;
}