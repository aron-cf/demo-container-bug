Starts the minimal example with two versions of wrangler 4.72.0 and 7.73.0 then curls the /container/1. endpoint.

Run `./test.sh`

Expected output:

```
% ./test.sh

added 4 packages, removed 2 packages, and changed 2 packages in 2s
Starting web server (logging to wrangler-4.72.0.log)...
Polling http://localhost:8787...
..Hi, I'm a container and this is my message: "I was passed in via the container class!", my instance ID is: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
--- Cleaning up: Killing process 3658 ---

added 2 packages, removed 4 packages, and changed 2 packages in 2s
Starting web server (logging to wrangler-4.73.0.log)...
Polling http://localhost:8787...
..Hi, I'm a container and this is my message: "I was passed in via the container class!", my instance ID is: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
--- Cleaning up: Killing process 3675 ---
```

Actual output:

```
% ./test.sh

added 4 packages, removed 2 packages, and changed 2 packages in 2s
Starting web server (logging to wrangler-4.72.0.log)...
Polling http://localhost:8787...
..Hi, I'm a container and this is my message: "I was passed in via the container class!", my instance ID is: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
--- Cleaning up: Killing process 3658 ---

added 2 packages, removed 4 packages, and changed 2 packages in 2s
Starting web server (logging to wrangler-4.73.0.log)...
Polling http://localhost:8787...
.Failed to start container: Monitoring container failed with: 404 {"message":"No such container: workerd-demo-container-example-MyContainer-26f89d1e69576b04dfc093d3bd3d18fc4e86ff9164f4757529898cac9721acf0"}

--- Cleaning up: Killing process 3884 ---
```
