#include <iostream>
#include <memory>
#include <string>

#include "echo-grpc/proto/echo.grpc.pb.h"

#include <grpc/grpc.h>
#include <grpcpp/security/server_credentials.h>
#include <grpcpp/server.h>
#include <grpcpp/server_builder.h>
#include <grpcpp/server_context.h>

using grpc::Server;
using grpc::ServerBuilder;
using grpc::ServerContext;
using grpc::Status;

using echo::Content;
using echo::Echo;

class EchoImpl final : public Echo::Service {
public:
  Status Echo(ServerContext *context, const Content *req,
              Content *resp) override {
    resp->set_text(req->text());
    return Status::OK;
  }
};

int main(int argc, char **argv) {
  if (argc < 2) {
    std::cout << "Usage: " << basename(argv[0]) << " <port>" << std::endl;
    return 1;
  } 

  std::string host("0.0.0.0");
  std::string port(argv[1]);
  auto server_address = host + ":" + port;
  EchoImpl service;

  ServerBuilder builder;
  builder.AddListeningPort(server_address, grpc::InsecureServerCredentials());
  builder.RegisterService(&service);
  std::unique_ptr<Server> server(builder.BuildAndStart());
  std::cout << "Server listening on " << server_address << std::endl;
  server->Wait();
  return 0;
}
