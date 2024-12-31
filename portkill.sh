# Write a sh script to kill the application running on port 4000 in linux ubuntu
PORT=4000
PID=$(lsof -t -i:$PORT)
if [ -n "$PID" ]; then
    kill -9 $PID
    echo "Killed process running on port $PORT"
else
    echo "No process running on port $PORT"
fi