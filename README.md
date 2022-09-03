# Rce Bot
[![Build](https://github.com/D2ans0/rce-bot-vk-pipelines/actions/workflows/build.yml/badge.svg)](https://github.com/D2ans0/rce-bot-vk-pipelines/actions/workflows/build.yml)
[![CodeQL](https://github.com/D2ans0/rce-bot-vk-pipelines/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/D2ans0/rce-bot-vk-pipelines/actions/workflows/codeql-analysis.yml)

RceBot group bot repository [https://vk.com/rce_bot](https://vk.com/rce_bot) | [FAQ](https://vk.com/@rce_bot-introduce)

- VK API self-written library
- [SauceNAO](https://saucenao.com/) image reverse search support
- [Agromonitoring](https://agromonitoring.com/) support
- [Openweathermap](https://openweathermap.org/) support
- Allow [to create custom keyboards](https://vk.com/@rce_bot-introduce?anchor=klaviatura)
## Requirements
- JDK 8
- MySQL Server

## Launch options
`-h --help` - Show help

`-c --config [PATH_TO_CONFIG]` - Path to the configuration file (default bot.ini|../bot.ini|../../bot.ini|config/bot.ini)

`-t --token [TOKEN]` - Group token (Permissions: messages, offline) (can be specified in bot.ini)

`-lp --longpoll` - Use Long Polling to receive a messages (Default)

`-cb --callback [TOKEN]` - Use Call Back to receive a message

`-cd --confirmcode [value]` - Confirmation to add server to the CallBack API (get value from the group API administration panel in VK)

`-tm --test --testmode` - Test Mode, don't sends logs, reply only to admin

`-n --names [PATH_TO_FILE]` Path to file with the names (regex) that the bot responds to, separated by commas

`-aid --adminid [ADMIN_ID]` - Admin ID (e.g. your VK page's ID)

`-v --apiversion [VERSION]` - set VK API version (default 5.130)

## Running
### On the host
0) Install pre-requisites, MySQL and JDK8 or JRE8
1) Download the latest release from the [Releases tab](https://github.com/petya136900/rce-bot-vk/releases)
2) Unpack the release
3) Specify your options in config/bot.ini
4) If your database is not running yet, start now
5) Start the bot by running:
```
java -jar RceBot-*-RELEASE.jar
```


### In a Docker container
0) If you don't have docker, install it
1) Download the latest docker release from the [Releases tab](https://github.com/petya136900/rce-bot-vk/releases) (DockerHub will be implemented at a later date)
2) Unpack the release
3) Specify your options in config/bot.ini
4) Get and start the database container (this is optional, you can run it directly on the host)
```
docker run -d \
--env MYSQL_PORT=3306 \
--env MYSQL_ROOT_PASSWORD=${ROOT_PASSWORD_HERE} \
--env MYSQL_ROOT_HOST=% \
--env MYSQL_USER=${USERNAME_HERE} \
--env MYSQL_PASSWORD=${USER_PASSWORD_HERE} \
mysql:latest
```

5) Load the rce-bot-vk container
```
docker load < rce-bot-vk_docker.tar.gz
```

6) Start the container (append `-tm` to the LAUNCH_ARGS to start in test mode (only responds to admin's messages))
```
docker run -d \
--env JMX_HOST=0.0.0.0
--env JMX_PORT=9010
--env LAUNCH_ARGS= -lp -aid ${ADMIN_ID_HERE}
-v "$PWD/config:/app/config"
```


### Docker-Compose
0) If you don't have docker, install it
1) Download the latest docker release from the [Releases tab](https://github.com/petya136900/rce-bot-vk/releases) (DockerHub will be implemented at a later date)
2) Unpack the release
3) Specify your options in config/bot.ini and docker-compose
4) Run it with:
```
docker-compose up -d
```

NOTE: you can check the logs via: `docker-compose logs` while in the project folder

### Building from sources
0) Install Maven
1) Clone repostitory and move into the directory
```
git clone https://github.com/petya136900/rce-bot-vk.git
cd rce-bot-vk
```

2) Build the project
```
mvn clean package
```

3) Maven will now build and output the app into `./target`


## License

Apache License
