import ballerina/http;
import ballerinax/docker;

endpoint http:Listener listener {
    port:9090
};

@docker:Config {
    name: "pzfreo/btest",
    buildImage: false
}
service<http:Service> hello bind listener {
    hi (endpoint caller, http:Request request) {
        _ = caller -> respond("Hello World");
    }
}