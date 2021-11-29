#!/usr/bin/env bash


for last; do true; done

servercommand=$last


servercommandlist=( stop start restart remove clean install )

is_servercommand_present="n"

for item in "${servercommandlist[@]}"
do
if [ "$item" = "$servercommand" ]; then
is_servercommand_present="y"
fi
done


if [ "$is_servercommand_present" = "y" ]; then
echo "This execution is for $servercommand operation"
else
echo "The operation is not valid"
exit 1
fi

is_start="n"
is_stop="n"
is_restart="n"
is_remove="n"
is_clean="n"
is_install="n"

case "$servercommand" in

     "start") echo "case start"
              is_start="y"  
     ;;
     "stop") echo "case stop"
              is_stop="y"
     ;;
     "restart") echo "case restart"
              is_restart="y"
     ;;
     "remove") echo "case remove"
              is_stop="y"
              is_remove="y"
     ;;
     "clean") echo "case clean"
              is_stop="y"
              is_remove="y"
              is_clean="y"
      ;;
     "install") echo "case install"
              is_install="y"
esac


#declaring micro service names and corresponding associative array for short code mapping
services=( gateway apigateway usermanagement apdu ca biometricverification reportsmanagement notificationservice )
declare -A service_map=( [gw]=gateway [ag]=apigateway [um]=usermanagement [ap]=apdu [ca]=ca [bv]=biometricverification [rm]=reportsmanagement [ns]=notificationservice )


scripts_path="/home/ec2-user/meetid/docker_scripts/meetid_docker_hub_scripts/"

cd "$scripts_path"
. ./.env


echo "Deploying Docker Containers.."


run_service()
{
echo "**************************************************************************"
echo "Entering run_service for $1"


if [ "$is_stop" = "y" ]; then
echo "stopping docker container.."
sudo docker stop "$1" 2>/dev/null
fi

if [ "$is_start" = "y" ]; then
echo "start docker container.."
sudo docker start "$1" 2>/dev/null
fi

if [ "$is_restart" = "y" ]; then
echo "restart docker container.."
sudo docker restart "$1" 2>/dev/null
fi


if [ "$is_remove" = "y" ]; then
echo "removing docker container.."
sudo docker rm "$1" 2>/dev/null
fi

if [ "$is_clean" = "y" ]; then
echo "removing docker image.."
sudo docker rmi meetidentity/meetidentity_images:"$1"_latest_"$branch" 2>/dev/null
fi

if [ "$is_install" = "y" ]; then
echo "installing docker container.."
sudo docker-compose -f docker-compose-"$1".yml up -d


 if [[ "$1" == "gateway" || "$1" == "apigateway" || "$1" == "usermanagement" ]]; then
  echo "registering ssl certificates.."
  sudo docker cp meetidentity_cert.cer "$1":/etc/ssl/
  sudo docker exec -it "$1" keytool -import -trustcacerts -file /etc/ssl/meetidentity_cert.cer -alias sectigo_ca -keystore /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/cacerts -storepass changeit -noprompt
 fi

fi
echo "Completed run_service for $1"
echo "****************************************************************************"
  
}


is_servicename_valid(){

echo "entered is_servicename_valid to verify if $1 is a valid service name"
is_matched="n"

for item in "${services[@]}"
 do
   if [ "$item" = "$1" ]; then
     is_matched="y"
     echo "service name matched in services array"
   fi
 done

if [ "$is_matched" = "n" ];then
   for key in "${!service_map[@]}"
   do
     if [ "$key" = "$1" ]; then
       is_matched="y"
       echo "service name matched in service_map"
     fi
   done
fi

if [ "$is_matched" = "y" ]; then
 return 0
else
 return 1
fi

}




all_exists="n"


arguments=( "$@" )
unset "arguments[${#arguments[@]}-1]"


for argument in "${arguments[@]}"
 do
  if [ "$argument" = "all" ]; then
    all_exists="y"
  fi
 done

echo "value of all_exists is $all_exists"

if [ "$all_exists" = "y" ]; then

  echo "Running all docker services"
  for service in "${services[@]}"
       do
         echo "calling run_service for $service.."
         run_service "$service"
       done

else
  echo "running individual services based on the arguments.."
  for argument in "${arguments[@]}"
    do
      echo "received argument is $argument"
      servicename=$argument
      if is_servicename_valid "$servicename"; then
         for key in "${!service_map[@]}"
            do
              if [ "$key" = "$servicename" ]; then
                 servicename="${service_map[$key]}"
              fi 
            done
         echo "calling run_service for $servicename.."
         run_service "$servicename"
      else
         echo "service name $servicename is not valid.." 
      fi
    done
fi
