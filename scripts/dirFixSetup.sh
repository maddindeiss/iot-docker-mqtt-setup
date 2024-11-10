echo "Create subfolders and fix permissions"

for RootFolder in ./services/*/ ; do
    if [ -d "${RootFolder}docker" ]; then
        DockerFolder="${RootFolder}docker/"
        if [ -d "${DockerFolder}" ]; then
            if [ -f "${DockerFolder}dirFix.sh" ]; then
                # chmod +x "${DockerFolder}dirFix.sh"
                echo "---------------------------------"
                echo "Running dirFix.sh on $DockerFolder"
                bash "${DockerFolder}dirFix.sh"
            fi
        fi
    fi
done
