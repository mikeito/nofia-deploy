#!/bin/bash

### Remove all containers locally
# docker kill $(docker ps -aq) && docker rm -v -f $(docker ps -qa)

# Run Nofia deploy.sh
echo "### Preparing Nofia ###"
cd /home/mike/Documents/GitHub/NofiaPay
./deploy.sh

# Check if the 1 script ran successfully
if [ $? -ne 0 ]; then
    echo "/home/mike/Documents/GitHub/NofiaPay/deploy.sh failed!"
    exit 1
fi

# Run  Auth deploy.sh
echo "### Preparing Auth ###"
cd /home/mike/Documents/GitHub/Auth-microservice
./deploy.sh

# Check if the 2 script ran successfully
if [ $? -ne 0 ]; then
    echo "/home/mike/Documents/GitHub/Auth-microservice/deploy.sh failed!"
    exit 1
fi

# Run Gateway deploy.sh
echo "### Preparing Gateway ###"
cd /home/mike/Documents/GitHub/Api-Gateway-MS
./deploy.sh

# Check if the 3 script ran successfully
if [ $? -ne 0 ]; then
    echo "/home/mike/Documents/GitHub/Api-Gateway-MS/deploy.sh failed!"
    exit 1
fi

echo "All scripts executed successfully!"








## Deployment processs

# #!/bin/bash

# REMOTE_USER="itoli_michel"
# REMOTE_HOST="148.113.191.174"
# REMOTE_PATH="/home/itoli_michel/projects"
# REMOTE_PASSWORD="itoli_michel"  # Replace with your actual password

# # Function to run commands on the remote server using sshpass
# run_remote_command() {
#     sshpass -p "$REMOTE_PASSWORD" ssh -o StrictHostKeyChecking=no "$REMOTE_USER@$REMOTE_HOST" "$@"
# }

# # Create the remote /projects directory if it doesn't exist
# echo "### Creating remote projects directory ###"
# run_remote_command "mkdir -p $REMOTE_PATH"

# # Check if the remote directory creation was successful
# if run_remote_command "test -d $REMOTE_PATH"; then
#     echo "Directory $REMOTE_PATH exists."
# else
#     echo "Failed to create directory $REMOTE_PATH. Exiting..."
#     exit 1
# fi

# # Copy NofiaPay
# echo "### Copying NofiaPay ###"
# sshpass -p "$REMOTE_PASSWORD" scp -r -o StrictHostKeyChecking=no "/home/mike/Documents/GitHub/NofiaPay/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH/NofiaPay"

# # Check if the copy command ran successfully
# if [ $? -ne 0 ]; then
#     echo "Copying NofiaPay failed!"
#     exit 1
# fi

# # Change ownership of the copied files
# echo "### Changing ownership of NofiaPay ###"
# run_remote_command "chown -R $REMOTE_USER:$REMOTE_USER $REMOTE_PATH/NofiaPay"

# # Copy Auth-microservice
# echo "### Copying Auth-microservice ###"
# sshpass -p "$REMOTE_PASSWORD" scp -r -o StrictHostKeyChecking=no "/home/mike/Documents/GitHub/Auth-microservice/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH/Auth-microservice"

# # Check if the copy command ran successfully
# if [ $? -ne 0 ]; then
#     echo "Copying Auth-microservice failed!"
#     exit 1
# fi

# # Change ownership of the copied files
# echo "### Changing ownership of Auth-microservice ###"
# run_remote_command "chown -R $REMOTE_USER:$REMOTE_USER $REMOTE_PATH/Auth-microservice"

# # Copy Api-Gateway-MS
# echo "### Copying Api-Gateway-MS ###"
# sshpass -p "$REMOTE_PASSWORD" scp -r -o StrictHostKeyChecking=no "/home/mike/Documents/GitHub/Api-Gateway-MS/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH/Api-Gateway-MS"

# # Check if the copy command ran successfully
# if [ $? -ne 0 ]; then
#     echo "Copying Api-Gateway-MS failed!"
#     exit 1
# fi

# # Change ownership of the copied files
# echo "### Changing ownership of Api-Gateway-MS ###"
# run_remote_command "chown -R $REMOTE_USER:$REMOTE_USER $REMOTE_PATH/Api-Gateway-MS"

# echo "All projects copied successfully!"

# # Run deployment commands on the remote server
# echo "### Running deployment scripts on the remote server ###"
# run_remote_command "cd $REMOTE_PATH/NofiaPay && ./deploy.sh"
# run_remote_command "cd $REMOTE_PATH/Auth-microservice && ./deploy.sh"
# run_remote_command "cd $REMOTE_PATH/Api-Gateway-MS && ./deploy.sh"

# echo "Deployment scripts executed successfully!"
