# ACS Builders
Docker images used to build ACS on Jenkins.

To run the container use:

``` bash
docker run --rm -v "$REPO_PATH":/ACS -v $OUTPUT_DIR:/alma -h localhost -e ACS_RETAIN=$ACS_RETAIN -e JAVA_HOME=$JAVA_HOME csrg/acs_builder:$SO ./script.sh
```

## Parameters
To have the same files each build, we need to mount the following folders:
- **REPO_PATH:** path to ACS Repository. (Uses /ACS inside container).
- **ROUTPUT_DIR:** path to Output Directory. (Uses the default /alma inside container).

Also we need to give the environment variables:
- **ACS_RETAIN=1**, to overwrite the *JAVA_HOME*
- **JAVA_HOME**, using the openjdk package so we need to give `/usr/lib/jvm/java-1.8.0-openjdk.x86_64/` for *jdk 1.8* and `/usr/lib/jvm/java-1.7.0-openjdk.x86_64/`

We need to give `-h localhost` otherwise Mico will not compile and Ant will get some test errors.

Finally SO is the docker image tag, using latest or centos7 will run a *Centos 7* container, also we can run *Centos 6.9* using SO=centos6.

## Scripts
The container comes with three scripts
- **build_extprods.sh:** Download and compiles the extprods.
- **build_acs.sh:** Compile the ACSSW.
- **build.sh**: Compile Extprods and ACSSW.
