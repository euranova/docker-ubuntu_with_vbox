IMAGE_NAME = "enx/ubuntu-vbox"

task :test do
  def build_docker_image
    output = `docker build -t #{IMAGE_NAME} .`
    [output, $?.success?]
  end

  def run_docker_container
    output = `docker run -ti \
              --privileged=true \
              --device=/dev/vboxdrv \
              -v $(pwd):/root/code \
              --entrypoint=/bin/bash \
              #{IMAGE_NAME} \
              /root/code/test_vbox.sh`
    [output, $?.success?]
  end

  print "Building Docker image #{IMAGE_NAME} ... "
  output, success = build_docker_image
  abort("Error:\n#{output}") unless success
  puts "OK"

  print "Running Docker container of #{IMAGE_NAME} ... "
  output, success = run_docker_container
  abort("Error:\n#{output}") unless success
  puts "OK"
end

task :default => :test
