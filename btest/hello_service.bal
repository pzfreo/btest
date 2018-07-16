import ballerina/http;
import ballerinax/docker;
import ballerina/config;

endpoint http:Listener listener {
    port:9090
};

@docker:Config {
    name: "pzfreo/btest",
    buildImage: false
}
@docker:CopyFiles {
    files: [
        { source: "/Users/paul/demo/twitter.toml", target: "/home/ballerina/conf/twitter.toml", isBallerinaConf: true}
    ]
}
@http:ServiceConfig {
    basePath: "/"
}
service<http:Service> hello bind listener {
    @http:ResourceConfig {
        path: "/"
    }
    
    hi (endpoint caller, http:Request request) {
        
        _ = caller -> respond("Hello Kubernetes World\n");
    }
}