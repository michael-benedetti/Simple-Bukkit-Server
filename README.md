# Simple Bukkit Server

This is a simple bukit server running on alpine linux.  The server includes WorldGuard and WorldEdit plugins. 

## Getting Started

Run the build script with rcon password and minecraft revision as arguments
 - example:
 
 `./build.sh password 1.14.4`
 
 
The result will be a Docker image with the following tag: `egdetti/bukkit:1.14.4-alpine`

## Running the container
`docker run -dit -p 25565:25565 -p 25575:25575 --restart=always egdetti/bukkit:1.14.4-alpine`
