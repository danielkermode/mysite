serviceId="d62e92a4"

if [ "$2" = "fast" ]
then
  docker run --env-file secrets/Dockercreds dockercloud/cli service redeploy $serviceId
else
  docker build -t absurdisms/daniel:latest .
  docker push absurdisms/daniel:latest
  docker run --env-file secrets/Dockercreds dockercloud/cli service redeploy $serviceId
fi
