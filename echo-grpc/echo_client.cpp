#include <iostream>
#include <memory>
#include <string>

#include "echo-grpc/proto/echo.grpc.pb.h"

#include <grpc/grpc.h>
#include <grpcpp/create_channel.h>

using grpc::Channel;
using grpc::ClientContext;

using echo::Content;
using echo::Echo;

int main(int argc, char **argv) {
  if (argc < 3) {
    std::cout << "Usage: " << basename(argv[0]) << " <host> <port>"
              << std::endl;
    return 1;
  }

  auto host = std::string(argv[1]);
  auto port = std::string(argv[2]);
  auto endpoint = host + ":" + port;

  auto channel =
      grpc::CreateChannel(endpoint, grpc::InsecureChannelCredentials());
  std::unique_ptr<Echo::Stub> echo(Echo::NewStub(channel));
  ClientContext cc;
  Content req;
  req.set_text("dupa");
  Content resp;
  auto status = echo->Echo(&cc, req, &resp);
  if (status.ok()) {
    std::cout << resp.text() << std::endl;
  } else {
    std::cout << "Error after call" << std::endl;
  }
  return 0;
}
