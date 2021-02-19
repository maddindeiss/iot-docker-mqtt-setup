echo "Create subfolders and fix permissions"

[ -d ./volumes ] || mkdir ./volumes
[ -d ./backups ] || mkdir ./backups

for DockerFolder in "./docker"/*/ ; do
    if [ -d ${DockerFolder} ]; then
        echo "$DockerFolder"
        if [ -f $DockerFolder/dirFix.sh ]; then
            # chmod +x $DockerFolder/dirFix.sh
            echo "Running dirFix.sh on $DockerFolder"
            bash $DockerFolder/dirFix.sh
	    fi
    fi
done
