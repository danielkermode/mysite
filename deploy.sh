serviceId="33932a9d"

if [ "$2" = "fast" ]
then
  docker run --env-file secrets/Dockercreds dockercloud/cli service redeploy $serviceId
else
  git add .
  git commit -m "$1"
  git push origin master
  docker build -t absurdisms/daniel:latest .
  docker push absurdisms/daniel:latest
  docker run --env-file secrets/Dockercreds dockercloud/cli service redeploy $serviceId
fi
