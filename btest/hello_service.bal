import ballerina/http;
import ballerinax/docker;

endpoint http:Listener listener {
    port:9090
};

@docker:Config {
    name: "pzfreo/btest" ,
    buildImage: false
}
@http:ServiceConfig {
    basePath: "/"
}
service<http:Service> hello bind listener {
    @http:ResourceConfig {
        path: "/"
    }
    
    hi (endpoint caller, http:Request request) {
        _ = caller -> respond("Hello World\n");
    }
}
