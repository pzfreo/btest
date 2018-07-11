import ballerina/http;
import ballerinax/kubernetes;


@kubernetes:Service {
   serviceType:"LoadBalancer",
   name:"btest"
}

endpoint http:Listener listener {
    port:9090
};


@kubernetes:Deployment {
   image: "pzfreo/btest",
   name: "btest",
   buildImage: false
}
service<http:Service> hello bind listener {
    hi (endpoint caller, http:Request request) {
        _ = caller -> respond("Hello World");
    }
}